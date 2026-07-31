import uuid
from sqlalchemy.ext.asyncio import AsyncSession
from app.normalization.validator import AIOutputValidator, NormalizationValidationError
from app.normalization.normalizer import ReceiptNormalizer
from app.normalization.materializer import ReceiptMaterializer
from app.repositories.ai_extraction_result_repository import AIExtractionResultRepository
from app.repositories.receipt_repository import ReceiptRepository
from app.repositories.uploaded_file_repository import UploadedFileRepository
from app.repositories.ocr_result_repository import OCRResultRepository
from app.models.receipt import Receipt
from app.models.enums import ProcessingStatus
from app.core.exceptions import ReceiptNotFoundError, RepositoryError

class ReceiptMaterializationService:
    def __init__(
        self,
        session: AsyncSession,
        ai_repo: AIExtractionResultRepository,
        receipt_repo: ReceiptRepository,
        upload_repo: UploadedFileRepository,
        ocr_repo: OCRResultRepository
    ):
        self.session = session
        self.ai_repo = ai_repo
        self.receipt_repo = receipt_repo
        self.upload_repo = upload_repo
        self.ocr_repo = ocr_repo
        
        self.validator = AIOutputValidator()
        self.normalizer = ReceiptNormalizer()
        self.materializer = ReceiptMaterializer()

    async def materialize_receipt(self, ai_extraction_id: uuid.UUID) -> Receipt:
        # Load AI Extraction
        ai_result = await self.ai_repo.get_by_id(ai_extraction_id)
        if not ai_result:
            raise ReceiptNotFoundError(f"AI Extraction {ai_extraction_id} not found.")
            
        if not ai_result.structured_json:
            raise RepositoryError("Cannot materialize without structured_json from AI.")
            
        # Load related entities
        ocr_result = await self.ocr_repo.get_by_id(ai_result.ocr_result_id)
        if not ocr_result:
            raise RepositoryError("OCR Result not found.")
            
        uploaded_file = await self.upload_repo.get_by_id(ocr_result.uploaded_file_id)
        if not uploaded_file:
            raise RepositoryError("UploadedFile not found.")
            
        # Validation
        try:
            proposed = self.validator.validate(ai_result.structured_json)
        except NormalizationValidationError as e:
            raise ValueError(f"AI output validation failed: {str(e)}")
            
        # Normalization
        normalized = self.normalizer.normalize(proposed)
        
        # Materialization
        try:
            receipt = self.materializer.materialize(
                normalized=normalized,
                file_id=uploaded_file.id,
                ocr_id=ocr_result.id,
                ai_id=ai_result.id,
                file_path=uploaded_file.storage_path
            )
            
            # Save receipt
            saved_receipt = await self.receipt_repo.create(receipt)
            
            # Update file status
            uploaded_file.processing_status = ProcessingStatus.MATERIALIZED
            await self.upload_repo.update(uploaded_file)
            
            await self.session.commit()
            await self.session.refresh(saved_receipt)
            return saved_receipt
            
        except Exception as e:
            await self.session.rollback()
            raise RepositoryError(f"Materialization failed: {str(e)}")

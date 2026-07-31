import uuid
from sqlalchemy.ext.asyncio import AsyncSession

from app.ai.base import AIProvider
from app.ai.prompt import PROMPT_VERSION
from app.repositories.ai_extraction_result_repository import AIExtractionResultRepository
from app.repositories.ocr_result_repository import OCRResultRepository
from app.repositories.uploaded_file_repository import UploadedFileRepository
from app.models.ai_extraction_result import AIExtractionResult
from app.models.enums import ProcessingStatus
from app.core.exceptions import ReceiptNotFoundError, RepositoryError

class AIService:
    def __init__(
        self,
        session: AsyncSession,
        provider: AIProvider,
        ai_repo: AIExtractionResultRepository,
        ocr_repo: OCRResultRepository,
        upload_repo: UploadedFileRepository
    ):
        self.session = session
        self.provider = provider
        self.ai_repo = ai_repo
        self.ocr_repo = ocr_repo
        self.upload_repo = upload_repo

    async def process_ocr_result(self, ocr_result_id: uuid.UUID) -> AIExtractionResult:
        ocr_result = await self.ocr_repo.get_by_id(ocr_result_id)
        if not ocr_result:
            raise ReceiptNotFoundError(f"OCR result {ocr_result_id} not found.")

        uploaded_file = await self.upload_repo.get_by_id(ocr_result.uploaded_file_id)
        if not uploaded_file:
            raise RepositoryError(f"Parent UploadedFile {ocr_result.uploaded_file_id} not found.")

        if uploaded_file.processing_status != ProcessingStatus.OCR_COMPLETED:
            raise RepositoryError(f"File {uploaded_file.id} is not in OCR_COMPLETED state.")
            
        # Check if AI extraction already exists
        existing_result = await self.ai_repo.get_by_ocr_result_id(ocr_result_id)
        if existing_result and existing_result.structured_json:
            return existing_result
            
        try:
            # We enforce raw_text to be string
            if not ocr_result.raw_text:
                raise ValueError("OCR result has no raw_text to process.")
                
            extraction = await self.provider.extract_receipt(ocr_result.raw_text, PROMPT_VERSION)
            
            ai_record = AIExtractionResult(
                ocr_result_id=ocr_result_id,
                provider=self.provider.provider_name,
                model=self.provider.model_name,
                prompt_version=PROMPT_VERSION,
                raw_response=extraction.raw_response,
                structured_json=extraction.structured_json,
                processing_time_ms=extraction.processing_time_ms,
                confidence=extraction.confidence,
                token_usage=extraction.token_usage,
                error_message=extraction.error_message
            )
            
            saved_record = await self.ai_repo.create(ai_record)
            
            # Update file status
            uploaded_file.processing_status = ProcessingStatus.AI_COMPLETED
            await self.upload_repo.update(uploaded_file)
            
            await self.session.commit()
            await self.session.refresh(saved_record)
            return saved_record
            
        except Exception as e:
            await self.session.rollback()
            
            ai_record = AIExtractionResult(
                ocr_result_id=ocr_result_id,
                provider=self.provider.provider_name,
                model=self.provider.model_name,
                prompt_version=PROMPT_VERSION,
                error_message=str(e)
            )
            
            self.session.add(ai_record)
            uploaded_file.processing_status = ProcessingStatus.FAILED
            await self.session.commit()
            raise RepositoryError(f"AI extraction failed: {str(e)}")

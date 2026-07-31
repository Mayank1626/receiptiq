import uuid
from sqlalchemy.ext.asyncio import AsyncSession

from app.ocr.base import OCRProvider
from app.repositories.ocr_result_repository import OCRResultRepository
from app.repositories.uploaded_file_repository import UploadedFileRepository
from app.models.ocr_result import OCRResult
from app.models.enums import ProcessingStatus
from app.core.exceptions import ReceiptNotFoundError, RepositoryError

class OCRService:
    def __init__(
        self,
        session: AsyncSession,
        provider: OCRProvider,
        ocr_repo: OCRResultRepository,
        upload_repo: UploadedFileRepository
    ):
        self.session = session
        self.provider = provider
        self.ocr_repo = ocr_repo
        self.upload_repo = upload_repo

    async def process_file(self, uploaded_file_id: uuid.UUID) -> OCRResult:
        uploaded_file = await self.upload_repo.get_by_id(uploaded_file_id)
        if not uploaded_file:
            raise ReceiptNotFoundError(f"Uploaded file {uploaded_file_id} not found.")

        if uploaded_file.processing_status != ProcessingStatus.UPLOADED:
            raise RepositoryError(f"File {uploaded_file_id} is not in UPLOADED state.")
            
        # Check if OCR result already exists
        existing_result = await self.ocr_repo.get_by_file_id(uploaded_file_id)
        if existing_result and existing_result.status == "SUCCESS":
            return existing_result
            
        try:
            extraction_result = await self.provider.extract_text(uploaded_file.storage_path)
            
            ocr_record = OCRResult(
                uploaded_file_id=uploaded_file_id,
                provider=self.provider.provider_name,
                provider_version=self.provider.provider_version,
                status="SUCCESS",
                raw_text=extraction_result.raw_text,
                confidence=extraction_result.confidence,
                processing_time_ms=extraction_result.processing_time_ms,
                error_message=extraction_result.error_message
            )
            
            saved_record = await self.ocr_repo.create(ocr_record)
            
            # Update file status
            uploaded_file.processing_status = ProcessingStatus.OCR_COMPLETED
            await self.upload_repo.update(uploaded_file)
            
            await self.session.commit()
            await self.session.refresh(saved_record)
            return saved_record
            
        except Exception as e:
            await self.session.rollback()
            
            ocr_record = OCRResult(
                uploaded_file_id=uploaded_file_id,
                provider=self.provider.provider_name,
                provider_version=self.provider.provider_version,
                status="FAILED",
                error_message=str(e)
            )
            
            self.session.add(ocr_record)
            uploaded_file.processing_status = ProcessingStatus.FAILED
            await self.session.commit()
            raise RepositoryError(f"OCR processing failed: {str(e)}")

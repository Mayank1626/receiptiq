from fastapi import Depends
from sqlalchemy.ext.asyncio import AsyncSession
from app.db.session import get_db
from app.repositories.receipt_repository import ReceiptRepository
from app.repositories.receipt_item_repository import ReceiptItemRepository
from app.services.receipt_service import ReceiptService

def get_receipt_repository(session: AsyncSession = Depends(get_db)) -> ReceiptRepository:
    return ReceiptRepository(session)

def get_receipt_item_repository(session: AsyncSession = Depends(get_db)) -> ReceiptItemRepository:
    return ReceiptItemRepository(session)

def get_receipt_service(
    session: AsyncSession = Depends(get_db),
    receipt_repo: ReceiptRepository = Depends(get_receipt_repository),
    item_repo: ReceiptItemRepository = Depends(get_receipt_item_repository)
) -> ReceiptService:
    return ReceiptService(
        session=session,
        receipt_repo=receipt_repo,
        item_repo=item_repo
    )

from app.repositories.uploaded_file_repository import UploadedFileRepository
from app.services.upload_service import UploadService
from app.storage.base import StorageProvider
from app.storage.local import LocalStorageProvider

def get_storage_provider() -> StorageProvider:
    return LocalStorageProvider()

def get_uploaded_file_repository(session: AsyncSession = Depends(get_db)) -> UploadedFileRepository:
    return UploadedFileRepository(session)

def get_upload_service(
    session: AsyncSession = Depends(get_db),
    provider: StorageProvider = Depends(get_storage_provider),
    repository: UploadedFileRepository = Depends(get_uploaded_file_repository)
) -> UploadService:
    return UploadService(session, provider, repository)

from app.ocr.base import OCRProvider
from app.ocr.mock import MockOCRProvider
from app.repositories.ocr_result_repository import OCRResultRepository
from app.services.ocr_service import OCRService

def get_ocr_provider() -> OCRProvider:
    return MockOCRProvider()

def get_ocr_result_repository(session: AsyncSession = Depends(get_db)) -> OCRResultRepository:
    return OCRResultRepository(session)

def get_ocr_service(
    session: AsyncSession = Depends(get_db),
    provider: OCRProvider = Depends(get_ocr_provider),
    ocr_repo: OCRResultRepository = Depends(get_ocr_result_repository),
    upload_repo: UploadedFileRepository = Depends(get_uploaded_file_repository)
) -> OCRService:
    return OCRService(session, provider, ocr_repo, upload_repo)

from app.ai.base import AIProvider
from app.ai.gemini import GeminiAIProvider
from app.repositories.ai_extraction_result_repository import AIExtractionResultRepository
from app.services.ai_service import AIService

def get_ai_provider() -> AIProvider:
    return GeminiAIProvider()

def get_ai_result_repository(session: AsyncSession = Depends(get_db)) -> AIExtractionResultRepository:
    return AIExtractionResultRepository(session)

def get_ai_service(
    session: AsyncSession = Depends(get_db),
    provider: AIProvider = Depends(get_ai_provider),
    ai_repo: AIExtractionResultRepository = Depends(get_ai_result_repository),
    ocr_repo: OCRResultRepository = Depends(get_ocr_result_repository),
    upload_repo: UploadedFileRepository = Depends(get_uploaded_file_repository)
) -> AIService:
    return AIService(session, provider, ai_repo, ocr_repo, upload_repo)

from app.services.receipt_materialization_service import ReceiptMaterializationService
from app.repositories.receipt_repository import ReceiptRepository

def get_receipt_materialization_service(
    session: AsyncSession = Depends(get_db),
    ai_repo: AIExtractionResultRepository = Depends(get_ai_result_repository),
    receipt_repo: ReceiptRepository = Depends(get_receipt_repository),
    upload_repo: UploadedFileRepository = Depends(get_uploaded_file_repository),
    ocr_repo: OCRResultRepository = Depends(get_ocr_result_repository)
) -> ReceiptMaterializationService:
    return ReceiptMaterializationService(session, ai_repo, receipt_repo, upload_repo, ocr_repo)

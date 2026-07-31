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

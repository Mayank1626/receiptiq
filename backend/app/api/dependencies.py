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

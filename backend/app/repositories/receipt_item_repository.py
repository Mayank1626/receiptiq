from typing import Sequence
from uuid import UUID
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.receipt_item import ReceiptItem
from app.repositories.base import BaseRepository

class ReceiptItemRepository(BaseRepository[ReceiptItem]):
    def __init__(self, session: AsyncSession):
        super().__init__(ReceiptItem, session)

    async def create(self, item: ReceiptItem) -> ReceiptItem:
        self.session.add(item)
        await self.session.flush()
        await self.session.refresh(item)
        return item

    async def list_by_receipt(self, receipt_id: UUID) -> Sequence[ReceiptItem]:
        stmt = select(self.model).where(self.model.receipt_id == receipt_id)
        result = await self.session.execute(stmt)
        return result.scalars().all()

    async def delete(self, item: ReceiptItem) -> None:
        await self.session.delete(item)
        await self.session.flush()

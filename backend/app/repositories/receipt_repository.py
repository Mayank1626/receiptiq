from typing import Sequence
from uuid import UUID
from sqlalchemy import select
from sqlalchemy.orm import selectinload
from sqlalchemy.ext.asyncio import AsyncSession

from app.models.receipt import Receipt
from app.repositories.base import BaseRepository

class ReceiptRepository(BaseRepository[Receipt]):
    def __init__(self, session: AsyncSession):
        super().__init__(Receipt, session)

    async def create(self, receipt: Receipt) -> Receipt:
        self.session.add(receipt)
        await self.session.flush()
        await self.session.refresh(receipt)
        return receipt

    async def get_by_id(self, receipt_id: UUID) -> Receipt | None:
        stmt = (
            select(self.model)
            .where(self.model.id == receipt_id)
            .options(selectinload(self.model.items))
        )
        result = await self.session.execute(stmt)
        return result.scalar_one_or_none()

    async def list(self, skip: int = 0, limit: int = 100) -> Sequence[Receipt]:
        stmt = (
            select(self.model)
            .options(selectinload(self.model.items))
            .offset(skip)
            .limit(limit)
        )
        result = await self.session.execute(stmt)
        return result.scalars().all()

    async def update(self, receipt: Receipt) -> Receipt:
        # The receipt instance must be attached to the current session.
        # Calling flush will push the updates to the database without committing.
        await self.session.flush()
        await self.session.refresh(receipt)
        return receipt

    async def delete(self, receipt: Receipt) -> None:
        await self.session.delete(receipt)
        await self.session.flush()

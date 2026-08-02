from typing import Sequence
from uuid import UUID
from datetime import datetime
from decimal import Decimal
from app.models.enums import ReceiptStatus
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

    async def get_by_id(
        self, 
        receipt_id: UUID,
        owner_id: UUID | None = None,
        household_ids: list[UUID] | None = None
    ) -> Receipt | None:
        stmt = (
            select(self.model)
            .where(self.model.id == receipt_id)
            .options(selectinload(self.model.items))
        )
        
        if owner_id is not None:
            from sqlalchemy import or_, and_
            conditions = [self.model.owner_id == owner_id]
            if household_ids:
                conditions.append(self.model.household_id.in_(household_ids))
            conditions.append(and_(self.model.owner_id.is_(None), self.model.household_id.is_(None)))
            stmt = stmt.where(or_(*conditions))
            
        result = await self.session.execute(stmt)
        return result.scalar_one_or_none()

    async def list(
        self, 
        skip: int = 0, 
        limit: int = 100,
        status: ReceiptStatus | None = None,
        store_name: str | None = None,
        start_date: datetime | None = None,
        end_date: datetime | None = None,
        min_total: Decimal | None = None,
        max_total: Decimal | None = None,
        owner_id: UUID | None = None,
        household_ids: list[UUID] | None = None
    ) -> Sequence[Receipt]:
        stmt = select(self.model).options(selectinload(self.model.items))
        
        if status:
            stmt = stmt.where(self.model.status == status)
        if store_name:
            stmt = stmt.where(self.model.store_name.ilike(f"%{store_name}%"))
        if start_date:
            stmt = stmt.where(self.model.date >= start_date)
        if end_date:
            stmt = stmt.where(self.model.date <= end_date)
        if min_total is not None:
            stmt = stmt.where(self.model.total_amount >= min_total)
        if max_total is not None:
            stmt = stmt.where(self.model.total_amount <= max_total)
            
        if owner_id is not None:
            from sqlalchemy import or_, and_
            conditions = [self.model.owner_id == owner_id]
            if household_ids:
                conditions.append(self.model.household_id.in_(household_ids))
            conditions.append(and_(self.model.owner_id.is_(None), self.model.household_id.is_(None)))
            stmt = stmt.where(or_(*conditions))
            
        stmt = stmt.offset(skip).limit(limit).order_by(self.model.created_at.desc())
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

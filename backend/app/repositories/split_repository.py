from typing import List, Optional
from uuid import UUID
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select, update
from sqlalchemy.orm import selectinload

from app.models.expense_split import ExpenseSplit
from app.models.expense_share import ExpenseShare
from app.models.receipt import Receipt
from app.models.enums import SplitStatus

class SplitRepository:
    def __init__(self, session: AsyncSession):
        self.session = session

    async def create(self, split: ExpenseSplit) -> ExpenseSplit:
        self.session.add(split)
        await self.session.flush()
        # Refresh to eager load shares
        await self.session.refresh(split)
        return split

    async def get_by_receipt_id(self, receipt_id: UUID) -> Optional[ExpenseSplit]:
        stmt = (
            select(ExpenseSplit)
            .options(selectinload(ExpenseSplit.shares))
            .where(
                ExpenseSplit.receipt_id == receipt_id,
                ExpenseSplit.status == SplitStatus.ACTIVE
            )
        )
        result = await self.session.execute(stmt)
        return result.scalars().first()
        
    async def get_active_splits_for_household(self, household_id: UUID) -> List[ExpenseSplit]:
        stmt = (
            select(ExpenseSplit)
            .join(Receipt)
            .options(selectinload(ExpenseSplit.shares))
            .where(
                Receipt.household_id == household_id,
                ExpenseSplit.status == SplitStatus.ACTIVE
            )
            .order_by(ExpenseSplit.created_at.desc())
        )
        result = await self.session.execute(stmt)
        return list(result.scalars().all())

    async def update_status_for_receipt(self, receipt_id: UUID, status: SplitStatus) -> None:
        """Updates all splits for a receipt to a given status (useful for invalidation)."""
        stmt = (
            update(ExpenseSplit)
            .where(ExpenseSplit.receipt_id == receipt_id)
            .values(status=status)
        )
        await self.session.execute(stmt)
        await self.session.flush()

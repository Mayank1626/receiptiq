from typing import List, Optional
from uuid import UUID
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select

from app.models.settlement import Settlement
from app.models.enums import SettlementStatus

class SettlementRepository:
    def __init__(self, session: AsyncSession):
        self.session = session

    async def create(self, settlement: Settlement) -> Settlement:
        self.session.add(settlement)
        await self.session.flush()
        await self.session.refresh(settlement)
        return settlement

    async def get_by_id(self, settlement_id: UUID) -> Optional[Settlement]:
        stmt = select(Settlement).where(Settlement.id == settlement_id)
        result = await self.session.execute(stmt)
        return result.scalars().first()

    async def get_by_household(self, household_id: UUID, status: Optional[SettlementStatus] = None) -> List[Settlement]:
        stmt = (
            select(Settlement)
            .where(Settlement.household_id == household_id)
            .order_by(Settlement.created_at.desc())
        )
        if status:
            stmt = stmt.where(Settlement.status == status)
            
        result = await self.session.execute(stmt)
        return list(result.scalars().all())

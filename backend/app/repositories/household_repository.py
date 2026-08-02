from sqlalchemy import select, delete
from sqlalchemy.orm import selectinload
from sqlalchemy.ext.asyncio import AsyncSession
from typing import List, Optional
from uuid import UUID

from app.models.household import Household
from app.models.household_member import HouseholdMember
from app.models.household_invitation import HouseholdInvitation
from app.models.user import User

class HouseholdRepository:
    def __init__(self, session: AsyncSession):
        self.session = session
        
    async def create(self, household: Household) -> Household:
        self.session.add(household)
        await self.session.flush()
        return household
        
    async def get_by_id(self, household_id: UUID) -> Optional[Household]:
        stmt = select(Household).options(
            selectinload(Household.members).selectinload(HouseholdMember.user)
        ).where(Household.id == household_id)
        result = await self.session.execute(stmt)
        return result.scalars().first()
        
    async def get_for_user(self, user_id: UUID) -> List[Household]:
        stmt = select(Household).join(HouseholdMember).options(
            selectinload(Household.members).selectinload(HouseholdMember.user)
        ).where(HouseholdMember.user_id == user_id)
        result = await self.session.execute(stmt)
        return list(result.scalars().unique().all())
        
    async def update(self, household: Household) -> Household:
        self.session.add(household)
        await self.session.flush()
        return household
        
    async def delete(self, household: Household) -> None:
        await self.session.delete(household)
        await self.session.flush()
        
    async def add_member(self, member: HouseholdMember) -> HouseholdMember:
        self.session.add(member)
        await self.session.flush()
        return member
        
    async def remove_member(self, user_id: UUID, household_id: UUID) -> None:
        stmt = delete(HouseholdMember).where(
            HouseholdMember.user_id == user_id, 
            HouseholdMember.household_id == household_id
        )
        await self.session.execute(stmt)
        
    async def create_invitation(self, invitation: HouseholdInvitation) -> HouseholdInvitation:
        self.session.add(invitation)
        await self.session.flush()
        return invitation
        
    async def get_invitation_by_token(self, token: str) -> Optional[HouseholdInvitation]:
        stmt = select(HouseholdInvitation).where(HouseholdInvitation.token == token)
        result = await self.session.execute(stmt)
        return result.scalars().first()
        
    async def delete_invitation(self, invitation: HouseholdInvitation) -> None:
        await self.session.delete(invitation)
        await self.session.flush()

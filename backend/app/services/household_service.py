from uuid import UUID
from typing import List
from datetime import datetime, timezone, timedelta
import secrets
from fastapi import HTTPException, status

from app.models.user import User
from app.models.household import Household
from app.models.household_member import HouseholdMember
from app.models.household_invitation import HouseholdInvitation
from app.models.enums import HouseholdRole
from app.schemas.household import HouseholdCreate, HouseholdUpdate
from app.repositories.household_repository import HouseholdRepository
from app.repositories.user_repository import UserRepository

class HouseholdService:
    def __init__(self, household_repo: HouseholdRepository, user_repo: UserRepository):
        self.household_repo = household_repo
        self.user_repo = user_repo
        
    async def create_household(self, user: User, data: HouseholdCreate) -> Household:
        household = Household(name=data.name)
        household = await self.household_repo.create(household)
        
        member = HouseholdMember(
            user_id=user.id,
            household_id=household.id,
            role=HouseholdRole.OWNER
        )
        await self.household_repo.add_member(member)
        return await self.household_repo.get_by_id(household.id)
        
    async def get_user_households(self, user_id: UUID) -> List[Household]:
        return await self.household_repo.get_for_user(user_id)
        
    async def get_household(self, household_id: UUID, user_id: UUID) -> Household:
        household = await self.household_repo.get_by_id(household_id)
        if not household:
            raise HTTPException(status_code=404, detail="Household not found")
        
        # Check membership
        if not any(m.user_id == user_id for m in household.members):
            raise HTTPException(status_code=403, detail="Not a member of this household")
            
        return household
        
    async def invite_member(self, household_id: UUID, inviter_id: UUID, email: str, role: HouseholdRole) -> str:
        household = await self.get_household(household_id, inviter_id)
        
        inviter_member = next((m for m in household.members if m.user_id == inviter_id), None)
        if not inviter_member or inviter_member.role not in [HouseholdRole.OWNER, HouseholdRole.ADMIN]:
            raise HTTPException(status_code=403, detail="Only owners and admins can invite members")
            
        token = secrets.token_urlsafe(32)
        expires_at = datetime.now(timezone.utc) + timedelta(days=7)
        
        invitation = HouseholdInvitation(
            household_id=household_id,
            email=email,
            token=token,
            role=role,
            expires_at=expires_at
        )
        await self.household_repo.create_invitation(invitation)
        return token
        
    async def accept_invitation(self, token: str, user: User) -> Household:
        invitation = await self.household_repo.get_invitation_by_token(token)
        if not invitation:
            raise HTTPException(status_code=404, detail="Invalid invitation")
            
        if invitation.expires_at < datetime.now(timezone.utc):
            await self.household_repo.delete_invitation(invitation)
            raise HTTPException(status_code=400, detail="Invitation expired")
            
        if invitation.email != user.email:
            raise HTTPException(status_code=400, detail="Invitation is for a different email address")
            
        # Check if already a member
        household = await self.household_repo.get_by_id(invitation.household_id)
        if any(m.user_id == user.id for m in household.members):
            await self.household_repo.delete_invitation(invitation)
            return household
            
        member = HouseholdMember(
            user_id=user.id,
            household_id=household.id,
            role=invitation.role
        )
        await self.household_repo.add_member(member)
        await self.household_repo.delete_invitation(invitation)
        
        return await self.household_repo.get_by_id(household.id)

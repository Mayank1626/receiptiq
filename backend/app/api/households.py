from fastapi import APIRouter, Depends, status
from typing import List
from uuid import UUID

from app.schemas.household import HouseholdCreate, HouseholdRead, InviteRequest, InviteResponse, HouseholdMemberRead
from app.services.household_service import HouseholdService
from app.api.dependencies import get_household_service, get_current_user
from app.models.user import User

router = APIRouter(prefix="/households", tags=["Households"])

def _to_read_model(household) -> HouseholdRead:
    return HouseholdRead(
        id=household.id,
        name=household.name,
        created_at=household.created_at,
        members=[
            HouseholdMemberRead(
                user_id=m.user_id,
                role=m.role,
                joined_at=m.joined_at,
                email=m.user.email
            ) for m in household.members
        ]
    )

@router.post("/", response_model=HouseholdRead, status_code=status.HTTP_201_CREATED)
async def create_household(
    data: HouseholdCreate,
    current_user: User = Depends(get_current_user),
    household_service: HouseholdService = Depends(get_household_service)
):
    household = await household_service.create_household(current_user, data)
    return _to_read_model(household)

@router.get("/", response_model=List[HouseholdRead])
async def list_households(
    current_user: User = Depends(get_current_user),
    household_service: HouseholdService = Depends(get_household_service)
):
    households = await household_service.get_user_households(current_user.id)
    return [_to_read_model(h) for h in households]

@router.get("/{household_id}", response_model=HouseholdRead)
async def get_household(
    household_id: UUID,
    current_user: User = Depends(get_current_user),
    household_service: HouseholdService = Depends(get_household_service)
):
    household = await household_service.get_household(household_id, current_user.id)
    return _to_read_model(household)

@router.post("/{household_id}/invitations", response_model=InviteResponse)
async def invite_member(
    household_id: UUID,
    data: InviteRequest,
    current_user: User = Depends(get_current_user),
    household_service: HouseholdService = Depends(get_household_service)
):
    token = await household_service.invite_member(
        household_id=household_id,
        inviter_id=current_user.id,
        email=data.email,
        role=data.role
    )
    return InviteResponse(token=token)

@router.post("/invitations/{token}/accept", response_model=HouseholdRead)
async def accept_invitation(
    token: str,
    current_user: User = Depends(get_current_user),
    household_service: HouseholdService = Depends(get_household_service)
):
    household = await household_service.accept_invitation(token, current_user)
    return _to_read_model(household)

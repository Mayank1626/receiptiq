from typing import List
from uuid import UUID
from fastapi import APIRouter, Depends

from app.schemas.settlement import (
    SettlementCreate, 
    SettlementResponse,
    SuggestedSettlementResponse, 
    UserBalance,
    LedgerResponse
)
from app.services.settlement_service import SettlementService
from app.api.dependencies import get_settlement_service, get_current_user
from app.models.user import User

router = APIRouter(tags=["Settlements"])

@router.get("/households/{household_id}/balances", response_model=List[UserBalance], summary="Get Household Balances")
async def get_balances(
    household_id: UUID,
    current_user: User = Depends(get_current_user),
    service: SettlementService = Depends(get_settlement_service)
):
    """
    Returns the real-time net balances of all household members.
    Positive values mean the user is owed money.
    Negative values mean the user owes money.
    """
    return await service.get_balances(household_id)

@router.get("/households/{household_id}/settlements", response_model=List[SuggestedSettlementResponse], summary="Get Suggested Settlements")
async def get_suggested_settlements(
    household_id: UUID,
    current_user: User = Depends(get_current_user),
    service: SettlementService = Depends(get_settlement_service)
):
    """
    Returns a mathematically optimized list of payments required to zero out all balances in the household.
    """
    return await service.get_suggested_settlements(household_id)

@router.get("/households/{household_id}/ledger", response_model=LedgerResponse, summary="Get Household Ledger")
async def get_ledger(
    household_id: UUID,
    current_user: User = Depends(get_current_user),
    service: SettlementService = Depends(get_settlement_service)
):
    """
    Returns a chronologically sorted history of all active splits and completed settlements.
    """
    return await service.get_ledger(household_id)

@router.post("/settlements/complete", response_model=SettlementResponse, summary="Complete a Settlement")
async def complete_settlement(
    household_id: UUID,
    settlement_in: SettlementCreate,
    current_user: User = Depends(get_current_user),
    service: SettlementService = Depends(get_settlement_service)
):
    """
    Submits a completed payment (settlement) to adjust user balances.
    """
    return await service.complete_settlement(household_id, settlement_in)

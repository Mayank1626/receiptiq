import uuid
from typing import List, Dict
from datetime import datetime
from fastapi import HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

from app.schemas.settlement import (
    SettlementCreate, 
    SuggestedSettlementResponse, 
    UserBalance,
    LedgerResponse,
    LedgerSplitEntry,
    LedgerSettlementEntry
)
from app.models.settlement import Settlement
from app.models.enums import SettlementStatus
from app.repositories.settlement_repository import SettlementRepository
from app.repositories.split_repository import SplitRepository
from app.repositories.household_repository import HouseholdRepository
from app.services.balance_calculator import BalanceCalculator
from app.services.settlement_optimizer import SettlementOptimizer

class SettlementService:
    def __init__(self, session: AsyncSession):
        self.session = session
        self.settlement_repo = SettlementRepository(session)
        self.split_repo = SplitRepository(session)
        self.household_repo = HouseholdRepository(session)

    async def get_balances(self, household_id: uuid.UUID) -> List[UserBalance]:
        splits = await self.split_repo.get_active_splits_for_household(household_id)
        settlements = await self.settlement_repo.get_by_household(household_id, status=SettlementStatus.COMPLETED)
        
        balances_dict = BalanceCalculator.calculate_balances(splits, settlements)
        
        return [
            UserBalance(user_id=uid, net_balance=bal) 
            for uid, bal in balances_dict.items()
        ]

    async def get_suggested_settlements(self, household_id: uuid.UUID) -> List[SuggestedSettlementResponse]:
        splits = await self.split_repo.get_active_splits_for_household(household_id)
        settlements = await self.settlement_repo.get_by_household(household_id, status=SettlementStatus.COMPLETED)
        
        balances_dict = BalanceCalculator.calculate_balances(splits, settlements)
        suggestions = SettlementOptimizer.optimize(balances_dict)
        
        return [
            SuggestedSettlementResponse(
                payer_id=s.payer_id,
                payee_id=s.payee_id,
                amount=s.amount
            )
            for s in suggestions
        ]

    async def get_ledger(self, household_id: uuid.UUID) -> LedgerResponse:
        splits = await self.split_repo.get_active_splits_for_household(household_id)
        settlements = await self.settlement_repo.get_by_household(household_id, status=SettlementStatus.COMPLETED)
        
        entries = []
        for split in splits:
            entries.append(
                LedgerSplitEntry(
                    id=split.id,
                    receipt_id=split.receipt_id,
                    total_amount=split.total_amount,
                    split_type=split.split_type,
                    timestamp=split.created_at
                )
            )
            
        for settlement in settlements:
            entries.append(
                LedgerSettlementEntry(
                    id=settlement.id,
                    payer_id=settlement.payer_id,
                    payee_id=settlement.payee_id,
                    amount=settlement.amount,
                    timestamp=settlement.completed_at or settlement.created_at
                )
            )
            
        # Sort by timestamp descending
        entries.sort(key=lambda x: x.timestamp, reverse=True)
        return LedgerResponse(entries=entries)

    async def complete_settlement(self, household_id: uuid.UUID, settlement_in: SettlementCreate) -> Settlement:
        household = await self.household_repo.get_by_id(household_id)
        if not household:
            raise HTTPException(status_code=404, detail="Household not found")
            
        new_settlement = Settlement(
            household_id=household_id,
            payer_id=settlement_in.payer_id,
            payee_id=settlement_in.payee_id,
            amount=settlement_in.amount,
            status=SettlementStatus.COMPLETED,
            completed_at=datetime.utcnow()
        )
        
        # We could add an audit event for the household here if we had a HouseholdAudit model,
        # but the user said "Add audit events for split creation, invalidation, and settlement completion".
        # Let's log it using standard python logging for now as we don't have a household audit table.
        import logging
        logger = logging.getLogger(__name__)
        logger.info(f"Settlement completed: {new_settlement.amount} from {new_settlement.payer_id} to {new_settlement.payee_id}")
        
        return await self.settlement_repo.create(new_settlement)

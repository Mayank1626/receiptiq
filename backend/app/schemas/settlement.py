from typing import List, Optional, Union
from uuid import UUID
from datetime import datetime
from decimal import Decimal
from pydantic import BaseModel, ConfigDict, Field

from app.models.enums import SettlementStatus, SplitType

class SettlementCreate(BaseModel):
    payer_id: UUID
    payee_id: UUID
    amount: Decimal = Field(max_digits=10, decimal_places=2)

class SettlementResponse(BaseModel):
    id: UUID
    household_id: UUID
    payer_id: UUID
    payee_id: UUID
    amount: Decimal
    status: SettlementStatus
    billing_cycle_id: Optional[UUID] = None
    created_at: datetime
    updated_at: datetime
    completed_at: Optional[datetime] = None
    
    model_config = ConfigDict(from_attributes=True)

class UserBalance(BaseModel):
    user_id: UUID
    net_balance: Decimal = Field(max_digits=10, decimal_places=2)

class SuggestedSettlementResponse(BaseModel):
    payer_id: UUID
    payee_id: UUID
    amount: Decimal = Field(max_digits=10, decimal_places=2)

class LedgerSplitEntry(BaseModel):
    type: str = "SPLIT"
    id: UUID
    receipt_id: UUID
    total_amount: Decimal
    split_type: SplitType
    timestamp: datetime

class LedgerSettlementEntry(BaseModel):
    type: str = "SETTLEMENT"
    id: UUID
    payer_id: UUID
    payee_id: UUID
    amount: Decimal
    timestamp: datetime

class LedgerResponse(BaseModel):
    entries: List[Union[LedgerSplitEntry, LedgerSettlementEntry]]

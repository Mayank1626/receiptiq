from typing import List, Optional
from uuid import UUID
from datetime import datetime
from decimal import Decimal
from pydantic import BaseModel, ConfigDict, Field

from app.models.enums import SplitType, SplitStatus

class ExpenseShareBase(BaseModel):
    user_id: UUID
    amount_paid: Decimal = Field(default=Decimal("0.00"), max_digits=10, decimal_places=2)
    amount_owed: Decimal = Field(max_digits=10, decimal_places=2)
    percentage_share: Optional[Decimal] = Field(default=None, max_digits=5, decimal_places=2)

class ExpenseShareCreate(ExpenseShareBase):
    pass

class ExpenseShareResponse(ExpenseShareBase):
    id: UUID
    split_id: UUID
    
    model_config = ConfigDict(from_attributes=True)

class ExpenseSplitCreate(BaseModel):
    split_type: SplitType
    shares: List[ExpenseShareCreate]

class ExpenseSplitResponse(BaseModel):
    id: UUID
    receipt_id: UUID
    split_type: SplitType
    status: SplitStatus
    total_amount: Decimal
    billing_cycle_id: Optional[UUID] = None
    created_at: datetime
    updated_at: datetime
    
    shares: List[ExpenseShareResponse] = Field(default_factory=list)
    
    model_config = ConfigDict(from_attributes=True)

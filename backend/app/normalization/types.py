from pydantic import BaseModel, Field
from typing import List, Optional

class AIProposedItem(BaseModel):
    name: Optional[str] = None
    quantity: Optional[float] = None
    price: Optional[float] = None
    total: Optional[float] = None

class AIProposedReceipt(BaseModel):
    store_name: Optional[str] = None
    date: Optional[str] = None
    subtotal: Optional[float] = None
    tax: Optional[float] = None
    total_amount: Optional[float] = None
    currency: Optional[str] = None
    items: List[AIProposedItem] = Field(default_factory=list)

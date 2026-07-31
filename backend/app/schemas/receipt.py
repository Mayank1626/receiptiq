import uuid
from datetime import datetime
from decimal import Decimal
from typing import List, Optional
from pydantic import BaseModel, ConfigDict, Field

from app.models.enums import ReceiptStatus, ReceiptSource, StoreType, StorageProvider

class ReceiptItemBase(BaseModel):
    name: str
    quantity: float = 1.0
    item_price: Optional[Decimal] = None
    total_price: Optional[Decimal] = None
    category: Optional[str] = None

class ReceiptItemCreate(ReceiptItemBase):
    pass

class ReceiptItemResponse(ReceiptItemBase):
    id: uuid.UUID
    receipt_id: uuid.UUID
    
    model_config = ConfigDict(from_attributes=True)

class ReceiptBase(BaseModel):
    status: ReceiptStatus = ReceiptStatus.DRAFT
    source: ReceiptSource = ReceiptSource.UPLOAD
    store_type: Optional[StoreType] = None
    store_name: Optional[str] = None
    
    total_amount: Optional[Decimal] = None
    subtotal: Optional[Decimal] = None
    tax: Optional[Decimal] = None
    delivery_charge: Optional[Decimal] = None
    discount: Optional[Decimal] = None
    
    date: Optional[datetime] = None
    storage_provider: StorageProvider = StorageProvider.LOCAL
    file_path: str

class ReceiptCreate(ReceiptBase):
    pass

class ReceiptResponse(ReceiptBase):
    id: uuid.UUID
    created_at: datetime
    updated_at: datetime
    uploaded_file_id: Optional[uuid.UUID] = None
    ocr_result_id: Optional[uuid.UUID] = None
    ai_extraction_result_id: Optional[uuid.UUID] = None
    items: List[ReceiptItemResponse] = Field(default_factory=list)
    
    model_config = ConfigDict(from_attributes=True)

class ReceiptUpdate(BaseModel):
    store_name: Optional[str] = None
    store_type: Optional[StoreType] = None
    date: Optional[datetime] = None
    total_amount: Optional[Decimal] = None
    subtotal: Optional[Decimal] = None
    tax: Optional[Decimal] = None
    delivery_charge: Optional[Decimal] = None
    discount: Optional[Decimal] = None

class ReceiptItemUpdate(BaseModel):
    name: Optional[str] = None
    quantity: Optional[float] = None
    item_price: Optional[Decimal] = None
    total_price: Optional[Decimal] = None
    category: Optional[str] = None

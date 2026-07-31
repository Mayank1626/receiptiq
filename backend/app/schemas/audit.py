import uuid
from datetime import datetime
from typing import Optional
from pydantic import BaseModel, ConfigDict
from app.models.enums import AuditAction

class ReceiptAuditResponse(BaseModel):
    id: uuid.UUID
    receipt_id: uuid.UUID
    action: AuditAction
    field_name: Optional[str] = None
    old_value: Optional[str] = None
    new_value: Optional[str] = None
    edited_at: datetime
    
    model_config = ConfigDict(from_attributes=True)

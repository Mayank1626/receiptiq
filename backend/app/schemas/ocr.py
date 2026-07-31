import uuid
from datetime import datetime
from typing import Optional
from pydantic import BaseModel, ConfigDict

class OCRResultResponse(BaseModel):
    id: uuid.UUID
    uploaded_file_id: uuid.UUID
    provider: str
    provider_version: str
    status: str
    raw_text: Optional[str] = None
    confidence: Optional[float] = None
    processing_time_ms: Optional[int] = None
    error_message: Optional[str] = None
    created_at: datetime
    
    model_config = ConfigDict(from_attributes=True)

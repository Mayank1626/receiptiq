import uuid
from datetime import datetime
from typing import Optional, Dict, Any
from pydantic import BaseModel, ConfigDict

class AIExtractionResultResponse(BaseModel):
    id: uuid.UUID
    ocr_result_id: uuid.UUID
    provider: str
    model: str
    prompt_version: str
    
    raw_response: Optional[str] = None
    structured_json: Optional[Dict[str, Any]] = None
    
    processing_time_ms: Optional[int] = None
    confidence: Optional[float] = None
    token_usage: Optional[int] = None
    error_message: Optional[str] = None
    created_at: datetime
    
    model_config = ConfigDict(from_attributes=True)

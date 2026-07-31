from pydantic import BaseModel
from typing import Optional, Any, Dict

class AIExtraction(BaseModel):
    structured_json: Dict[str, Any]
    confidence: float
    processing_time_ms: int
    token_usage: Optional[int] = None
    error_message: Optional[str] = None
    raw_response: Optional[str] = None

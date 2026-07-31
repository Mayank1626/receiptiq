from pydantic import BaseModel
from typing import Optional

class OCRExtractionResult(BaseModel):
    raw_text: str
    confidence: float
    processing_time_ms: int
    error_message: Optional[str] = None

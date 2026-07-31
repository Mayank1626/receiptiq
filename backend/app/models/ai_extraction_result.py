import uuid
from datetime import datetime
from sqlalchemy import String, Integer, Float, ForeignKey, func, Text
from sqlalchemy.orm import Mapped, mapped_column
from sqlalchemy.ext.mutable import MutableDict
from sqlalchemy.types import JSON

from app.db.base import Base

class AIExtractionResult(Base):
    __tablename__ = "ai_extraction_results"

    id: Mapped[uuid.UUID] = mapped_column(primary_key=True, default=uuid.uuid4)
    ocr_result_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("ocr_results.id", ondelete="CASCADE"), index=True, unique=True)
    provider: Mapped[str] = mapped_column(String)
    model: Mapped[str] = mapped_column(String)
    prompt_version: Mapped[str] = mapped_column(String)
    
    raw_response: Mapped[str] = mapped_column(Text, nullable=True)
    structured_json: Mapped[dict] = mapped_column(MutableDict.as_mutable(JSON), nullable=True)
    
    processing_time_ms: Mapped[int] = mapped_column(Integer, nullable=True)
    confidence: Mapped[float] = mapped_column(Float, nullable=True)
    token_usage: Mapped[int] = mapped_column(Integer, nullable=True)
    error_message: Mapped[str] = mapped_column(Text, nullable=True)
    
    created_at: Mapped[datetime] = mapped_column(server_default=func.now())

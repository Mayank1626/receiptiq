import uuid
from datetime import datetime
from sqlalchemy import String, Integer, Float, ForeignKey, func, Text
from sqlalchemy.orm import Mapped, mapped_column

from app.db.base import Base

class OCRResult(Base):
    __tablename__ = "ocr_results"

    id: Mapped[uuid.UUID] = mapped_column(primary_key=True, default=uuid.uuid4)
    uploaded_file_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("uploaded_files.id", ondelete="CASCADE"), index=True, unique=True)
    provider: Mapped[str] = mapped_column(String)
    provider_version: Mapped[str] = mapped_column(String)
    status: Mapped[str] = mapped_column(String, index=True) # "SUCCESS", "FAILED"
    raw_text: Mapped[str] = mapped_column(Text, nullable=True)
    confidence: Mapped[float] = mapped_column(Float, nullable=True)
    processing_time_ms: Mapped[int] = mapped_column(Integer, nullable=True)
    error_message: Mapped[str] = mapped_column(Text, nullable=True)
    
    created_at: Mapped[datetime] = mapped_column(server_default=func.now())

import uuid
from typing import Optional
from datetime import datetime
from sqlalchemy import String, Integer, func, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column

from app.db.base import Base
from app.models.enums import StorageProvider, ProcessingStatus

class UploadedFile(Base):
    __tablename__ = "uploaded_files"

    id: Mapped[uuid.UUID] = mapped_column(primary_key=True, default=uuid.uuid4)
    original_filename: Mapped[str] = mapped_column(String, index=True)
    stored_filename: Mapped[str] = mapped_column(String, unique=True, index=True)
    storage_path: Mapped[str] = mapped_column(String)
    mime_type: Mapped[str] = mapped_column(String)
    size_bytes: Mapped[int] = mapped_column(Integer)
    checksum_sha256: Mapped[str] = mapped_column(String)
    
    storage_provider: Mapped[StorageProvider] = mapped_column(default=StorageProvider.LOCAL)
    processing_status: Mapped[ProcessingStatus] = mapped_column(default=ProcessingStatus.UPLOADED, index=True)
    
    owner_id: Mapped[Optional[uuid.UUID]] = mapped_column(ForeignKey("users.id", ondelete="SET NULL"), nullable=True, index=True)
    household_id: Mapped[Optional[uuid.UUID]] = mapped_column(ForeignKey("households.id", ondelete="SET NULL"), nullable=True, index=True)
    
    uploaded_at: Mapped[datetime] = mapped_column(server_default=func.now(), index=True)

import uuid
from datetime import datetime
from decimal import Decimal
from typing import List, Optional, TYPE_CHECKING
from sqlalchemy import String, Numeric, DateTime, Enum as SQLEnum, Uuid, ForeignKey
from sqlalchemy.sql import func
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.db.base import Base
from app.models.enums import ReceiptStatus, ReceiptSource, StoreType, StorageProvider

if TYPE_CHECKING:
    from app.models.receipt_item import ReceiptItem
    from app.models.receipt_audit import ReceiptAudit

class Receipt(Base):
    __tablename__ = "receipts"

    id: Mapped[uuid.UUID] = mapped_column(Uuid, primary_key=True, default=uuid.uuid4)
    status: Mapped[ReceiptStatus] = mapped_column(SQLEnum(ReceiptStatus), default=ReceiptStatus.DRAFT, index=True)
    source: Mapped[ReceiptSource] = mapped_column(SQLEnum(ReceiptSource), default=ReceiptSource.UPLOAD, index=True)
    
    uploaded_file_id: Mapped[Optional[uuid.UUID]] = mapped_column(Uuid, ForeignKey("uploaded_files.id", ondelete="SET NULL"), nullable=True)
    ocr_result_id: Mapped[Optional[uuid.UUID]] = mapped_column(Uuid, ForeignKey("ocr_results.id", ondelete="SET NULL"), nullable=True)
    ai_extraction_result_id: Mapped[Optional[uuid.UUID]] = mapped_column(Uuid, ForeignKey("ai_extraction_results.id", ondelete="SET NULL"), nullable=True)
    store_type: Mapped[Optional[StoreType]] = mapped_column(SQLEnum(StoreType), nullable=True)
    store_name: Mapped[Optional[str]] = mapped_column(String, nullable=True, index=True)
    
    total_amount: Mapped[Optional[Decimal]] = mapped_column(Numeric(10, 2), nullable=True)
    subtotal: Mapped[Optional[Decimal]] = mapped_column(Numeric(10, 2), nullable=True)
    tax: Mapped[Optional[Decimal]] = mapped_column(Numeric(10, 2), nullable=True)
    delivery_charge: Mapped[Optional[Decimal]] = mapped_column(Numeric(10, 2), nullable=True)
    discount: Mapped[Optional[Decimal]] = mapped_column(Numeric(10, 2), nullable=True)
    
    date: Mapped[Optional[datetime]] = mapped_column(DateTime(timezone=True), nullable=True, index=True)
    storage_provider: Mapped[StorageProvider] = mapped_column(SQLEnum(StorageProvider), default=StorageProvider.LOCAL)
    file_path: Mapped[str] = mapped_column(String, nullable=False)
    
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), index=True)
    updated_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now())

    items: Mapped[List["ReceiptItem"]] = relationship("ReceiptItem", back_populates="receipt", cascade="all, delete-orphan")
    audits: Mapped[List["ReceiptAudit"]] = relationship("ReceiptAudit", back_populates="receipt", cascade="all, delete-orphan", order_by="ReceiptAudit.edited_at.desc()")

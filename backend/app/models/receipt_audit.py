import uuid
from datetime import datetime
from typing import Optional, TYPE_CHECKING
from sqlalchemy import String, DateTime, Enum as SQLEnum, Uuid, ForeignKey
from sqlalchemy.sql import func
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.db.base import Base
from app.models.enums import AuditAction

if TYPE_CHECKING:
    from app.models.receipt import Receipt

class ReceiptAudit(Base):
    __tablename__ = "receipt_audits"

    id: Mapped[uuid.UUID] = mapped_column(Uuid, primary_key=True, default=uuid.uuid4)
    receipt_id: Mapped[uuid.UUID] = mapped_column(Uuid, ForeignKey("receipts.id", ondelete="CASCADE"), index=True)
    action: Mapped[AuditAction] = mapped_column(SQLEnum(AuditAction), index=True)
    field_name: Mapped[Optional[str]] = mapped_column(String, nullable=True)
    old_value: Mapped[Optional[str]] = mapped_column(String, nullable=True)
    new_value: Mapped[Optional[str]] = mapped_column(String, nullable=True)
    edited_by_user_id: Mapped[Optional[uuid.UUID]] = mapped_column(Uuid, ForeignKey("users.id", ondelete="SET NULL"), nullable=True, index=True)
    edited_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), index=True)

    receipt: Mapped["Receipt"] = relationship("Receipt", back_populates="audits")

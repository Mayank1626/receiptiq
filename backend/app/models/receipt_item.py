import uuid
from typing import Optional, TYPE_CHECKING
from decimal import Decimal
from sqlalchemy import String, Float, Numeric, ForeignKey, Uuid
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.db.base import Base

if TYPE_CHECKING:
    from app.models.receipt import Receipt

class ReceiptItem(Base):
    __tablename__ = "receipt_items"

    id: Mapped[uuid.UUID] = mapped_column(Uuid, primary_key=True, default=uuid.uuid4)
    receipt_id: Mapped[uuid.UUID] = mapped_column(ForeignKey("receipts.id", ondelete="CASCADE"))
    name: Mapped[str] = mapped_column(String, nullable=False)
    quantity: Mapped[float] = mapped_column(Float, default=1.0)
    item_price: Mapped[Optional[Decimal]] = mapped_column(Numeric(10, 2), nullable=True)
    total_price: Mapped[Optional[Decimal]] = mapped_column(Numeric(10, 2), nullable=True)
    category: Mapped[Optional[str]] = mapped_column(String, nullable=True)

    receipt: Mapped["Receipt"] = relationship("Receipt", back_populates="items")

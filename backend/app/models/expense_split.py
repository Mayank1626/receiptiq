import uuid
from datetime import datetime
from decimal import Decimal
from typing import List, TYPE_CHECKING
from sqlalchemy import String, Numeric, DateTime, Enum as SQLEnum, Uuid, ForeignKey
from sqlalchemy.sql import func
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.db.base import Base
from app.models.enums import SplitType, SplitStatus

if TYPE_CHECKING:
    from app.models.receipt import Receipt
    from app.models.expense_share import ExpenseShare

class ExpenseSplit(Base):
    __tablename__ = "expense_splits"

    id: Mapped[uuid.UUID] = mapped_column(Uuid, primary_key=True, default=uuid.uuid4)
    receipt_id: Mapped[uuid.UUID] = mapped_column(Uuid, ForeignKey("receipts.id", ondelete="CASCADE"), nullable=False, index=True)
    
    split_type: Mapped[SplitType] = mapped_column(SQLEnum(SplitType), nullable=False)
    status: Mapped[SplitStatus] = mapped_column(SQLEnum(SplitStatus), default=SplitStatus.ACTIVE, index=True)
    total_amount: Mapped[Decimal] = mapped_column(Numeric(10, 2), nullable=False)
    
    # Allows for future billing cycles
    billing_cycle_id: Mapped[uuid.UUID | None] = mapped_column(Uuid, nullable=True, index=True)
    
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), index=True)
    updated_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now())

    receipt: Mapped["Receipt"] = relationship("Receipt")
    shares: Mapped[List["ExpenseShare"]] = relationship("ExpenseShare", back_populates="split", cascade="all, delete-orphan", lazy="selectin")

import uuid
from decimal import Decimal
from typing import TYPE_CHECKING, Optional
from sqlalchemy import Numeric, Uuid, ForeignKey
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.db.base import Base

if TYPE_CHECKING:
    from app.models.expense_split import ExpenseSplit
    from app.models.user import User

class ExpenseShare(Base):
    __tablename__ = "expense_shares"

    id: Mapped[uuid.UUID] = mapped_column(Uuid, primary_key=True, default=uuid.uuid4)
    split_id: Mapped[uuid.UUID] = mapped_column(Uuid, ForeignKey("expense_splits.id", ondelete="CASCADE"), nullable=False, index=True)
    user_id: Mapped[uuid.UUID] = mapped_column(Uuid, ForeignKey("users.id", ondelete="CASCADE"), nullable=False, index=True)
    
    amount_owed: Mapped[Decimal] = mapped_column(Numeric(10, 2), nullable=False, default=Decimal("0.00"))
    amount_paid: Mapped[Decimal] = mapped_column(Numeric(10, 2), nullable=False, default=Decimal("0.00"))
    percentage_share: Mapped[Optional[Decimal]] = mapped_column(Numeric(5, 2), nullable=True)

    split: Mapped["ExpenseSplit"] = relationship("ExpenseSplit", back_populates="shares")
    user: Mapped["User"] = relationship("User")

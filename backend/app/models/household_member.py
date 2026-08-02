import uuid
from datetime import datetime
from typing import TYPE_CHECKING
from sqlalchemy import ForeignKey, DateTime, Uuid, Enum as SQLEnum
from sqlalchemy.sql import func
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.db.base import Base
from app.models.enums import HouseholdRole

if TYPE_CHECKING:
    from app.models.user import User
    from app.models.household import Household

class HouseholdMember(Base):
    __tablename__ = "household_members"

    id: Mapped[uuid.UUID] = mapped_column(Uuid, primary_key=True, default=uuid.uuid4)
    user_id: Mapped[uuid.UUID] = mapped_column(Uuid, ForeignKey("users.id", ondelete="CASCADE"), nullable=False)
    household_id: Mapped[uuid.UUID] = mapped_column(Uuid, ForeignKey("households.id", ondelete="CASCADE"), nullable=False)
    role: Mapped[HouseholdRole] = mapped_column(SQLEnum(HouseholdRole), default=HouseholdRole.MEMBER, nullable=False)
    
    joined_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now())
    
    user: Mapped["User"] = relationship("User", back_populates="memberships")
    household: Mapped["Household"] = relationship("Household", back_populates="members")

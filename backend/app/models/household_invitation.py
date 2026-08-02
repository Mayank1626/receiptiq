import uuid
from datetime import datetime
from typing import TYPE_CHECKING
from sqlalchemy import String, ForeignKey, DateTime, Uuid, Enum as SQLEnum
from sqlalchemy.sql import func
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.db.base import Base
from app.models.enums import HouseholdRole

if TYPE_CHECKING:
    from app.models.household import Household

class HouseholdInvitation(Base):
    __tablename__ = "household_invitations"

    id: Mapped[uuid.UUID] = mapped_column(Uuid, primary_key=True, default=uuid.uuid4)
    household_id: Mapped[uuid.UUID] = mapped_column(Uuid, ForeignKey("households.id", ondelete="CASCADE"), nullable=False)
    email: Mapped[str] = mapped_column(String, index=True, nullable=False)
    token: Mapped[str] = mapped_column(String, unique=True, index=True, nullable=False)
    role: Mapped[HouseholdRole] = mapped_column(SQLEnum(HouseholdRole), default=HouseholdRole.MEMBER, nullable=False)
    
    expires_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), nullable=False)
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now())
    
    household: Mapped["Household"] = relationship("Household", back_populates="invitations")

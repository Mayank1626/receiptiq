import uuid
from datetime import datetime
from typing import List, TYPE_CHECKING
from sqlalchemy import String, DateTime, Uuid
from sqlalchemy.sql import func
from sqlalchemy.orm import Mapped, mapped_column, relationship

from app.db.base import Base

if TYPE_CHECKING:
    from app.models.household_member import HouseholdMember
    from app.models.household_invitation import HouseholdInvitation

class Household(Base):
    __tablename__ = "households"

    id: Mapped[uuid.UUID] = mapped_column(Uuid, primary_key=True, default=uuid.uuid4)
    name: Mapped[str] = mapped_column(String, nullable=False)
    
    created_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now())
    updated_at: Mapped[datetime] = mapped_column(DateTime(timezone=True), server_default=func.now(), onupdate=func.now())
    
    members: Mapped[List["HouseholdMember"]] = relationship("HouseholdMember", back_populates="household", cascade="all, delete-orphan")
    invitations: Mapped[List["HouseholdInvitation"]] = relationship("HouseholdInvitation", back_populates="household", cascade="all, delete-orphan")

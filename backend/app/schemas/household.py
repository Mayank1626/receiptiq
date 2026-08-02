from uuid import UUID
from pydantic import BaseModel, EmailStr
from datetime import datetime
from typing import List
from app.models.enums import HouseholdRole

class HouseholdCreate(BaseModel):
    name: str

class HouseholdUpdate(BaseModel):
    name: str

class HouseholdMemberRead(BaseModel):
    user_id: UUID
    role: HouseholdRole
    joined_at: datetime
    email: str

class HouseholdRead(BaseModel):
    id: UUID
    name: str
    created_at: datetime
    members: List[HouseholdMemberRead] = []

class InviteRequest(BaseModel):
    email: EmailStr
    role: HouseholdRole = HouseholdRole.MEMBER

class InviteResponse(BaseModel):
    token: str

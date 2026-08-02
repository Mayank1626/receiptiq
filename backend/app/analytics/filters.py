from typing import Optional
from datetime import datetime
from uuid import UUID
from pydantic import BaseModel

class AnalyticsFilter(BaseModel):
    start_date: Optional[datetime] = None
    end_date: Optional[datetime] = None
    owner_id: Optional[UUID] = None
    household_id: Optional[UUID] = None

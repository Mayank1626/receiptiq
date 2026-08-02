from decimal import Decimal
from typing import Optional, List
from datetime import datetime, date
from pydantic import BaseModel

class StatusCounts(BaseModel):
    draft: int = 0
    review_required: int = 0
    confirmed: int = 0
    failed: int = 0

class DashboardMetrics(BaseModel):
    total_receipts: int
    total_spend: Decimal
    average_receipt: Decimal
    largest_receipt: Decimal
    smallest_receipt: Decimal
    status_counts: StatusCounts

class MonthlySpend(BaseModel):
    month: str # "YYYY-MM"
    total_spend: Decimal
    receipt_count: int

class StoreAnalytics(BaseModel):
    store_name: str
    total_spend: Decimal
    visit_count: int
    average_spend: Decimal
    last_visit: Optional[datetime]

class ProductAnalytics(BaseModel):
    item_name: str
    total_quantity_purchased: float
    total_spend: Decimal
    average_price: Decimal
    percentage_price_trend: Optional[float] # Percentage change from min to max, or first to last.

class PriceHistory(BaseModel):
    item_name: str
    average_price: Decimal
    min_price: Decimal
    max_price: Decimal
    trend: str # 'UP', 'DOWN', 'FLAT'
    percentage_change: Optional[float]

class CategoryAnalytics(BaseModel):
    category_name: str
    total_spend: Decimal
    item_count: int
    receipt_count: int

class DailyTimeline(BaseModel):
    date: date
    total_spend: Decimal
    receipt_count: int

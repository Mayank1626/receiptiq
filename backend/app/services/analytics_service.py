from typing import List, Dict, Any, Optional
from decimal import Decimal
from datetime import datetime
from collections import defaultdict

from app.repositories.analytics_repository import AnalyticsRepository
from app.analytics.filters import AnalyticsFilter
from app.schemas.analytics import (
    DashboardMetrics,
    MonthlySpend,
    StoreAnalytics,
    ProductAnalytics,
    PriceHistory,
    CategoryAnalytics,
    DailyTimeline,
    StatusCounts
)
from app.analytics.aggregations import categorize_item

class AnalyticsService:
    def __init__(self, repo: AnalyticsRepository):
        self.repo = repo

    def _safe_decimal(self, val: Any) -> Decimal:
        if val is None:
            return Decimal("0.00")
        return Decimal(str(val))

    async def get_dashboard(self, filters: AnalyticsFilter) -> DashboardMetrics:
        data = await self.repo.get_dashboard_metrics(filters)
        metrics = data["metrics"]
        status_counts = data["status_counts"]
        
        return DashboardMetrics(
            total_receipts=metrics.get("total_receipts") or 0,
            total_spend=self._safe_decimal(metrics.get("total_spend")),
            average_receipt=self._safe_decimal(metrics.get("average_receipt")),
            largest_receipt=self._safe_decimal(metrics.get("largest_receipt")),
            smallest_receipt=self._safe_decimal(metrics.get("smallest_receipt")),
            status_counts=StatusCounts(
                draft=status_counts.get("DRAFT", 0),
                review_required=status_counts.get("REVIEW_REQUIRED", 0),
                confirmed=status_counts.get("CONFIRMED", 0),
                failed=status_counts.get("FAILED", 0)
            )
        )

    async def get_monthly_spend(self, filters: AnalyticsFilter) -> List[MonthlySpend]:
        rows = await self.repo.get_monthly_spend(filters)
        return [
            MonthlySpend(
                month=row["month"],
                total_spend=self._safe_decimal(row["total_spend"]),
                receipt_count=row["receipt_count"] or 0
            ) for row in rows if row["month"]
        ]

    async def get_store_analytics(self, filters: AnalyticsFilter) -> List[StoreAnalytics]:
        rows = await self.repo.get_store_analytics(filters)
        return [
            StoreAnalytics(
                store_name=row["store_name"],
                total_spend=self._safe_decimal(row["total_spend"]),
                visit_count=row["visit_count"] or 0,
                average_spend=self._safe_decimal(row["average_spend"]),
                last_visit=row["last_visit"]
            ) for row in rows
        ]

    async def get_product_analytics(self, filters: AnalyticsFilter) -> List[ProductAnalytics]:
        rows = await self.repo.get_product_analytics(filters)
        result = []
        for row in rows:
            min_p = self._safe_decimal(row["min_price"])
            max_p = self._safe_decimal(row["max_price"])
            trend = None
            if min_p > 0 and max_p > 0 and min_p != max_p:
                trend = float((max_p - min_p) / min_p * 100)
            
            result.append(
                ProductAnalytics(
                    item_name=row["item_name"],
                    total_quantity_purchased=float(row["total_quantity"] or 0),
                    total_spend=self._safe_decimal(row["total_spend"]),
                    average_price=self._safe_decimal(row["average_price"]),
                    percentage_price_trend=trend
                )
            )
        return result

    async def get_product_history(self, item_name: str, filters: AnalyticsFilter) -> PriceHistory:
        rows = await self.repo.get_product_history(item_name, filters)
        if not rows:
            return PriceHistory(
                item_name=item_name,
                average_price=Decimal("0.00"),
                min_price=Decimal("0.00"),
                max_price=Decimal("0.00"),
                trend="FLAT",
                percentage_change=None
            )
            
        prices = [self._safe_decimal(row["item_price"]) for row in rows if row["item_price"] is not None]
        if not prices:
            prices = [Decimal("0.00")]
            
        min_p = min(prices)
        max_p = max(prices)
        avg_p = sum(prices) / len(prices)
        
        first_p = prices[0]
        last_p = prices[-1]
        
        trend = "FLAT"
        if last_p > first_p:
            trend = "UP"
        elif last_p < first_p:
            trend = "DOWN"
            
        percentage_change = None
        if first_p > 0:
            percentage_change = float((last_p - first_p) / first_p * 100)
            
        return PriceHistory(
            item_name=item_name,
            average_price=avg_p,
            min_price=min_p,
            max_price=max_p,
            trend=trend,
            percentage_change=percentage_change
        )

    async def get_category_analytics(self, filters: AnalyticsFilter) -> List[CategoryAnalytics]:
        rows = await self.repo.get_raw_items_with_receipts(filters)
        
        category_spend = defaultdict(Decimal)
        category_items = defaultdict(int)
        category_receipts = defaultdict(set)
        
        for row in rows:
            cat = categorize_item(row["name"], row["category"])
            category_spend[cat] += self._safe_decimal(row["total_price"])
            category_items[cat] += 1
            category_receipts[cat].add(row["receipt_id"])
            
        result = []
        for cat, spend in category_spend.items():
            result.append(CategoryAnalytics(
                category_name=cat,
                total_spend=spend,
                item_count=category_items[cat],
                receipt_count=len(category_receipts[cat])
            ))
            
        result.sort(key=lambda x: x.total_spend, reverse=True)
        return result

    async def get_daily_timeline(self, filters: AnalyticsFilter) -> List[DailyTimeline]:
        rows = await self.repo.get_daily_timeline(filters)
        return [
            DailyTimeline(
                date=datetime.strptime(row["date"], "%Y-%m-%d").date() if isinstance(row["date"], str) else row["date"],
                total_spend=self._safe_decimal(row["total_spend"]),
                receipt_count=row["receipt_count"] or 0
            ) for row in rows if row["date"]
        ]

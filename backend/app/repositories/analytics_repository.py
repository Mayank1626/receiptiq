from sqlalchemy import select, func, and_, case
from sqlalchemy.ext.asyncio import AsyncSession
from typing import Optional, List, Dict, Any

from app.models.receipt import Receipt
from app.models.receipt_item import ReceiptItem
from app.models.enums import ReceiptStatus
from app.analytics.filters import AnalyticsFilter

class AnalyticsRepository:
    def __init__(self, session: AsyncSession):
        self.session = session

    def _apply_filters(self, stmt: Any, filters: AnalyticsFilter):
        if filters.start_date:
            stmt = stmt.where(Receipt.date >= filters.start_date)
        if filters.end_date:
            stmt = stmt.where(Receipt.date <= filters.end_date)
        # owner_id and household_id placeholders for future
        return stmt

    async def get_dashboard_metrics(self, filters: AnalyticsFilter) -> Dict[str, Any]:
        stmt = select(
            func.count(Receipt.id).label("total_receipts"),
            func.sum(Receipt.total_amount).label("total_spend"),
            func.avg(Receipt.total_amount).label("average_receipt"),
            func.max(Receipt.total_amount).label("largest_receipt"),
            func.min(Receipt.total_amount).label("smallest_receipt")
        ).where(Receipt.status != ReceiptStatus.FAILED)
        
        stmt = self._apply_filters(stmt, filters)
        
        result = await self.session.execute(stmt)
        row = result.first()
        
        # Get status counts
        status_stmt = select(
            Receipt.status,
            func.count(Receipt.id)
        )
        status_stmt = self._apply_filters(status_stmt, filters)
        status_stmt = status_stmt.group_by(Receipt.status)
        status_result = await self.session.execute(status_stmt)
        status_counts = {status.name: count for status, count in status_result.all()}
        
        return {
            "metrics": row._asdict() if row else {},
            "status_counts": status_counts
        }

    async def get_monthly_spend(self, filters: AnalyticsFilter) -> List[Dict[str, Any]]:
        # For SQLite, strftime('%Y-%m', date)
        month_expr = func.strftime('%Y-%m', Receipt.date).label("month")
        stmt = select(
            month_expr,
            func.sum(Receipt.total_amount).label("total_spend"),
            func.count(Receipt.id).label("receipt_count")
        ).where(Receipt.date.isnot(None), Receipt.status != ReceiptStatus.FAILED)
        
        stmt = self._apply_filters(stmt, filters)
        stmt = stmt.group_by(month_expr).order_by(month_expr)
        
        result = await self.session.execute(stmt)
        return [row._asdict() for row in result.all()]

    async def get_store_analytics(self, filters: AnalyticsFilter) -> List[Dict[str, Any]]:
        stmt = select(
            func.coalesce(Receipt.store_name, 'Unknown Store').label("store_name"),
            func.sum(Receipt.total_amount).label("total_spend"),
            func.count(Receipt.id).label("visit_count"),
            func.avg(Receipt.total_amount).label("average_spend"),
            func.max(Receipt.date).label("last_visit")
        ).where(Receipt.status != ReceiptStatus.FAILED)
        
        stmt = self._apply_filters(stmt, filters)
        stmt = stmt.group_by(func.coalesce(Receipt.store_name, 'Unknown Store')).order_by(func.sum(Receipt.total_amount).desc())
        
        result = await self.session.execute(stmt)
        return [row._asdict() for row in result.all()]

    async def get_product_analytics(self, filters: AnalyticsFilter) -> List[Dict[str, Any]]:
        stmt = select(
            ReceiptItem.name.label("item_name"),
            func.sum(ReceiptItem.quantity).label("total_quantity"),
            func.sum(ReceiptItem.total_price).label("total_spend"),
            func.avg(ReceiptItem.item_price).label("average_price"),
            func.min(ReceiptItem.item_price).label("min_price"),
            func.max(ReceiptItem.item_price).label("max_price"),
        ).join(Receipt).where(Receipt.status != ReceiptStatus.FAILED)
        
        stmt = self._apply_filters(stmt, filters)
        stmt = stmt.group_by(ReceiptItem.name).order_by(func.sum(ReceiptItem.total_price).desc())
        
        result = await self.session.execute(stmt)
        return [row._asdict() for row in result.all()]

    async def get_product_history(self, item_name: str, filters: AnalyticsFilter) -> List[Dict[str, Any]]:
        stmt = select(
            Receipt.date,
            ReceiptItem.item_price,
            ReceiptItem.quantity,
            ReceiptItem.total_price
        ).join(Receipt).where(
            ReceiptItem.name == item_name,
            Receipt.status != ReceiptStatus.FAILED,
            Receipt.date.isnot(None)
        )
        
        stmt = self._apply_filters(stmt, filters)
        stmt = stmt.order_by(Receipt.date)
        
        result = await self.session.execute(stmt)
        return [row._asdict() for row in result.all()]

    async def get_raw_items_with_receipts(self, filters: AnalyticsFilter) -> List[Dict[str, Any]]:
        stmt = select(
            ReceiptItem.id,
            ReceiptItem.name,
            ReceiptItem.category,
            ReceiptItem.total_price,
            Receipt.id.label("receipt_id")
        ).join(Receipt).where(Receipt.status != ReceiptStatus.FAILED)
        
        stmt = self._apply_filters(stmt, filters)
        
        result = await self.session.execute(stmt)
        return [row._asdict() for row in result.all()]
        
    async def get_daily_timeline(self, filters: AnalyticsFilter) -> List[Dict[str, Any]]:
        date_expr = func.date(Receipt.date).label("date")
        stmt = select(
            date_expr,
            func.sum(Receipt.total_amount).label("total_spend"),
            func.count(Receipt.id).label("receipt_count")
        ).where(Receipt.date.isnot(None), Receipt.status != ReceiptStatus.FAILED)
        
        stmt = self._apply_filters(stmt, filters)
        stmt = stmt.group_by(date_expr).order_by(date_expr)
        
        result = await self.session.execute(stmt)
        return [row._asdict() for row in result.all()]

import pytest
from datetime import datetime, date
from decimal import Decimal

from app.models.receipt import Receipt
from app.models.receipt_item import ReceiptItem
from app.models.enums import ReceiptStatus, StoreType, StorageProvider
from app.analytics.filters import AnalyticsFilter
from app.repositories.analytics_repository import AnalyticsRepository

@pytest.fixture
def analytics_repo(db_session):
    return AnalyticsRepository(db_session)

@pytest.mark.asyncio
async def test_get_dashboard_metrics_empty(analytics_repo):
    filters = AnalyticsFilter()
    result = await analytics_repo.get_dashboard_metrics(filters)
    assert result["metrics"]["total_receipts"] == 0
    assert result["metrics"]["total_spend"] is None
    assert result["status_counts"] == {}

@pytest.mark.asyncio
async def test_get_monthly_spend_empty(analytics_repo):
    filters = AnalyticsFilter()
    result = await analytics_repo.get_monthly_spend(filters)
    assert result == []

@pytest.mark.asyncio
async def test_get_store_analytics_empty(analytics_repo):
    filters = AnalyticsFilter()
    result = await analytics_repo.get_store_analytics(filters)
    assert result == []

@pytest.mark.asyncio
async def test_get_product_analytics_empty(analytics_repo):
    filters = AnalyticsFilter()
    result = await analytics_repo.get_product_analytics(filters)
    assert result == []

@pytest.mark.asyncio
async def test_get_product_history_empty(analytics_repo):
    filters = AnalyticsFilter()
    result = await analytics_repo.get_product_history("Milk", filters)
    assert result == []

@pytest.mark.asyncio
async def test_get_raw_items_with_receipts_empty(analytics_repo):
    filters = AnalyticsFilter()
    result = await analytics_repo.get_raw_items_with_receipts(filters)
    assert result == []

@pytest.mark.asyncio
async def test_get_daily_timeline_empty(analytics_repo):
    filters = AnalyticsFilter()
    result = await analytics_repo.get_daily_timeline(filters)
    assert result == []

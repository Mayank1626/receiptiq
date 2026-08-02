import pytest
from unittest.mock import AsyncMock, MagicMock
from decimal import Decimal
from datetime import datetime, date

from app.services.analytics_service import AnalyticsService
from app.analytics.filters import AnalyticsFilter

@pytest.fixture
def mock_analytics_repo():
    return AsyncMock()

@pytest.fixture
def analytics_service(mock_analytics_repo):
    return AnalyticsService(mock_analytics_repo)

@pytest.mark.asyncio
async def test_get_dashboard_empty(analytics_service, mock_analytics_repo):
    mock_analytics_repo.get_dashboard_metrics.return_value = {
        "metrics": {"total_receipts": 0, "total_spend": None, "average_receipt": None, "largest_receipt": None, "smallest_receipt": None},
        "status_counts": {}
    }
    
    filters = AnalyticsFilter()
    result = await analytics_service.get_dashboard(filters)
    
    assert result.total_receipts == 0
    assert result.total_spend == Decimal("0.00")
    assert result.status_counts.draft == 0

@pytest.mark.asyncio
async def test_get_product_history_empty(analytics_service, mock_analytics_repo):
    mock_analytics_repo.get_product_history.return_value = []
    
    filters = AnalyticsFilter()
    result = await analytics_service.get_product_history("Unknown", filters)
    
    assert result.trend == "FLAT"
    assert result.average_price == Decimal("0.00")

@pytest.mark.asyncio
async def test_get_category_analytics(analytics_service, mock_analytics_repo):
    mock_analytics_repo.get_raw_items_with_receipts.return_value = [
        {"id": 1, "name": "Milk", "category": None, "total_price": 5.0, "receipt_id": 10},
        {"id": 2, "name": "Laptop", "category": None, "total_price": 1000.0, "receipt_id": 11}
    ]
    
    filters = AnalyticsFilter()
    result = await analytics_service.get_category_analytics(filters)
    
    assert len(result) == 2
    assert result[0].category_name == "Electronics"
    assert result[0].total_spend == Decimal("1000.00")
    assert result[1].category_name == "Groceries"
    assert result[1].total_spend == Decimal("5.00")

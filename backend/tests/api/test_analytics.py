import pytest
from httpx import AsyncClient, ASGITransport
from unittest.mock import AsyncMock

from app.main import app
from app.api.dependencies import get_analytics_service
from app.services.analytics_service import AnalyticsService

@pytest.fixture
def mock_analytics_service():
    return AsyncMock(spec=AnalyticsService)

from app.api.dependencies import get_current_user
from app.models.user import User
import uuid

@pytest.fixture
def mock_user():
    user = User(
        id=uuid.uuid4(),
        email="test@example.com",
        is_active=True
    )
    user.memberships = []
    return user

@pytest.fixture
def override_analytics_dependency(mock_analytics_service, mock_user):
    app.dependency_overrides[get_analytics_service] = lambda: mock_analytics_service
    app.dependency_overrides[get_current_user] = lambda: mock_user
    yield
    app.dependency_overrides.clear()

@pytest.fixture
async def async_client(override_analytics_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

@pytest.mark.asyncio
async def test_get_dashboard(async_client, mock_analytics_service):
    mock_analytics_service.get_dashboard.return_value = {
        "total_receipts": 0, "total_spend": 0, "average_receipt": 0, 
        "largest_receipt": 0, "smallest_receipt": 0,
        "status_counts": {"draft": 0, "review_required": 0, "confirmed": 0, "failed": 0}
    }
    response = await async_client.get("/api/v1/analytics/dashboard")
    assert response.status_code == 200

@pytest.mark.asyncio
async def test_get_monthly(async_client, mock_analytics_service):
    mock_analytics_service.get_monthly_spend.return_value = []
    response = await async_client.get("/api/v1/analytics/monthly")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

@pytest.mark.asyncio
async def test_get_timeline(async_client, mock_analytics_service):
    mock_analytics_service.get_daily_timeline.return_value = []
    response = await async_client.get("/api/v1/analytics/timeline")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

@pytest.mark.asyncio
async def test_get_stores(async_client, mock_analytics_service):
    mock_analytics_service.get_store_analytics.return_value = []
    response = await async_client.get("/api/v1/analytics/stores")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

@pytest.mark.asyncio
async def test_get_products(async_client, mock_analytics_service):
    mock_analytics_service.get_product_analytics.return_value = []
    response = await async_client.get("/api/v1/analytics/products")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

@pytest.mark.asyncio
async def test_get_product_history(async_client, mock_analytics_service):
    mock_analytics_service.get_product_history.return_value = {
        "item_name": "Milk", "average_price": 0, "min_price": 0, "max_price": 0, "trend": "FLAT", "percentage_change": None
    }
    response = await async_client.get("/api/v1/analytics/product/Milk")
    assert response.status_code == 200
    data = response.json()
    assert data["item_name"] == "Milk"

@pytest.mark.asyncio
async def test_get_categories(async_client, mock_analytics_service):
    mock_analytics_service.get_category_analytics.return_value = []
    response = await async_client.get("/api/v1/analytics/categories")
    assert response.status_code == 200
    assert isinstance(response.json(), list)

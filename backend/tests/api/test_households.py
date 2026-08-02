import pytest
from httpx import AsyncClient, ASGITransport
from unittest.mock import AsyncMock
import uuid

from app.main import app
from app.api.dependencies import get_household_service, get_current_user
from app.services.household_service import HouseholdService
from app.models.user import User
from app.models.household import Household
from app.models.enums import HouseholdRole

@pytest.fixture
def mock_household_service():
    return AsyncMock(spec=HouseholdService)

from datetime import datetime, timezone

@pytest.fixture
def mock_user():
    user = User(
        id=uuid.uuid4(),
        email="test@example.com",
        is_active=True,
        created_at=datetime.now(timezone.utc),
        updated_at=datetime.now(timezone.utc)
    )
    user.memberships = []
    return user

@pytest.fixture
def override_household_dependency(mock_household_service, mock_user):
    app.dependency_overrides[get_household_service] = lambda: mock_household_service
    app.dependency_overrides[get_current_user] = lambda: mock_user
    yield
    app.dependency_overrides.clear()

@pytest.fixture
async def async_client(override_household_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

@pytest.mark.asyncio
async def test_create_household(async_client, mock_household_service):
    household_id = uuid.uuid4()
    mock_household_service.create_household.return_value = Household(
        id=household_id, 
        name="My House",
        created_at=datetime.now(timezone.utc),
        updated_at=datetime.now(timezone.utc)
    )
    
    response = await async_client.post("/api/v1/households/", json={
        "name": "My House"
    })
    
    assert response.status_code == 201
    assert response.json()["name"] == "My House"

@pytest.mark.asyncio
async def test_get_household(async_client, mock_household_service):
    household_id = uuid.uuid4()
    mock_household_service.get_household.return_value = Household(
        id=household_id, 
        name="My House",
        created_at=datetime.now(timezone.utc),
        updated_at=datetime.now(timezone.utc)
    )
    
    response = await async_client.get(f"/api/v1/households/{household_id}")
    
    assert response.status_code == 200
    assert response.json()["name"] == "My House"

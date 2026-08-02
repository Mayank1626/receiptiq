import pytest
from httpx import AsyncClient, ASGITransport
from unittest.mock import AsyncMock
import uuid
from datetime import datetime, timezone

from app.main import app
from app.api.dependencies import get_auth_service, get_current_user
from app.services.auth_service import AuthService
from app.models.user import User

@pytest.fixture
def mock_auth_service():
    return AsyncMock(spec=AuthService)

@pytest.fixture
def override_auth_dependency(mock_auth_service):
    app.dependency_overrides[get_auth_service] = lambda: mock_auth_service
    yield
    app.dependency_overrides.clear()

@pytest.fixture
async def async_client(override_auth_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

@pytest.mark.asyncio
async def test_register(async_client, mock_auth_service):
    user_id = uuid.uuid4()
    mock_auth_service.register.return_value = User(
        id=user_id, 
        email="test@example.com", 
        is_active=True,
        created_at=datetime.now(timezone.utc),
        updated_at=datetime.now(timezone.utc)
    )
    
    response = await async_client.post("/api/v1/auth/register", json={
        "email": "test@example.com",
        "password": "password123",
        "full_name": "Test User"
    })
    
    assert response.status_code == 201
    assert response.json()["email"] == "test@example.com"

@pytest.mark.asyncio
async def test_login(async_client, mock_auth_service):
    from app.schemas.auth import TokenResponse
    mock_auth_service.login.return_value = TokenResponse(
        access_token="access_token",
        refresh_token="refresh_token",
        token_type="bearer"
    )
    
    response = await async_client.post("/api/v1/auth/login", json={
        "email": "test@example.com",
        "password": "password123"
    })
    
    assert response.status_code == 200
    assert response.json()["access_token"] == "access_token"
    assert response.json()["token_type"] == "bearer"

@pytest.mark.asyncio
async def test_me(async_client, mock_auth_service):
    user = User(
        id=uuid.uuid4(), 
        email="test@example.com",
        is_active=True,
        created_at=datetime.now(timezone.utc),
        updated_at=datetime.now(timezone.utc)
    )
    app.dependency_overrides[get_current_user] = lambda: user
    
    response = await async_client.get("/api/v1/auth/me")
    
    assert response.status_code == 200
    assert response.json()["email"] == "test@example.com"
    
    app.dependency_overrides.clear()

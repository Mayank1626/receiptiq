import pytest
from httpx import AsyncClient, ASGITransport
from unittest.mock import AsyncMock
from app.main import app
from app.api.dependencies import get_receipt_materialization_service
from app.models.receipt import Receipt
from app.models.enums import ReceiptStatus, ReceiptSource, StorageProvider
import uuid
from datetime import datetime, timezone

@pytest.fixture
def mock_materialize_service():
    return AsyncMock()

@pytest.fixture
def override_materialize_dependency(mock_materialize_service):
    app.dependency_overrides[get_receipt_materialization_service] = lambda: mock_materialize_service
    yield
    app.dependency_overrides.clear()

@pytest.fixture
async def async_client(override_materialize_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

@pytest.mark.asyncio
async def test_materialize_api(async_client, mock_materialize_service):
    ai_id = uuid.uuid4()
    receipt_id = uuid.uuid4()
    
    mock_receipt = Receipt(
        id=receipt_id,
        status=ReceiptStatus.DRAFT,
        source=ReceiptSource.UPLOAD,
        storage_provider=StorageProvider.LOCAL,
        store_name="Walmart",
        file_path="test.jpg",
        created_at=datetime.now(timezone.utc),
        updated_at=datetime.now(timezone.utc),
        items=[]
    )
    mock_materialize_service.materialize_receipt.return_value = mock_receipt
    
    response = await async_client.post(f"/api/v1/materialize/{ai_id}")
    
    assert response.status_code == 201
    assert response.json()["id"] == str(receipt_id)
    assert response.json()["store_name"] == "Walmart"

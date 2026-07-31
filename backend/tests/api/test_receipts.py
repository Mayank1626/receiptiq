import pytest
from httpx import AsyncClient, ASGITransport
import uuid
from decimal import Decimal
from datetime import datetime, timezone
from unittest.mock import AsyncMock

from app.main import app
from app.api.dependencies import get_receipt_service
from app.services.receipt_service import ReceiptService
from app.models.receipt import Receipt
from app.models.enums import ReceiptStatus, ReceiptSource, StorageProvider
from app.core.exceptions import ReceiptNotFoundError, InvalidReceiptError

@pytest.fixture
def mock_service():
    return AsyncMock(spec=ReceiptService)

@pytest.fixture
def override_dependency(mock_service):
    app.dependency_overrides[get_receipt_service] = lambda: mock_service
    yield
    app.dependency_overrides.clear()

@pytest.fixture
async def async_client(override_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

def create_mock_receipt(receipt_id=None, total_amount=None):
    return Receipt(
        id=receipt_id or uuid.uuid4(),
        status=ReceiptStatus.PENDING,
        source=ReceiptSource.UPLOAD,
        storage_provider=StorageProvider.LOCAL,
        file_path="test.pdf",
        total_amount=total_amount,
        created_at=datetime.now(timezone.utc),
        updated_at=datetime.now(timezone.utc)
    )

@pytest.mark.asyncio
async def test_create_receipt(async_client, mock_service):
    receipt_id = uuid.uuid4()
    mock_service.create_receipt.return_value = create_mock_receipt(receipt_id, total_amount=10.00)
    
    response = await async_client.post("/api/v1/receipts/", json={
        "file_path": "test.pdf",
        "total_amount": 10.00
    })
    
    assert response.status_code == 201
    assert response.json()["id"] == str(receipt_id)

@pytest.mark.asyncio
async def test_list_receipts(async_client, mock_service):
    receipt_id = uuid.uuid4()
    mock_service.list_receipts.return_value = [create_mock_receipt(receipt_id, total_amount=10.00)]
    
    response = await async_client.get("/api/v1/receipts/")
    
    assert response.status_code == 200
    assert len(response.json()) == 1
    assert response.json()[0]["id"] == str(receipt_id)

@pytest.mark.asyncio
async def test_get_receipt(async_client, mock_service):
    receipt_id = uuid.uuid4()
    mock_service.get_receipt.return_value = create_mock_receipt(receipt_id)
    
    response = await async_client.get(f"/api/v1/receipts/{receipt_id}")
    
    assert response.status_code == 200
    assert response.json()["id"] == str(receipt_id)

@pytest.mark.asyncio
async def test_update_receipt(async_client, mock_service):
    receipt_id = uuid.uuid4()
    mock_service.update_receipt.return_value = create_mock_receipt(receipt_id, total_amount=20.00)
    
    response = await async_client.patch(f"/api/v1/receipts/{receipt_id}", json={
        "file_path": "test.pdf",
        "total_amount": 20.00
    })
    
    assert response.status_code == 200

@pytest.mark.asyncio
async def test_delete_receipt(async_client, mock_service):
    receipt_id = uuid.uuid4()
    mock_service.delete_receipt.return_value = None
    
    response = await async_client.delete(f"/api/v1/receipts/{receipt_id}")
    
    assert response.status_code == 204

@pytest.mark.asyncio
async def test_receipt_not_found(async_client, mock_service):
    mock_service.get_receipt.side_effect = ReceiptNotFoundError("Not found")
    
    response = await async_client.get(f"/api/v1/receipts/{uuid.uuid4()}")
    
    assert response.status_code == 404
    assert response.json()["detail"] == "Not found"

@pytest.mark.asyncio
async def test_invalid_receipt(async_client, mock_service):
    mock_service.create_receipt.side_effect = InvalidReceiptError("Invalid")
    
    response = await async_client.post("/api/v1/receipts/", json={"file_path": "test.pdf", "total_amount": -10.00})
    
    assert response.status_code == 400
    assert response.json()["detail"] == "Invalid"

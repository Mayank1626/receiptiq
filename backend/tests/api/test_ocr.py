import pytest
from httpx import AsyncClient, ASGITransport
from unittest.mock import AsyncMock
from app.main import app
from app.api.dependencies import get_ocr_service
from app.models.ocr_result import OCRResult
import uuid
from datetime import datetime, timezone
from app.core.exceptions import ReceiptNotFoundError

@pytest.fixture
def mock_ocr_service():
    return AsyncMock()

@pytest.fixture
def override_ocr_dependency(mock_ocr_service):
    app.dependency_overrides[get_ocr_service] = lambda: mock_ocr_service
    yield
    app.dependency_overrides.clear()

@pytest.fixture
async def async_client(override_ocr_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

@pytest.mark.asyncio
async def test_process_ocr_api_success(async_client, mock_ocr_service):
    file_id = uuid.uuid4()
    result_id = uuid.uuid4()
    
    mock_record = OCRResult(
        id=result_id,
        uploaded_file_id=file_id,
        provider="mock",
        provider_version="1.0",
        status="SUCCESS",
        raw_text="sample text",
        confidence=0.99,
        processing_time_ms=100,
        error_message=None,
        created_at=datetime.now(timezone.utc)
    )
    mock_ocr_service.process_file.return_value = mock_record
    
    response = await async_client.post(f"/api/v1/ocr/{file_id}")
    
    assert response.status_code == 201
    assert response.json()["id"] == str(result_id)
    assert response.json()["raw_text"] == "sample text"

@pytest.mark.asyncio
async def test_process_ocr_api_not_found(async_client, mock_ocr_service):
    file_id = uuid.uuid4()
    mock_ocr_service.process_file.side_effect = ReceiptNotFoundError("File not found")
    
    response = await async_client.post(f"/api/v1/ocr/{file_id}")
    
    assert response.status_code == 404
    assert "File not found" in response.json()["detail"]

import pytest
from httpx import AsyncClient, ASGITransport
from unittest.mock import AsyncMock
from app.main import app
from app.api.dependencies import get_ai_service
from app.models.ai_extraction_result import AIExtractionResult
import uuid
from datetime import datetime, timezone
from app.core.exceptions import ReceiptNotFoundError

@pytest.fixture
def mock_ai_service():
    return AsyncMock()

@pytest.fixture
def override_ai_dependency(mock_ai_service):
    app.dependency_overrides[get_ai_service] = lambda: mock_ai_service
    yield
    app.dependency_overrides.clear()

@pytest.fixture
async def async_client(override_ai_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

@pytest.mark.asyncio
async def test_process_ai_api_success(async_client, mock_ai_service):
    ocr_id = uuid.uuid4()
    result_id = uuid.uuid4()
    
    mock_record = AIExtractionResult(
        id=result_id,
        ocr_result_id=ocr_id,
        provider="gemini",
        model="flash",
        prompt_version="v1",
        raw_response="{}",
        structured_json={"store_name": "Walmart"},
        confidence=0.99,
        processing_time_ms=100,
        error_message=None,
        created_at=datetime.now(timezone.utc)
    )
    mock_ai_service.process_ocr_result.return_value = mock_record
    
    response = await async_client.post(f"/api/v1/ai/{ocr_id}")
    
    assert response.status_code == 201
    assert response.json()["id"] == str(result_id)
    assert response.json()["structured_json"]["store_name"] == "Walmart"

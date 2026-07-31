import pytest
from httpx import AsyncClient, ASGITransport
from unittest.mock import AsyncMock
from app.main import app
from app.api.dependencies import get_upload_service
from app.models.uploaded_file import UploadedFile
from app.models.enums import StorageProvider, ProcessingStatus
import uuid
from datetime import datetime, timezone
from app.core.exceptions import FileValidationError

@pytest.fixture
def mock_upload_service():
    return AsyncMock()

@pytest.fixture
def override_upload_dependency(mock_upload_service):
    app.dependency_overrides[get_upload_service] = lambda: mock_upload_service
    yield
    app.dependency_overrides.clear()

@pytest.fixture
async def async_client(override_upload_dependency):
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as client:
        yield client

@pytest.mark.asyncio
async def test_upload_receipt_api_success(async_client, mock_upload_service):
    file_id = uuid.uuid4()
    mock_record = UploadedFile(
        id=file_id,
        original_filename="receipt.jpg",
        stored_filename="stored.jpg",
        storage_path="uploads/path/stored.jpg",
        mime_type="image/jpeg",
        size_bytes=100,
        checksum_sha256="hash",
        storage_provider=StorageProvider.LOCAL,
        processing_status=ProcessingStatus.UPLOADED,
        uploaded_at=datetime.now(timezone.utc)
    )
    mock_upload_service.upload_file.return_value = mock_record
    
    response = await async_client.post(
        "/api/v1/uploads/",
        files={"file": ("receipt.jpg", b"fake image", "image/jpeg")}
    )
    
    assert response.status_code == 201
    assert response.json()["id"] == str(file_id)
    assert response.json()["original_filename"] == "receipt.jpg"

@pytest.mark.asyncio
async def test_upload_receipt_api_invalid_mime(async_client, mock_upload_service):
    mock_upload_service.upload_file.side_effect = FileValidationError("Unsupported file type")
    
    response = await async_client.post(
        "/api/v1/uploads/",
        files={"file": ("receipt.exe", b"fake exe", "application/x-msdownload")}
    )
    
    assert response.status_code == 400
    assert "Unsupported file type" in response.json()["detail"]

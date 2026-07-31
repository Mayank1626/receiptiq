import pytest
from unittest.mock import AsyncMock
import io
from fastapi import UploadFile

from app.services.upload_service import UploadService
from app.core.exceptions import FileValidationError, RepositoryError

@pytest.fixture
def mock_session():
    return AsyncMock()

@pytest.fixture
def mock_provider():
    provider = AsyncMock()
    provider.save.return_value = "fake/path.pdf"
    return provider

@pytest.fixture
def mock_repository():
    repo = AsyncMock()
    repo.create.side_effect = lambda x: x  # return the passed record
    return repo

@pytest.fixture
def upload_service(mock_session, mock_provider, mock_repository):
    return UploadService(
        session=mock_session,
        provider=mock_provider,
        repository=mock_repository
    )

def create_upload_file(filename: str, content: bytes, content_type: str) -> UploadFile:
    file = io.BytesIO(content)
    return UploadFile(filename=filename, file=file, headers={"content-type": content_type})

@pytest.mark.asyncio
async def test_upload_success(upload_service, mock_session, mock_provider, mock_repository):
    file = create_upload_file("receipt.pdf", b"pdfcontent", "application/pdf")
    
    record = await upload_service.upload_file(file)
    
    assert record.original_filename == "receipt.pdf"
    assert record.mime_type == "application/pdf"
    assert record.size_bytes == 10
    
    mock_provider.save.assert_called_once()
    mock_repository.create.assert_called_once()
    mock_session.commit.assert_called_once()

@pytest.mark.asyncio
async def test_upload_invalid_mime(upload_service):
    file = create_upload_file("malicious.exe", b"execontent", "application/x-msdownload")
    with pytest.raises(FileValidationError):
        await upload_service.upload_file(file)

@pytest.mark.asyncio
async def test_upload_large_file(upload_service):
    # Mocking large size since we don't want to load 11MB into memory
    file = create_upload_file("large.jpg", b"a", "image/jpeg")
    
    # Patch the read method of the UploadFile to simulate a large file without taking real memory
    file.read = AsyncMock(return_value=b"a" * (11 * 1024 * 1024))
    
    with pytest.raises(FileValidationError):
        await upload_service.upload_file(file)

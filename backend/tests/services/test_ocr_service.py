import pytest
from unittest.mock import AsyncMock
from app.services.ocr_service import OCRService
from app.ocr.types import OCRExtractionResult
from app.models.uploaded_file import UploadedFile
from app.models.ocr_result import OCRResult
from app.models.enums import ProcessingStatus
from app.core.exceptions import ReceiptNotFoundError, RepositoryError
import uuid

@pytest.fixture
def mock_session():
    return AsyncMock()

@pytest.fixture
def mock_provider():
    provider = AsyncMock()
    provider.provider_name = "test_provider"
    provider.provider_version = "1.0"
    provider.extract_text.return_value = OCRExtractionResult(
        raw_text="extracted text",
        confidence=0.95,
        processing_time_ms=50
    )
    return provider

@pytest.fixture
def mock_ocr_repo():
    repo = AsyncMock()
    repo.get_by_file_id.return_value = None
    repo.create.side_effect = lambda x: x
    return repo

@pytest.fixture
def mock_upload_repo():
    repo = AsyncMock()
    file_id = uuid.uuid4()
    mock_file = UploadedFile(id=file_id, processing_status=ProcessingStatus.UPLOADED, storage_path="test/path.jpg")
    repo.get_by_id.return_value = mock_file
    return repo

@pytest.fixture
def ocr_service(mock_session, mock_provider, mock_ocr_repo, mock_upload_repo):
    return OCRService(
        session=mock_session,
        provider=mock_provider,
        ocr_repo=mock_ocr_repo,
        upload_repo=mock_upload_repo
    )

@pytest.mark.asyncio
async def test_process_file_success(ocr_service, mock_session, mock_provider, mock_ocr_repo, mock_upload_repo):
    file_id = uuid.uuid4()
    mock_file = UploadedFile(id=file_id, processing_status=ProcessingStatus.UPLOADED, storage_path="test/path.jpg")
    mock_upload_repo.get_by_id.return_value = mock_file
    
    result = await ocr_service.process_file(file_id)
    
    assert result.status == "SUCCESS"
    assert result.raw_text == "extracted text"
    
    mock_provider.extract_text.assert_called_once_with("test/path.jpg")
    mock_ocr_repo.create.assert_called_once()
    mock_upload_repo.update.assert_called_once()
    mock_session.commit.assert_called_once()
    assert mock_file.processing_status == ProcessingStatus.OCR_COMPLETED

@pytest.mark.asyncio
async def test_process_file_not_found(ocr_service, mock_upload_repo):
    mock_upload_repo.get_by_id.return_value = None
    with pytest.raises(ReceiptNotFoundError):
        await ocr_service.process_file(uuid.uuid4())

@pytest.mark.asyncio
async def test_process_file_invalid_status(ocr_service, mock_upload_repo):
    file_id = uuid.uuid4()
    mock_file = UploadedFile(id=file_id, processing_status=ProcessingStatus.OCR_COMPLETED, storage_path="test/path.jpg")
    mock_upload_repo.get_by_id.return_value = mock_file
    with pytest.raises(RepositoryError):
        await ocr_service.process_file(file_id)

@pytest.mark.asyncio
async def test_process_file_already_processed(ocr_service, mock_upload_repo, mock_ocr_repo):
    file_id = uuid.uuid4()
    mock_file = UploadedFile(id=file_id, processing_status=ProcessingStatus.UPLOADED, storage_path="test/path.jpg")
    mock_upload_repo.get_by_id.return_value = mock_file
    
    existing_result = OCRResult(id=uuid.uuid4(), status="SUCCESS", raw_text="exists")
    mock_ocr_repo.get_by_file_id.return_value = existing_result
    
    result = await ocr_service.process_file(file_id)
    assert result == existing_result
    mock_ocr_repo.create.assert_not_called()

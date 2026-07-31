import pytest
from unittest.mock import AsyncMock
from app.services.ai_service import AIService
from app.ai.types import AIExtraction
from app.models.uploaded_file import UploadedFile
from app.models.ocr_result import OCRResult
from app.models.ai_extraction_result import AIExtractionResult
from app.models.enums import ProcessingStatus
from app.core.exceptions import ReceiptNotFoundError, RepositoryError
import uuid

@pytest.fixture
def mock_session():
    return AsyncMock()

@pytest.fixture
def mock_provider():
    provider = AsyncMock()
    provider.provider_name = "test_ai"
    provider.model_name = "test_model"
    provider.extract_receipt.return_value = AIExtraction(
        structured_json={"store_name": "Test"},
        confidence=0.9,
        processing_time_ms=100,
        raw_response="{}"
    )
    return provider

@pytest.fixture
def mock_ai_repo():
    repo = AsyncMock()
    repo.get_by_ocr_result_id.return_value = None
    repo.create.side_effect = lambda x: x
    return repo

@pytest.fixture
def mock_ocr_repo():
    repo = AsyncMock()
    file_id = uuid.uuid4()
    mock_ocr = OCRResult(id=uuid.uuid4(), uploaded_file_id=file_id, status="SUCCESS", raw_text="text")
    repo.get_by_id.return_value = mock_ocr
    return repo

@pytest.fixture
def mock_upload_repo():
    repo = AsyncMock()
    file_id = uuid.uuid4()
    mock_file = UploadedFile(id=file_id, processing_status=ProcessingStatus.OCR_COMPLETED, storage_path="test/path.jpg")
    repo.get_by_id.return_value = mock_file
    return repo

@pytest.fixture
def ai_service(mock_session, mock_provider, mock_ai_repo, mock_ocr_repo, mock_upload_repo):
    return AIService(
        session=mock_session,
        provider=mock_provider,
        ai_repo=mock_ai_repo,
        ocr_repo=mock_ocr_repo,
        upload_repo=mock_upload_repo
    )

@pytest.mark.asyncio
async def test_process_ocr_result_success(ai_service, mock_session, mock_provider, mock_ai_repo, mock_upload_repo):
    ocr_id = uuid.uuid4()
    
    result = await ai_service.process_ocr_result(ocr_id)
    
    assert result.structured_json["store_name"] == "Test"
    
    mock_provider.extract_receipt.assert_called_once()
    mock_ai_repo.create.assert_called_once()
    mock_upload_repo.update.assert_called_once()
    mock_session.commit.assert_called_once()
    # verify status updated to AI_COMPLETED
    updated_file = mock_upload_repo.update.call_args[0][0]
    assert updated_file.processing_status == ProcessingStatus.AI_COMPLETED

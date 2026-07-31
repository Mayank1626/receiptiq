import pytest
from unittest.mock import AsyncMock
import uuid
from app.services.receipt_materialization_service import ReceiptMaterializationService
from app.models.ai_extraction_result import AIExtractionResult
from app.models.ocr_result import OCRResult
from app.models.uploaded_file import UploadedFile
from app.models.enums import ProcessingStatus
from app.core.exceptions import ReceiptNotFoundError

@pytest.fixture
def mock_session():
    return AsyncMock()

@pytest.fixture
def mock_ai_repo():
    repo = AsyncMock()
    ai_res = AIExtractionResult(
        id=uuid.uuid4(),
        ocr_result_id=uuid.uuid4(),
        structured_json={"store_name": "Test", "items": []}
    )
    repo.get_by_id.return_value = ai_res
    return repo

@pytest.fixture
def mock_receipt_repo():
    repo = AsyncMock()
    repo.create.side_effect = lambda x: x
    return repo

@pytest.fixture
def mock_upload_repo():
    repo = AsyncMock()
    file = UploadedFile(id=uuid.uuid4(), processing_status=ProcessingStatus.AI_COMPLETED, storage_path="path")
    repo.get_by_id.return_value = file
    return repo

@pytest.fixture
def mock_ocr_repo():
    repo = AsyncMock()
    ocr = OCRResult(id=uuid.uuid4(), uploaded_file_id=uuid.uuid4())
    repo.get_by_id.return_value = ocr
    return repo

@pytest.mark.asyncio
async def test_materialize_receipt_success(
    mock_session, mock_ai_repo, mock_receipt_repo, mock_upload_repo, mock_ocr_repo
):
    service = ReceiptMaterializationService(
        session=mock_session,
        ai_repo=mock_ai_repo,
        receipt_repo=mock_receipt_repo,
        upload_repo=mock_upload_repo,
        ocr_repo=mock_ocr_repo
    )
    
    receipt = await service.materialize_receipt(uuid.uuid4())
    assert receipt.store_name == "Test"
    
    mock_receipt_repo.create.assert_called_once()
    mock_upload_repo.update.assert_called_once()
    mock_session.commit.assert_called_once()
    
    # check status
    file = mock_upload_repo.update.call_args[0][0]
    assert file.processing_status == ProcessingStatus.MATERIALIZED

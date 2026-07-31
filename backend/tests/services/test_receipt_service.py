import pytest
import uuid
from decimal import Decimal
from unittest.mock import AsyncMock

from sqlalchemy.exc import SQLAlchemyError

from app.services.receipt_service import ReceiptService
from app.schemas.receipt import ReceiptCreate
from app.models.receipt import Receipt
from app.core.exceptions import ReceiptNotFoundError, InvalidReceiptError, RepositoryError

@pytest.fixture
def mock_session():
    return AsyncMock()

@pytest.fixture
def mock_receipt_repo():
    return AsyncMock()

@pytest.fixture
def mock_item_repo():
    return AsyncMock()

@pytest.fixture
def receipt_service(mock_session, mock_receipt_repo, mock_item_repo):
    return ReceiptService(
        session=mock_session,
        receipt_repo=mock_receipt_repo,
        item_repo=mock_item_repo
    )

def test_validate_monetary_values_valid(receipt_service):
    receipt_in = ReceiptCreate(
        file_path="test.pdf",
        total_amount=Decimal("10.00"),
        tax=Decimal("0.00")
    )
    receipt_service._validate_monetary_values(receipt_in)

def test_validate_monetary_values_invalid(receipt_service):
    receipt_in = ReceiptCreate(
        file_path="test.pdf",
        total_amount=Decimal("-10.00")
    )
    with pytest.raises(InvalidReceiptError):
        receipt_service._validate_monetary_values(receipt_in)

@pytest.mark.asyncio
async def test_create_receipt_success(receipt_service, mock_session, mock_receipt_repo, mock_item_repo):
    receipt_in = ReceiptCreate(file_path="test.pdf", total_amount=Decimal("10.00"))
    created_receipt = Receipt(id=uuid.uuid4(), file_path="test.pdf")
    
    mock_receipt_repo.create.return_value = created_receipt
    
    result = await receipt_service.create_receipt(receipt_in)
    
    assert result == created_receipt
    mock_receipt_repo.create.assert_called_once()
    mock_session.commit.assert_called_once()
    mock_session.refresh.assert_called_once_with(created_receipt)

@pytest.mark.asyncio
async def test_create_receipt_rollback_on_failure(receipt_service, mock_session, mock_receipt_repo):
    receipt_in = ReceiptCreate(file_path="test.pdf")
    mock_receipt_repo.create.side_effect = SQLAlchemyError("DB Error")
    
    with pytest.raises(RepositoryError):
        await receipt_service.create_receipt(receipt_in)
        
    mock_session.commit.assert_not_called()
    mock_session.rollback.assert_called_once()

@pytest.mark.asyncio
async def test_get_receipt_success(receipt_service, mock_receipt_repo):
    receipt_id = uuid.uuid4()
    receipt = Receipt(id=receipt_id, file_path="test.pdf")
    mock_receipt_repo.get_by_id.return_value = receipt
    
    result = await receipt_service.get_receipt(receipt_id)
    assert result == receipt

@pytest.mark.asyncio
async def test_get_receipt_not_found(receipt_service, mock_receipt_repo):
    mock_receipt_repo.get_by_id.return_value = None
    
    with pytest.raises(ReceiptNotFoundError):
        await receipt_service.get_receipt(uuid.uuid4())

@pytest.mark.asyncio
async def test_update_receipt_success(receipt_service, mock_session, mock_receipt_repo):
    receipt_id = uuid.uuid4()
    existing_receipt = Receipt(id=receipt_id, file_path="old.pdf")
    receipt_in = ReceiptCreate(file_path="new.pdf")
    
    mock_receipt_repo.get_by_id.return_value = existing_receipt
    mock_receipt_repo.update.return_value = existing_receipt
    
    result = await receipt_service.update_receipt(receipt_id, receipt_in)
    
    assert result.file_path == "new.pdf"
    mock_session.commit.assert_called_once()
    mock_session.refresh.assert_called_once_with(existing_receipt)

@pytest.mark.asyncio
async def test_update_receipt_not_found(receipt_service, mock_session, mock_receipt_repo):
    mock_receipt_repo.get_by_id.return_value = None
    receipt_in = ReceiptCreate(file_path="new.pdf")
    
    with pytest.raises(ReceiptNotFoundError):
        await receipt_service.update_receipt(uuid.uuid4(), receipt_in)
        
    mock_session.rollback.assert_called_once()

@pytest.mark.asyncio
async def test_delete_receipt_success(receipt_service, mock_session, mock_receipt_repo):
    receipt_id = uuid.uuid4()
    existing_receipt = Receipt(id=receipt_id, file_path="old.pdf")
    mock_receipt_repo.get_by_id.return_value = existing_receipt
    
    await receipt_service.delete_receipt(receipt_id)
    
    mock_receipt_repo.delete.assert_called_once_with(existing_receipt)
    mock_session.commit.assert_called_once()

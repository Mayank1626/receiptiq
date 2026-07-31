import pytest
import uuid
from app.models.receipt import Receipt
from app.models.receipt_item import ReceiptItem
from app.repositories.receipt_repository import ReceiptRepository
from app.repositories.receipt_item_repository import ReceiptItemRepository

@pytest.mark.asyncio
async def test_create_receipt(db_session):
    repo = ReceiptRepository(db_session)
    receipt = Receipt(file_path="test_create.pdf")
    
    created = await repo.create(receipt)
    assert created.id is not None
    assert created.file_path == "test_create.pdf"

@pytest.mark.asyncio
async def test_get_receipt_by_id(db_session):
    repo = ReceiptRepository(db_session)
    receipt = Receipt(file_path="test_get.pdf")
    created = await repo.create(receipt)
    
    fetched = await repo.get_by_id(created.id)
    assert fetched is not None
    assert fetched.id == created.id
    assert fetched.file_path == "test_get.pdf"

@pytest.mark.asyncio
async def test_receipt_exists(db_session):
    repo = ReceiptRepository(db_session)
    receipt = Receipt(file_path="test_exists.pdf")
    created = await repo.create(receipt)
    
    assert await repo.exists(created.id) is True
    assert await repo.exists(uuid.uuid4()) is False

@pytest.mark.asyncio
async def test_list_receipts(db_session):
    repo = ReceiptRepository(db_session)
    await repo.create(Receipt(file_path="test_list_1.pdf"))
    await repo.create(Receipt(file_path="test_list_2.pdf"))
    
    receipts = await repo.list(skip=0, limit=10)
    assert len(receipts) >= 2

@pytest.mark.asyncio
async def test_delete_receipt(db_session):
    repo = ReceiptRepository(db_session)
    receipt = Receipt(file_path="test_delete.pdf")
    created = await repo.create(receipt)
    
    assert await repo.exists(created.id) is True
    await repo.delete(created)
    assert await repo.exists(created.id) is False

@pytest.mark.asyncio
async def test_receipt_eager_loads_items(db_session):
    repo = ReceiptRepository(db_session)
    item_repo = ReceiptItemRepository(db_session)
    
    receipt = Receipt(file_path="test_eager.pdf")
    created_receipt = await repo.create(receipt)
    
    item = ReceiptItem(receipt_id=created_receipt.id, name="Test Item", quantity=1.0)
    await item_repo.create(item)
    
    fetched = await repo.get_by_id(created_receipt.id)
    assert fetched is not None
    assert len(fetched.items) == 1
    assert fetched.items[0].name == "Test Item"

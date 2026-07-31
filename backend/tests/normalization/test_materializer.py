import pytest
from decimal import Decimal
from datetime import datetime, timezone
import uuid
from app.normalization.normalizer import NormalizedReceipt, NormalizedItem
from app.normalization.materializer import ReceiptMaterializer
from app.models.enums import ReceiptStatus, ReceiptSource

def test_materializer():
    materializer = ReceiptMaterializer()
    
    normalized = NormalizedReceipt(
        store_name="Target",
        date=datetime(2026, 7, 31, 12, 0, 0, tzinfo=timezone.utc),
        subtotal=Decimal("50.0"),
        tax=Decimal("5.0"),
        total_amount=Decimal("55.0"),
        items=[
            NormalizedItem(name="Bread", quantity=Decimal("1"), price=Decimal("3.0"), total=Decimal("3.0"))
        ]
    )
    
    file_id = uuid.uuid4()
    ocr_id = uuid.uuid4()
    ai_id = uuid.uuid4()
    file_path = "test/path.jpg"
    
    receipt = materializer.materialize(normalized, file_id, ocr_id, ai_id, file_path)
    
    assert receipt.status == ReceiptStatus.DRAFT
    assert receipt.source == ReceiptSource.UPLOAD
    assert receipt.uploaded_file_id == file_id
    assert receipt.ocr_result_id == ocr_id
    assert receipt.ai_extraction_result_id == ai_id
    assert receipt.file_path == file_path
    assert receipt.store_name == "Target"
    
    assert len(receipt.items) == 1
    assert receipt.items[0].name == "Bread"

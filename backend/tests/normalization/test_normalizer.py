import pytest
from datetime import datetime, timezone
from decimal import Decimal
from app.normalization.types import AIProposedReceipt, AIProposedItem
from app.normalization.normalizer import ReceiptNormalizer

def test_normalizer_success():
    normalizer = ReceiptNormalizer()
    proposed = AIProposedReceipt(
        store_name="  Walmart  ",
        date="2026-07-31T12:00:00Z",
        subtotal=100.0,
        tax=5.5,
        total_amount=105.5,
        items=[
            AIProposedItem(name="  Milk  ", quantity=2, price=2.0)
        ]
    )
    
    normalized = normalizer.normalize(proposed)
    assert normalized.store_name == "Walmart"
    assert normalized.date == datetime(2026, 7, 31, 12, 0, 0, tzinfo=timezone.utc)
    assert normalized.subtotal == Decimal("100.0")
    assert normalized.tax == Decimal("5.5")
    assert normalized.total_amount == Decimal("105.5")
    
    assert len(normalized.items) == 1
    assert normalized.items[0].name == "Milk"
    assert normalized.items[0].quantity == Decimal("2.0")
    assert normalized.items[0].price == Decimal("2.0")
    assert normalized.items[0].total == Decimal("4.0") # fallback calculation

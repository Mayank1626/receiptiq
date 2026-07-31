import pytest
from app.normalization.validator import AIOutputValidator, NormalizationValidationError

def test_validator_success():
    validator = AIOutputValidator()
    valid_json = {
        "store_name": "Test Store",
        "total_amount": 100.0,
        "items": [
            {"name": "Item 1", "quantity": 1, "price": 100.0, "total": 100.0}
        ]
    }
    result = validator.validate(valid_json)
    assert result.store_name == "Test Store"

def test_validator_negative_total():
    validator = AIOutputValidator()
    invalid_json = {
        "total_amount": -10.0,
        "items": []
    }
    with pytest.raises(NormalizationValidationError, match="Total amount cannot be negative"):
        validator.validate(invalid_json)

def test_validator_missing_item_name():
    validator = AIOutputValidator()
    invalid_json = {
        "items": [
            {"name": "", "quantity": 1}
        ]
    }
    with pytest.raises(NormalizationValidationError, match="Item name must be present"):
        validator.validate(invalid_json)

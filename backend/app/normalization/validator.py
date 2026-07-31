from app.normalization.types import AIProposedReceipt
from pydantic import ValidationError
from typing import Dict, Any

class NormalizationValidationError(Exception):
    pass

class AIOutputValidator:
    def validate(self, ai_json: Dict[str, Any]) -> AIProposedReceipt:
        try:
            receipt = AIProposedReceipt(**ai_json)
        except ValidationError as e:
            raise NormalizationValidationError(f"Invalid AI output schema: {e}")
            
        if receipt.total_amount is not None and receipt.total_amount < 0:
            raise NormalizationValidationError("Total amount cannot be negative")
            
        if receipt.subtotal is not None and receipt.subtotal < 0:
            raise NormalizationValidationError("Subtotal cannot be negative")
            
        if receipt.tax is not None and receipt.tax < 0:
            raise NormalizationValidationError("Tax cannot be negative")
            
        for item in receipt.items:
            if item.quantity is not None and item.quantity <= 0:
                raise NormalizationValidationError("Item quantity must be > 0")
            if not item.name or not item.name.strip():
                raise NormalizationValidationError("Item name must be present")
                
        return receipt

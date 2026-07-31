from app.normalization.normalizer import NormalizedReceipt
from app.models.receipt import Receipt
from app.models.receipt_item import ReceiptItem
from app.models.enums import ReceiptStatus, ReceiptSource
import uuid

class ReceiptMaterializer:
    def materialize(self, normalized: NormalizedReceipt, file_id: uuid.UUID, ocr_id: uuid.UUID, ai_id: uuid.UUID, file_path: str) -> Receipt:
        receipt = Receipt(
            status=ReceiptStatus.DRAFT,
            source=ReceiptSource.UPLOAD,
            uploaded_file_id=file_id,
            ocr_result_id=ocr_id,
            ai_extraction_result_id=ai_id,
            file_path=file_path,
            store_name=normalized.store_name,
            date=normalized.date,
            subtotal=normalized.subtotal,
            tax=normalized.tax,
            total_amount=normalized.total_amount
        )
        
        items = []
        for i in normalized.items:
            items.append(ReceiptItem(
                name=i.name,
                quantity=float(i.quantity),
                item_price=i.price,
                total_price=i.total
            ))
        receipt.items = items
        return receipt

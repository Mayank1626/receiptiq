from datetime import datetime
from decimal import Decimal
import re
from app.normalization.types import AIProposedReceipt
from typing import Dict, Any, List

class NormalizedItem:
    def __init__(self, name: str, quantity: Decimal, price: Decimal, total: Decimal):
        self.name = name
        self.quantity = quantity
        self.price = price
        self.total = total

class NormalizedReceipt:
    def __init__(
        self, 
        store_name: str | None,
        date: datetime | None,
        subtotal: Decimal | None,
        tax: Decimal | None,
        total_amount: Decimal | None,
        items: List[NormalizedItem]
    ):
        self.store_name = store_name
        self.date = date
        self.subtotal = subtotal
        self.tax = tax
        self.total_amount = total_amount
        self.items = items

class ReceiptNormalizer:
    def normalize(self, receipt: AIProposedReceipt) -> NormalizedReceipt:
        store_name = receipt.store_name.strip() if receipt.store_name else None
        
        parsed_date = None
        if receipt.date:
            try:
                # try isoformat
                parsed_date = datetime.fromisoformat(receipt.date.replace('Z', '+00:00'))
            except ValueError:
                pass # more complex date parsing could go here
                
        subtotal = Decimal(str(receipt.subtotal)) if receipt.subtotal is not None else None
        tax = Decimal(str(receipt.tax)) if receipt.tax is not None else None
        total = Decimal(str(receipt.total_amount)) if receipt.total_amount is not None else None
        
        normalized_items = []
        for i in receipt.items:
            name = i.name.strip() if i.name else "Unknown Item"
            qty = Decimal(str(i.quantity)) if i.quantity is not None else Decimal("1")
            price = Decimal(str(i.price)) if i.price is not None else Decimal("0")
            i_total = Decimal(str(i.total)) if i.total is not None else (qty * price)
            normalized_items.append(NormalizedItem(name, qty, price, i_total))
            
        return NormalizedReceipt(
            store_name=store_name,
            date=parsed_date,
            subtotal=subtotal,
            tax=tax,
            total_amount=total,
            items=normalized_items
        )

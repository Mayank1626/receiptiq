from typing import Sequence, Optional
from uuid import UUID
from decimal import Decimal
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.exc import SQLAlchemyError

from app.models.receipt import Receipt
from app.models.receipt_item import ReceiptItem
from app.repositories.receipt_repository import ReceiptRepository
from app.repositories.receipt_item_repository import ReceiptItemRepository
from app.schemas.receipt import ReceiptCreate, ReceiptItemCreate
from app.core.exceptions import ReceiptNotFoundError, InvalidReceiptError, RepositoryError

class ReceiptService:
    def __init__(
        self,
        session: AsyncSession,
        receipt_repo: ReceiptRepository,
        item_repo: ReceiptItemRepository
    ):
        self.session = session
        self.receipt_repo = receipt_repo
        self.item_repo = item_repo

    def _validate_monetary_values(self, receipt_in: ReceiptCreate) -> None:
        """Validates that monetary values are not negative."""
        if receipt_in.total_amount is not None and receipt_in.total_amount < Decimal("0"):
            raise InvalidReceiptError("Total amount cannot be negative.")
        if receipt_in.subtotal is not None and receipt_in.subtotal < Decimal("0"):
            raise InvalidReceiptError("Subtotal cannot be negative.")
        if receipt_in.tax is not None and receipt_in.tax < Decimal("0"):
            raise InvalidReceiptError("Tax cannot be negative.")
        if receipt_in.discount is not None and receipt_in.discount < Decimal("0"):
            raise InvalidReceiptError("Discount cannot be negative.")
        if receipt_in.delivery_charge is not None and receipt_in.delivery_charge < Decimal("0"):
            raise InvalidReceiptError("Delivery charge cannot be negative.")

    async def create_receipt(self, receipt_in: ReceiptCreate, items_in: Sequence[ReceiptItemCreate] = ()) -> Receipt:
        self._validate_monetary_values(receipt_in)
        
        # TODO: Check for duplicates in the future (DuplicateReceiptError)
        # TODO: Extensibility for OCR / AI processing integration

        try:
            # Map schema to model
            receipt = Receipt(
                status=receipt_in.status,
                source=receipt_in.source,
                store_type=receipt_in.store_type,
                store_name=receipt_in.store_name,
                total_amount=receipt_in.total_amount,
                subtotal=receipt_in.subtotal,
                tax=receipt_in.tax,
                delivery_charge=receipt_in.delivery_charge,
                discount=receipt_in.discount,
                date=receipt_in.date,
                storage_provider=receipt_in.storage_provider,
                file_path=receipt_in.file_path
            )
            
            created_receipt = await self.receipt_repo.create(receipt)

            # Map and create items
            for item_in in items_in:
                item = ReceiptItem(
                    receipt_id=created_receipt.id,
                    name=item_in.name,
                    quantity=item_in.quantity,
                    item_price=item_in.item_price,
                    category=item_in.category
                )
                await self.item_repo.create(item)
            
            await self.session.commit()
            await self.session.refresh(created_receipt)
            return created_receipt
            
        except SQLAlchemyError as e:
            await self.session.rollback()
            raise RepositoryError(f"Failed to create receipt: {str(e)}") from e
        except Exception as e:
            await self.session.rollback()
            raise

    async def get_receipt(self, receipt_id: UUID) -> Receipt:
        try:
            receipt = await self.receipt_repo.get_by_id(receipt_id)
            if not receipt:
                raise ReceiptNotFoundError(f"Receipt {receipt_id} not found.")
            return receipt
        except ReceiptNotFoundError:
            raise
        except SQLAlchemyError as e:
            raise RepositoryError(f"Database error while fetching receipt: {str(e)}") from e

    async def list_receipts(self, skip: int = 0, limit: int = 100) -> Sequence[Receipt]:
        try:
            return await self.receipt_repo.list(skip=skip, limit=limit)
        except SQLAlchemyError as e:
            raise RepositoryError(f"Database error while listing receipts: {str(e)}") from e

    async def update_receipt(self, receipt_id: UUID, receipt_in: ReceiptCreate) -> Receipt:
        self._validate_monetary_values(receipt_in)
        
        try:
            receipt = await self.receipt_repo.get_by_id(receipt_id)
            if not receipt:
                raise ReceiptNotFoundError(f"Receipt {receipt_id} not found.")
            
            # Update fields
            receipt.status = receipt_in.status
            receipt.source = receipt_in.source
            receipt.store_type = receipt_in.store_type
            receipt.store_name = receipt_in.store_name
            receipt.total_amount = receipt_in.total_amount
            receipt.subtotal = receipt_in.subtotal
            receipt.tax = receipt_in.tax
            receipt.delivery_charge = receipt_in.delivery_charge
            receipt.discount = receipt_in.discount
            receipt.date = receipt_in.date
            receipt.storage_provider = receipt_in.storage_provider
            receipt.file_path = receipt_in.file_path

            updated_receipt = await self.receipt_repo.update(receipt)
            
            await self.session.commit()
            await self.session.refresh(updated_receipt)
            return updated_receipt
            
        except ReceiptNotFoundError:
            await self.session.rollback()
            raise
        except SQLAlchemyError as e:
            await self.session.rollback()
            raise RepositoryError(f"Failed to update receipt: {str(e)}") from e
        except Exception as e:
            await self.session.rollback()
            raise

    async def delete_receipt(self, receipt_id: UUID) -> None:
        try:
            receipt = await self.receipt_repo.get_by_id(receipt_id)
            if not receipt:
                raise ReceiptNotFoundError(f"Receipt {receipt_id} not found.")
            
            await self.receipt_repo.delete(receipt)
            await self.session.commit()
            
        except ReceiptNotFoundError:
            await self.session.rollback()
            raise
        except SQLAlchemyError as e:
            await self.session.rollback()
            raise RepositoryError(f"Failed to delete receipt: {str(e)}") from e
        except Exception as e:
            await self.session.rollback()
            raise

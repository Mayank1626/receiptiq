from typing import Sequence, Optional, Any
from uuid import UUID
from datetime import datetime
from decimal import Decimal
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy.exc import SQLAlchemyError

from app.models.receipt import Receipt
from app.models.receipt_item import ReceiptItem
from app.models.receipt_audit import ReceiptAudit
from app.models.enums import ReceiptStatus, AuditAction
from app.repositories.receipt_repository import ReceiptRepository
from app.repositories.receipt_item_repository import ReceiptItemRepository
from app.repositories.receipt_audit_repository import ReceiptAuditRepository
from app.schemas.receipt import ReceiptCreate, ReceiptItemCreate, ReceiptUpdate, ReceiptItemUpdate
from app.core.exceptions import ReceiptNotFoundError, InvalidReceiptError, RepositoryError

class ReceiptService:
    def __init__(
        self,
        session: AsyncSession,
        receipt_repo: ReceiptRepository,
        item_repo: ReceiptItemRepository,
        audit_repo: ReceiptAuditRepository
    ):
        self.session = session
        self.receipt_repo = receipt_repo
        self.item_repo = item_repo
        self.audit_repo = audit_repo

    def _validate_monetary_values(self, receipt_in: ReceiptCreate | ReceiptUpdate) -> None:
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
        
        try:
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

            for item_in in items_in:
                item = ReceiptItem(
                    receipt_id=created_receipt.id,
                    name=item_in.name,
                    quantity=item_in.quantity,
                    item_price=item_in.item_price,
                    total_price=item_in.total_price,
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

    async def list_receipts(
        self, 
        skip: int = 0, 
        limit: int = 100,
        status: ReceiptStatus | None = None,
        store_name: str | None = None,
        start_date: datetime | None = None,
        end_date: datetime | None = None,
        min_total: Decimal | None = None,
        max_total: Decimal | None = None
    ) -> Sequence[Receipt]:
        try:
            return await self.receipt_repo.list(
                skip=skip, 
                limit=limit,
                status=status,
                store_name=store_name,
                start_date=start_date,
                end_date=end_date,
                min_total=min_total,
                max_total=max_total
            )
        except SQLAlchemyError as e:
            raise RepositoryError(f"Database error while listing receipts: {str(e)}") from e

    async def update_receipt(self, receipt_id: UUID, receipt_update: ReceiptUpdate) -> Receipt:
        self._validate_monetary_values(receipt_update)
        
        try:
            receipt = await self.receipt_repo.get_by_id(receipt_id)
            if not receipt:
                raise ReceiptNotFoundError(f"Receipt {receipt_id} not found.")
            
            # Update fields and track audits
            update_data = receipt_update.model_dump(exclude_unset=True)
            changed = False
            for field, new_value in update_data.items():
                old_value = getattr(receipt, field)
                if old_value != new_value:
                    self.audit_repo.create(
                        receipt_id=receipt.id,
                        action=AuditAction.UPDATE_FIELD,
                        field_name=field,
                        old_value=str(old_value) if old_value is not None else None,
                        new_value=str(new_value) if new_value is not None else None
                    )
                    setattr(receipt, field, new_value)
                    changed = True

            if changed:
                receipt.status = ReceiptStatus.REVIEW_REQUIRED
                updated_receipt = await self.receipt_repo.update(receipt)
                await self.session.commit()
                await self.session.refresh(updated_receipt)
                return updated_receipt
            return receipt
            
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

    async def add_item(self, receipt_id: UUID, item_in: ReceiptItemCreate) -> Receipt:
        try:
            receipt = await self.receipt_repo.get_by_id(receipt_id)
            if not receipt:
                raise ReceiptNotFoundError(f"Receipt {receipt_id} not found.")
            
            item = ReceiptItem(
                receipt_id=receipt.id,
                name=item_in.name,
                quantity=item_in.quantity,
                item_price=item_in.item_price,
                total_price=item_in.total_price,
                category=item_in.category
            )
            await self.item_repo.create(item)
            
            self.audit_repo.create(
                receipt_id=receipt.id,
                action=AuditAction.ADD_ITEM,
                field_name=None,
                old_value=None,
                new_value=item_in.name
            )
            
            receipt.status = ReceiptStatus.REVIEW_REQUIRED
            await self.receipt_repo.update(receipt)
            await self.session.commit()
            await self.session.refresh(receipt)
            return receipt
        except SQLAlchemyError as e:
            await self.session.rollback()
            raise RepositoryError(f"Failed to add item: {str(e)}") from e

    async def update_item(self, receipt_id: UUID, item_id: UUID, item_update: ReceiptItemUpdate) -> Receipt:
        try:
            receipt = await self.receipt_repo.get_by_id(receipt_id)
            if not receipt:
                raise ReceiptNotFoundError(f"Receipt {receipt_id} not found.")
            
            target_item = next((i for i in receipt.items if i.id == item_id), None)
            if not target_item:
                raise InvalidReceiptError(f"Item {item_id} not found on receipt.")
            
            update_data = item_update.model_dump(exclude_unset=True)
            changed = False
            for field, new_value in update_data.items():
                old_value = getattr(target_item, field)
                if old_value != new_value:
                    self.audit_repo.create(
                        receipt_id=receipt.id,
                        action=AuditAction.UPDATE_ITEM,
                        field_name=f"item.{field}",
                        old_value=str(old_value) if old_value is not None else None,
                        new_value=str(new_value) if new_value is not None else None
                    )
                    setattr(target_item, field, new_value)
                    changed = True
                    
            if changed:
                receipt.status = ReceiptStatus.REVIEW_REQUIRED
                await self.item_repo.update(target_item)
                await self.receipt_repo.update(receipt)
                await self.session.commit()
                await self.session.refresh(receipt)
            return receipt
            
        except SQLAlchemyError as e:
            await self.session.rollback()
            raise RepositoryError(f"Failed to update item: {str(e)}") from e

    async def delete_item(self, receipt_id: UUID, item_id: UUID) -> Receipt:
        try:
            receipt = await self.receipt_repo.get_by_id(receipt_id)
            if not receipt:
                raise ReceiptNotFoundError(f"Receipt {receipt_id} not found.")
            
            target_item = next((i for i in receipt.items if i.id == item_id), None)
            if not target_item:
                raise InvalidReceiptError(f"Item {item_id} not found on receipt.")
            
            self.audit_repo.create(
                receipt_id=receipt.id,
                action=AuditAction.DELETE_ITEM,
                field_name=None,
                old_value=target_item.name,
                new_value=None
            )
            
            await self.item_repo.delete(target_item)
            receipt.status = ReceiptStatus.REVIEW_REQUIRED
            await self.receipt_repo.update(receipt)
            await self.session.commit()
            await self.session.refresh(receipt)
            return receipt
            
        except SQLAlchemyError as e:
            await self.session.rollback()
            raise RepositoryError(f"Failed to delete item: {str(e)}") from e

    async def confirm_receipt(self, receipt_id: UUID) -> Receipt:
        try:
            receipt = await self.receipt_repo.get_by_id(receipt_id)
            if not receipt:
                raise ReceiptNotFoundError(f"Receipt {receipt_id} not found.")
            
            if receipt.status == ReceiptStatus.CONFIRMED:
                return receipt
                
            self.audit_repo.create(
                receipt_id=receipt.id,
                action=AuditAction.CONFIRM,
                field_name="status",
                old_value=receipt.status.value,
                new_value=ReceiptStatus.CONFIRMED.value
            )
            
            receipt.status = ReceiptStatus.CONFIRMED
            await self.receipt_repo.update(receipt)
            await self.session.commit()
            await self.session.refresh(receipt)
            return receipt
            
        except SQLAlchemyError as e:
            await self.session.rollback()
            raise RepositoryError(f"Failed to confirm receipt: {str(e)}") from e

    async def get_audits(self, receipt_id: UUID) -> Sequence[ReceiptAudit]:
        return await self.audit_repo.get_by_receipt_id(receipt_id)

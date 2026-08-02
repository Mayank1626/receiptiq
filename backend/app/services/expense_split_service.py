import uuid
from decimal import Decimal
from fastapi import HTTPException
from sqlalchemy.ext.asyncio import AsyncSession

from app.schemas.split import ExpenseSplitCreate
from app.models.expense_split import ExpenseSplit
from app.models.expense_share import ExpenseShare
from app.models.enums import SplitStatus, AuditAction
from app.models.receipt_audit import ReceiptAudit
from app.repositories.split_repository import SplitRepository
from app.repositories.receipt_repository import ReceiptRepository
from app.models.user import User

class ExpenseSplitService:
    def __init__(self, session: AsyncSession):
        self.session = session
        self.split_repo = SplitRepository(session)
        self.receipt_repo = ReceiptRepository(session)

    async def create_split(self, receipt_id: uuid.UUID, split_in: ExpenseSplitCreate, current_user: User) -> ExpenseSplit:
        household_ids = [m.household_id for m in current_user.memberships]
        receipt = await self.receipt_repo.get_by_id(receipt_id, owner_id=current_user.id, household_ids=household_ids)
        if not receipt:
            raise HTTPException(status_code=404, detail="Receipt not found")
            
        if not receipt.household_id:
            raise HTTPException(status_code=400, detail="Receipt must belong to a household to be split")
            
        # Validate that shares sum up to total_amount
        if not receipt.total_amount:
            raise HTTPException(status_code=400, detail="Receipt must have a total amount to be split")
            
        total_owed = sum(share.amount_owed for share in split_in.shares)
        if total_owed != receipt.total_amount:
            raise HTTPException(status_code=400, detail=f"Sum of shares ({total_owed}) must equal receipt total ({receipt.total_amount})")
            
        # Invalidate existing active split if any
        existing_split = await self.split_repo.get_by_receipt_id(receipt_id)
        if existing_split:
            existing_split.status = SplitStatus.INVALID
            
            # Audit log for invalidation
            audit_inv = ReceiptAudit(
                receipt_id=receipt_id,
                action=AuditAction.SPLIT_INVALIDATED,
                edited_by_user_id=current_user.id
            )
            self.session.add(audit_inv)

        # Create new split
        new_split = ExpenseSplit(
            receipt_id=receipt_id,
            split_type=split_in.split_type,
            status=SplitStatus.ACTIVE,
            total_amount=receipt.total_amount
        )
        
        # Add shares
        new_shares = []
        for share_in in split_in.shares:
            new_share = ExpenseShare(
                user_id=share_in.user_id,
                amount_paid=share_in.amount_paid,
                amount_owed=share_in.amount_owed,
                percentage_share=share_in.percentage_share
            )
            new_shares.append(new_share)
            
        new_split.shares = new_shares
        
        # Audit log for creation
        audit_create = ReceiptAudit(
            receipt_id=receipt_id,
            action=AuditAction.SPLIT_CREATED,
            edited_by_user_id=current_user.id
        )
        self.session.add(audit_create)
        
        return await self.split_repo.create(new_split)

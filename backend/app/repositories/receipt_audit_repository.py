from uuid import UUID
from typing import List, Optional
from sqlalchemy import select
from sqlalchemy.ext.asyncio import AsyncSession
from app.models.receipt_audit import ReceiptAudit
from app.models.enums import AuditAction

class ReceiptAuditRepository:
    def __init__(self, session: AsyncSession):
        self.session = session

    async def get_by_receipt_id(self, receipt_id: UUID) -> List[ReceiptAudit]:
        stmt = select(ReceiptAudit).where(ReceiptAudit.receipt_id == receipt_id).order_by(ReceiptAudit.edited_at.desc())
        result = await self.session.execute(stmt)
        return list(result.scalars().all())

    def create(
        self, 
        receipt_id: UUID, 
        action: AuditAction, 
        field_name: Optional[str] = None, 
        old_value: Optional[str] = None, 
        new_value: Optional[str] = None
    ) -> ReceiptAudit:
        audit = ReceiptAudit(
            receipt_id=receipt_id,
            action=action,
            field_name=field_name,
            old_value=old_value,
            new_value=new_value
        )
        self.session.add(audit)
        return audit

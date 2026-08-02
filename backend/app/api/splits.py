from uuid import UUID
from fastapi import APIRouter, Depends

from app.schemas.split import ExpenseSplitCreate, ExpenseSplitResponse
from app.services.expense_split_service import ExpenseSplitService
from app.api.dependencies import get_expense_split_service, get_current_user
from app.models.user import User

router = APIRouter(prefix="/receipts", tags=["Splits"])

@router.post("/{receipt_id}/split", response_model=ExpenseSplitResponse, summary="Create Expense Split")
async def create_split(
    receipt_id: UUID,
    split_in: ExpenseSplitCreate,
    current_user: User = Depends(get_current_user),
    service: ExpenseSplitService = Depends(get_expense_split_service)
):
    """
    Splits the expense of a receipt among users.
    If an active split already exists for this receipt, it will be invalidated.
    """
    return await service.create_split(receipt_id, split_in, current_user)

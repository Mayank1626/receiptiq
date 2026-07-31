from fastapi import APIRouter, Depends, status
import uuid
from app.schemas.receipt import ReceiptResponse
from app.services.receipt_materialization_service import ReceiptMaterializationService
from app.api.dependencies import get_receipt_materialization_service

router = APIRouter(prefix="/materialize", tags=["Normalization"])

@router.post("/{ai_extraction_result_id}", response_model=ReceiptResponse, status_code=status.HTTP_201_CREATED, summary="Materialize Receipt")
async def materialize(
    ai_extraction_result_id: uuid.UUID,
    service: ReceiptMaterializationService = Depends(get_receipt_materialization_service)
):
    """Transforms an AI extraction result into a validated domain Receipt."""
    return await service.materialize_receipt(ai_extraction_result_id)

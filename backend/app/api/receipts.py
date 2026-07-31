from typing import List
from uuid import UUID
from fastapi import APIRouter, Depends, Query, status

from app.schemas.receipt import ReceiptCreate, ReceiptResponse
from app.services.receipt_service import ReceiptService
from app.api.dependencies import get_receipt_service

router = APIRouter(prefix="/receipts", tags=["Receipts"])

@router.post("/", response_model=ReceiptResponse, status_code=status.HTTP_201_CREATED, summary="Create Receipt", description="Creates a new receipt manually.")
async def create_receipt(
    receipt_in: ReceiptCreate,
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.create_receipt(receipt_in=receipt_in, items_in=[])

@router.get("/", response_model=List[ReceiptResponse], summary="List Receipts", description="Retrieve a paginated list of receipts.")
async def list_receipts(
    skip: int = Query(0, ge=0, description="Number of records to skip for pagination"),
    limit: int = Query(100, ge=1, le=100, description="Maximum number of records to return"),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.list_receipts(skip=skip, limit=limit)

@router.get("/{receipt_id}", response_model=ReceiptResponse, summary="Get Receipt", description="Fetch a specific receipt by its UUID.")
async def get_receipt(
    receipt_id: UUID,
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.get_receipt(receipt_id)

@router.patch("/{receipt_id}", response_model=ReceiptResponse, summary="Update Receipt", description="Update an existing receipt by its UUID.")
async def update_receipt(
    receipt_id: UUID,
    receipt_in: ReceiptCreate,
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.update_receipt(receipt_id, receipt_in)

@router.delete("/{receipt_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Delete Receipt", description="Permanently delete a receipt by its UUID.")
async def delete_receipt(
    receipt_id: UUID,
    service: ReceiptService = Depends(get_receipt_service)
):
    await service.delete_receipt(receipt_id)

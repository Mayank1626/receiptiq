from typing import List, Optional
from uuid import UUID
from datetime import datetime
from decimal import Decimal
from fastapi import APIRouter, Depends, Query, status

from app.schemas.receipt import ReceiptCreate, ReceiptResponse, ReceiptUpdate, ReceiptItemCreate, ReceiptItemUpdate
from app.schemas.audit import ReceiptAuditResponse
from app.models.enums import ReceiptStatus
from app.services.receipt_service import ReceiptService
from app.models.user import User
from app.api.dependencies import get_receipt_service, get_current_user

router = APIRouter(prefix="/receipts", tags=["Receipts"])

@router.post("/", response_model=ReceiptResponse, status_code=status.HTTP_201_CREATED, summary="Create Receipt")
async def create_receipt(
    receipt_in: ReceiptCreate,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.create_receipt(receipt_in=receipt_in, user=current_user, items_in=[])

@router.get("/", response_model=List[ReceiptResponse], summary="List Receipts")
async def list_receipts(
    skip: int = Query(0, ge=0),
    limit: int = Query(100, ge=1, le=100),
    status: Optional[ReceiptStatus] = Query(None),
    store_name: Optional[str] = Query(None),
    start_date: Optional[datetime] = Query(None),
    end_date: Optional[datetime] = Query(None),
    min_total: Optional[Decimal] = Query(None),
    max_total: Optional[Decimal] = Query(None),
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.list_receipts(user=current_user, skip=skip, limit=limit, status=status, store_name=store_name, start_date=start_date, end_date=end_date, min_total=min_total, max_total=max_total)

@router.get("/{receipt_id}", response_model=ReceiptResponse, summary="Get Receipt")
async def get_receipt(
    receipt_id: UUID,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.get_receipt(receipt_id, current_user)

@router.patch("/{receipt_id}", response_model=ReceiptResponse, summary="Update Receipt")
async def update_receipt(
    receipt_id: UUID,
    receipt_in: ReceiptUpdate,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.update_receipt(receipt_id, receipt_in, current_user)

@router.delete("/{receipt_id}", status_code=status.HTTP_204_NO_CONTENT, summary="Delete Receipt")
async def delete_receipt(
    receipt_id: UUID,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    await service.delete_receipt(receipt_id, current_user)

@router.post("/{receipt_id}/items", response_model=ReceiptResponse, summary="Add Receipt Item")
async def add_receipt_item(
    receipt_id: UUID,
    item_in: ReceiptItemCreate,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.add_item(receipt_id, item_in, current_user)

@router.patch("/{receipt_id}/items/{item_id}", response_model=ReceiptResponse, summary="Update Receipt Item")
async def update_receipt_item(
    receipt_id: UUID,
    item_id: UUID,
    item_in: ReceiptItemUpdate,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.update_item(receipt_id, item_id, item_in, current_user)

@router.delete("/{receipt_id}/items/{item_id}", response_model=ReceiptResponse, summary="Delete Receipt Item")
async def delete_receipt_item(
    receipt_id: UUID,
    item_id: UUID,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.delete_item(receipt_id, item_id, current_user)

@router.post("/{receipt_id}/confirm", response_model=ReceiptResponse, summary="Confirm Receipt")
async def confirm_receipt(
    receipt_id: UUID,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.confirm_receipt(receipt_id, current_user)

@router.get("/{receipt_id}/audits", response_model=List[ReceiptAuditResponse], summary="Get Receipt Audits")
async def get_receipt_audits(
    receipt_id: UUID,
    current_user: User = Depends(get_current_user),
    service: ReceiptService = Depends(get_receipt_service)
):
    # Ensure receipt is accessible before returning audits
    await service.get_receipt(receipt_id, current_user)
    return await service.get_audits(receipt_id)

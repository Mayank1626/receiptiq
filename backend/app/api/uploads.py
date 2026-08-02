from fastapi import APIRouter, Depends, UploadFile, File, status
from app.schemas.upload import UploadedFileResponse
from app.services.upload_service import UploadService
from app.api.dependencies import get_upload_service, get_current_user
from app.models.user import User

router = APIRouter(prefix="/uploads", tags=["Uploads"])

@router.post("/", response_model=UploadedFileResponse, status_code=status.HTTP_201_CREATED, summary="Upload Receipt")
async def upload_receipt(
    file: UploadFile = File(...),
    current_user: User = Depends(get_current_user),
    service: UploadService = Depends(get_upload_service)
):
    """Uploads a receipt image or PDF for future processing."""
    return await service.upload_file(file, current_user)

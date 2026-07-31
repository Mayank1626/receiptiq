from fastapi import APIRouter, Depends, status
import uuid
from app.schemas.ocr import OCRResultResponse
from app.services.ocr_service import OCRService
from app.api.dependencies import get_ocr_service

router = APIRouter(prefix="/ocr", tags=["OCR"])

@router.post("/{uploaded_file_id}", response_model=OCRResultResponse, status_code=status.HTTP_201_CREATED, summary="Process OCR for Uploaded File")
async def process_ocr(
    uploaded_file_id: uuid.UUID,
    service: OCRService = Depends(get_ocr_service)
):
    """Initiates OCR processing on an uploaded file and returns the extraction result."""
    return await service.process_file(uploaded_file_id)

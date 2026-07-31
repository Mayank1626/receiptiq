from fastapi import APIRouter, Depends, status
import uuid
from app.schemas.ai import AIExtractionResultResponse
from app.services.ai_service import AIService
from app.api.dependencies import get_ai_service

router = APIRouter(prefix="/ai", tags=["AI"])

@router.post("/{ocr_result_id}", response_model=AIExtractionResultResponse, status_code=status.HTTP_201_CREATED, summary="Process AI Extraction for OCR Result")
async def process_ai(
    ocr_result_id: uuid.UUID,
    service: AIService = Depends(get_ai_service)
):
    """Initiates AI extraction on an OCR result and returns the structured data."""
    return await service.process_ocr_result(ocr_result_id)

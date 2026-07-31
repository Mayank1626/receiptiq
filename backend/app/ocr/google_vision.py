import time
from google.cloud import vision
from tenacity import retry, stop_after_attempt, wait_exponential
from app.core.config import settings
from app.ocr.base import OCRProvider
from app.ocr.types import OCRExtractionResult

class GoogleVisionOCRProvider(OCRProvider):
    def __init__(self):
        # Relies on GOOGLE_APPLICATION_CREDENTIALS in env or ADC
        self.client = vision.ImageAnnotatorAsyncClient()
        
    @property
    def provider_name(self) -> str:
        return "google_vision"

    @property
    def provider_version(self) -> str:
        return "v1"

    @retry(stop=stop_after_attempt(3), wait=wait_exponential(multiplier=1, min=2, max=10))
    async def _call_vision(self, file_path: str):
        with open(file_path, "rb") as image_file:
            content = image_file.read()
            
        image = vision.Image(content=content)
        response = await self.client.document_text_detection(image=image)
        
        if response.error.message:
            raise Exception(f"Vision API Error: {response.error.message}")
            
        return response

    async def extract_text(self, file_path: str) -> OCRExtractionResult:
        start_time = time.time()
        try:
            response = await self._call_vision(file_path)
            processing_time_ms = int((time.time() - start_time) * 1000)
            
            raw_text = ""
            if response.full_text_annotation:
                raw_text = response.full_text_annotation.text
                
            return OCRExtractionResult(
                raw_text=raw_text,
                confidence=1.0,
                processing_time_ms=processing_time_ms,
                error_message=None
            )
        except Exception as e:
            processing_time_ms = int((time.time() - start_time) * 1000)
            return OCRExtractionResult(
                raw_text="",
                confidence=0.0,
                processing_time_ms=processing_time_ms,
                error_message=str(e)
            )

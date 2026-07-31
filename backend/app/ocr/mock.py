import asyncio
import time
from app.ocr.base import OCRProvider
from app.ocr.types import OCRExtractionResult

class MockOCRProvider(OCRProvider):
    @property
    def provider_name(self) -> str:
        return "mock"

    @property
    def provider_version(self) -> str:
        return "1.0.0"

    async def extract_text(self, file_path: str) -> OCRExtractionResult:
        start_time = time.time()
        # Simulate processing delay
        await asyncio.sleep(0.1)
        processing_time_ms = int((time.time() - start_time) * 1000)
        
        # Deterministic result
        raw_text = "STORE NAME: Walmart\nTOTAL: 150.00\nTAX: 10.00\nDATE: 2026-07-31"
        return OCRExtractionResult(
            raw_text=raw_text,
            confidence=0.99,
            processing_time_ms=processing_time_ms,
            error_message=None
        )

import asyncio
import time
import json
from app.ai.base import AIProvider
from app.ai.types import AIExtraction
from app.ai.prompt import EXTRACTION_PROMPT

class GeminiAIProvider(AIProvider):
    @property
    def provider_name(self) -> str:
        return "gemini"

    @property
    def model_name(self) -> str:
        return "gemini-1.5-flash"

    async def extract_receipt(self, ocr_text: str, prompt_version: str) -> AIExtraction:
        start_time = time.time()
        # In a real scenario, this would use the google-genai SDK.
        # For this sprint, we mock the network call.
        await asyncio.sleep(0.1)
        
        processing_time_ms = int((time.time() - start_time) * 1000)
        
        structured = {
            "store_name": "Walmart",
            "total_amount": 150.00,
            "tax": 10.00,
            "date": "2026-07-31"
        }
        
        return AIExtraction(
            structured_json=structured,
            confidence=0.95,
            processing_time_ms=processing_time_ms,
            token_usage=150,
            error_message=None,
            raw_response=json.dumps(structured)
        )

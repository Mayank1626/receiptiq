import asyncio
import time
import json
from app.ai.base import AIProvider
from app.ai.types import AIExtraction
from app.ai.prompt import EXTRACTION_PROMPT

class MockAIProvider(AIProvider):
    @property
    def provider_name(self) -> str:
        return "mock_ai"

    @property
    def model_name(self) -> str:
        return "mock_model"

    async def extract_receipt(self, ocr_text: str, prompt_version: str) -> AIExtraction:
        start_time = time.time()
        await asyncio.sleep(0.1)
        
        processing_time_ms = int((time.time() - start_time) * 1000)
        
        structured = {
            "store_name": "Walmart",
            "total_amount": 150.00,
            "tax": 10.00,
            "date": "2026-07-31",
            "items": [
                {"name": "Apples", "quantity": 1, "price": 5.0, "total": 5.0}
            ]
        }
        
        return AIExtraction(
            structured_json=structured,
            confidence=0.99,
            processing_time_ms=processing_time_ms,
            token_usage=150,
            error_message=None,
            raw_response=json.dumps(structured)
        )

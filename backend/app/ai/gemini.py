import time
import json
from google import genai
from google.genai import types
from tenacity import retry, stop_after_attempt, wait_exponential
from app.core.config import settings
from app.ai.base import AIProvider
from app.ai.types import AIExtraction
from app.ai.prompt import EXTRACTION_PROMPT

class GeminiAIProvider(AIProvider):
    def __init__(self):
        if settings.GEMINI_API_KEY:
            self.client = genai.Client(api_key=settings.GEMINI_API_KEY)
        else:
            self.client = genai.Client()

    @property
    def provider_name(self) -> str:
        return "gemini"

    @property
    def model_name(self) -> str:
        return settings.GEMINI_MODEL

    @retry(stop=stop_after_attempt(3), wait=wait_exponential(multiplier=1, min=2, max=10))
    async def _call_gemini(self, ocr_text: str):
        response = await self.client.aio.models.generate_content(
            model=self.model_name,
            contents=[EXTRACTION_PROMPT, ocr_text],
            config=types.GenerateContentConfig(
                response_mime_type="application/json",
            ),
        )
        return response

    async def extract_receipt(self, ocr_text: str, prompt_version: str) -> AIExtraction:
        start_time = time.time()
        try:
            response = await self._call_gemini(ocr_text)
            processing_time_ms = int((time.time() - start_time) * 1000)
            text_response = response.text
            structured = json.loads(text_response)
            
            return AIExtraction(
                structured_json=structured,
                confidence=1.0,
                processing_time_ms=processing_time_ms,
                token_usage=response.usage_metadata.total_token_count if response.usage_metadata else None,
                error_message=None,
                raw_response=text_response
            )
        except Exception as e:
            processing_time_ms = int((time.time() - start_time) * 1000)
            return AIExtraction(
                structured_json={},
                confidence=0.0,
                processing_time_ms=processing_time_ms,
                error_message=str(e)
            )

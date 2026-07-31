import pytest
from app.ai.gemini import GeminiAIProvider

@pytest.mark.asyncio
async def test_gemini_ai_provider():
    provider = GeminiAIProvider()
    assert provider.provider_name == "gemini"
    assert provider.model_name == "gemini-1.5-flash"
    
    result = await provider.extract_receipt("some OCR text", "receipt-v1")
    assert result.confidence == 0.95
    assert result.error_message is None
    assert result.structured_json["store_name"] == "Walmart"

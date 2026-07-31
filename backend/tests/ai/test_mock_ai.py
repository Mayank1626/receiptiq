import pytest
from app.ai.mock import MockAIProvider

@pytest.mark.asyncio
async def test_mock_ai_provider():
    provider = MockAIProvider()
    assert provider.provider_name == "mock_ai"
    assert provider.model_name == "mock_model"
    
    result = await provider.extract_receipt("some OCR text", "receipt-v2")
    assert result.confidence == 0.99
    assert result.error_message is None
    assert result.structured_json["store_name"] == "Walmart"

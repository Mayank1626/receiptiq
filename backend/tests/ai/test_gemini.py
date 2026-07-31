import pytest
from unittest.mock import AsyncMock, patch, MagicMock
import json
from app.ai.gemini import GeminiAIProvider

@pytest.fixture
def mock_genai_client():
    with patch("app.ai.gemini.genai.Client") as mock_client:
        mock_instance = MagicMock()
        mock_aio = MagicMock()
        mock_models = AsyncMock()
        
        mock_aio.models = mock_models
        mock_instance.aio = mock_aio
        
        mock_response = MagicMock()
        mock_response.text = json.dumps({
            "store_name": "Target",
            "total_amount": 25.0
        })
        mock_usage = MagicMock()
        mock_usage.total_token_count = 100
        mock_response.usage_metadata = mock_usage
        
        mock_models.generate_content.return_value = mock_response
        mock_client.return_value = mock_instance
        yield mock_client

@pytest.mark.asyncio
async def test_gemini_ai_provider(mock_genai_client):
    provider = GeminiAIProvider()
    assert provider.provider_name == "gemini"
    
    result = await provider.extract_receipt("some OCR text", "receipt-v2")
    
    assert result.confidence == 1.0
    assert result.error_message is None
    assert result.structured_json["store_name"] == "Target"
    assert result.token_usage == 100
    assert result.raw_response is not None

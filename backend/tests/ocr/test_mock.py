import pytest
from app.ocr.mock import MockOCRProvider

@pytest.mark.asyncio
async def test_mock_ocr_provider():
    provider = MockOCRProvider()
    assert provider.provider_name == "mock"
    assert provider.provider_version == "1.0.0"
    
    result = await provider.extract_text("dummy.jpg")
    assert result.confidence == 0.99
    assert result.error_message is None
    assert "STORE NAME: Walmart" in result.raw_text

import pytest
from unittest.mock import AsyncMock, patch, MagicMock, mock_open
from app.ocr.google_vision import GoogleVisionOCRProvider

@pytest.fixture
def mock_vision_client():
    with patch("app.ocr.google_vision.vision.ImageAnnotatorAsyncClient") as mock_client:
        mock_instance = AsyncMock()
        
        mock_response = MagicMock()
        mock_response.error.message = ""
        mock_annotation = MagicMock()
        mock_annotation.text = "Walmart\nTotal 15.00"
        mock_response.full_text_annotation = mock_annotation
        
        mock_instance.document_text_detection.return_value = mock_response
        mock_client.return_value = mock_instance
        yield mock_client

@pytest.mark.asyncio
@patch("builtins.open", new_callable=mock_open, read_data=b"fake_image_data")
async def test_google_vision_ocr_provider(mock_file, mock_vision_client):
    provider = GoogleVisionOCRProvider()
    assert provider.provider_name == "google_vision"
    
    result = await provider.extract_text("dummy.jpg")
    
    assert result.confidence == 1.0
    assert result.error_message is None
    assert "Walmart" in result.raw_text
    
    mock_file.assert_called_once_with("dummy.jpg", "rb")

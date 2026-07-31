from abc import ABC, abstractmethod
from app.ai.types import AIExtraction

class AIProvider(ABC):
    @property
    @abstractmethod
    def provider_name(self) -> str:
        pass

    @property
    @abstractmethod
    def model_name(self) -> str:
        pass

    @abstractmethod
    async def extract_receipt(self, ocr_text: str, prompt_version: str) -> AIExtraction:
        """Extract structured data from OCR text."""
        pass

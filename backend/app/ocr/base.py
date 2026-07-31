from abc import ABC, abstractmethod
from app.ocr.types import OCRExtractionResult

class OCRProvider(ABC):
    @property
    @abstractmethod
    def provider_name(self) -> str:
        pass

    @property
    @abstractmethod
    def provider_version(self) -> str:
        pass

    @abstractmethod
    async def extract_text(self, file_path: str) -> OCRExtractionResult:
        """Extract text from the given file path."""
        pass

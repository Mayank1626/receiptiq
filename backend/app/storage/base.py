from abc import ABC, abstractmethod
from typing import AsyncGenerator

class StorageProvider(ABC):
    @abstractmethod
    async def save(self, path: str, content: bytes) -> str:
        """Saves content to the specified path and returns the resolved path/URI."""
        pass

    @abstractmethod
    async def delete(self, path: str) -> None:
        """Deletes the file at the specified path."""
        pass

    @abstractmethod
    async def exists(self, path: str) -> bool:
        """Checks if a file exists at the specified path."""
        pass

    @abstractmethod
    async def open(self, path: str) -> AsyncGenerator[bytes, None]:
        """Streams the file content."""
        pass

    @abstractmethod
    def get_path(self, path: str) -> str:
        """Returns the fully qualified path or URL for the stored file."""
        pass

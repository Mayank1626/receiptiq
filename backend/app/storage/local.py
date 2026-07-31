import os
from pathlib import Path
from typing import AsyncGenerator
from app.storage.base import StorageProvider
from app.core.config import settings

class LocalStorageProvider(StorageProvider):
    def __init__(self, base_path: str | Path | None = None):
        # We store files in a base directory (e.g. 'local_uploads' in the root)
        self.base_path = Path(base_path) if base_path else Path(settings.BASE_DIR) / "local_uploads"
        # Ensure the base directory exists
        self.base_path.mkdir(parents=True, exist_ok=True)

    async def save(self, path: str, content: bytes) -> str:
        full_path = self.base_path / path
        full_path.parent.mkdir(parents=True, exist_ok=True)
        
        if full_path.exists():
            raise FileExistsError(f"File {path} already exists in local storage.")
            
        full_path.write_bytes(content)
        return str(path)

    async def delete(self, path: str) -> None:
        full_path = self.base_path / path
        if full_path.exists():
            full_path.unlink()

    async def exists(self, path: str) -> bool:
        full_path = self.base_path / path
        return full_path.exists()

    async def open(self, path: str, chunk_size: int = 1024 * 1024) -> AsyncGenerator[bytes, None]:
        full_path = self.base_path / path
        if not full_path.exists():
            raise FileNotFoundError(f"File {path} not found.")
            
        with open(full_path, "rb") as f:
            while chunk := f.read(chunk_size):
                yield chunk

    def get_path(self, path: str) -> str:
        return str(self.base_path / path)

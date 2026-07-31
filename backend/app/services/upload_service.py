import uuid
import hashlib
from datetime import datetime, timezone
from fastapi import UploadFile
from sqlalchemy.ext.asyncio import AsyncSession

from app.storage.base import StorageProvider
from app.repositories.uploaded_file_repository import UploadedFileRepository
from app.models.uploaded_file import UploadedFile
from app.models.enums import StorageProvider as StorageProviderEnum, ProcessingStatus
from app.core.exceptions import FileValidationError, RepositoryError

ALLOWED_MIME_TYPES = {"image/jpeg", "image/png", "image/webp", "application/pdf"}
MAX_FILE_SIZE = 10 * 1024 * 1024  # 10 MB

class UploadService:
    def __init__(
        self,
        session: AsyncSession,
        provider: StorageProvider,
        repository: UploadedFileRepository
    ):
        self.session = session
        self.provider = provider
        self.repository = repository

    async def upload_file(self, file: UploadFile) -> UploadedFile:
        if file.content_type not in ALLOWED_MIME_TYPES:
            raise FileValidationError(f"Unsupported file type: {file.content_type}")
            
        content = await file.read()
        size = len(content)
        
        if size > MAX_FILE_SIZE:
            raise FileValidationError("File size exceeds maximum limit of 10MB.")
        
        sha256_hash = hashlib.sha256(content).hexdigest()
        
        file_ext = ""
        if file.filename and "." in file.filename:
            file_ext = "." + file.filename.split(".")[-1]
            
        stored_filename = f"{uuid.uuid4()}{file_ext}"
        now = datetime.now(timezone.utc)
        path = f"uploads/{now.year}/{now.month:02d}/{now.day:02d}/{stored_filename}"
        
        try:
            saved_path = await self.provider.save(path, content)
            provider_enum = StorageProviderEnum.LOCAL
            
            uploaded_record = UploadedFile(
                original_filename=file.filename or "unknown",
                stored_filename=stored_filename,
                storage_path=saved_path,
                mime_type=file.content_type,
                size_bytes=size,
                checksum_sha256=sha256_hash,
                storage_provider=provider_enum,
                processing_status=ProcessingStatus.UPLOADED,
                uploaded_at=now
            )
            
            created_record = await self.repository.create(uploaded_record)
            await self.session.commit()
            await self.session.refresh(created_record)
            return created_record
            
        except FileExistsError as e:
            await self.session.rollback()
            raise FileValidationError(str(e))
        except Exception as e:
            await self.session.rollback()
            raise RepositoryError(f"Upload failed: {str(e)}")

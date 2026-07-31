import uuid
from datetime import datetime
from pydantic import BaseModel, ConfigDict
from app.models.enums import StorageProvider, ProcessingStatus

class UploadedFileResponse(BaseModel):
    id: uuid.UUID
    original_filename: str
    stored_filename: str
    storage_path: str
    mime_type: str
    size_bytes: int
    checksum_sha256: str
    storage_provider: StorageProvider
    processing_status: ProcessingStatus
    uploaded_at: datetime
    
    model_config = ConfigDict(from_attributes=True)

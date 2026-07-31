import pytest
import pytest_asyncio
from sqlalchemy.ext.asyncio import AsyncSession
from app.db.session import engine, AsyncSessionLocal
from app.db.base import Base
from app.models.ocr_result import OCRResult
from app.models.uploaded_file import UploadedFile
from app.models.enums import StorageProvider, ProcessingStatus
from app.repositories.ocr_result_repository import OCRResultRepository
import uuid

@pytest_asyncio.fixture(scope="function")
async def db_session() -> AsyncSession:
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.create_all)
    async with AsyncSessionLocal() as session:
        yield session
    async with engine.begin() as conn:
        await conn.run_sync(Base.metadata.drop_all)

@pytest.mark.asyncio
async def test_create_and_get_ocr_result(db_session):
    file = UploadedFile(
        original_filename="test.jpg",
        stored_filename="stored.jpg",
        storage_path="path",
        mime_type="image/jpeg",
        size_bytes=100,
        checksum_sha256="hash",
        storage_provider=StorageProvider.LOCAL,
        processing_status=ProcessingStatus.UPLOADED
    )
    db_session.add(file)
    await db_session.commit()
    
    repo = OCRResultRepository(db_session)
    
    result = OCRResult(
        uploaded_file_id=file.id,
        provider="mock",
        provider_version="1.0",
        status="SUCCESS",
        raw_text="test text",
        confidence=0.9,
        processing_time_ms=100
    )
    
    created = await repo.create(result)
    await db_session.commit()
    
    assert created.id is not None
    assert created.uploaded_file_id == file.id
    
    fetched = await repo.get_by_file_id(file.id)
    assert fetched is not None
    assert fetched.raw_text == "test text"

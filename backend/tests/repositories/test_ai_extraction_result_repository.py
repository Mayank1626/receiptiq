import pytest
import pytest_asyncio
from sqlalchemy.ext.asyncio import AsyncSession
from app.db.session import engine, AsyncSessionLocal
from app.db.base import Base
from app.models.ai_extraction_result import AIExtractionResult
from app.models.ocr_result import OCRResult
from app.models.uploaded_file import UploadedFile
from app.models.enums import StorageProvider, ProcessingStatus
from app.repositories.ai_extraction_result_repository import AIExtractionResultRepository
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
async def test_create_and_get_ai_result(db_session):
    # Dummy file
    file = UploadedFile(
        original_filename="test.jpg",
        stored_filename="stored.jpg",
        storage_path="path",
        mime_type="image/jpeg",
        size_bytes=100,
        checksum_sha256="hash",
        storage_provider=StorageProvider.LOCAL,
        processing_status=ProcessingStatus.OCR_COMPLETED
    )
    db_session.add(file)
    await db_session.flush()
    
    # Dummy OCR result
    ocr_res = OCRResult(
        uploaded_file_id=file.id,
        provider="mock",
        provider_version="1.0",
        status="SUCCESS",
        raw_text="mock text"
    )
    db_session.add(ocr_res)
    await db_session.commit()
    
    repo = AIExtractionResultRepository(db_session)
    
    result = AIExtractionResult(
        ocr_result_id=ocr_res.id,
        provider="gemini",
        model="flash",
        prompt_version="v1",
        raw_response="{}",
        structured_json={"store": "test"},
        processing_time_ms=100,
        confidence=0.9
    )
    
    created = await repo.create(result)
    await db_session.commit()
    
    assert created.id is not None
    assert created.ocr_result_id == ocr_res.id
    
    fetched = await repo.get_by_ocr_result_id(ocr_res.id)
    assert fetched is not None
    assert fetched.structured_json["store"] == "test"

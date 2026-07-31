from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
import uuid
from app.models.ocr_result import OCRResult
from app.repositories.base import BaseRepository

class OCRResultRepository(BaseRepository[OCRResult]):
    def __init__(self, session: AsyncSession):
        super().__init__(OCRResult, session)

    async def create(self, ocr_result: OCRResult) -> OCRResult:
        self.session.add(ocr_result)
        await self.session.flush()
        await self.session.refresh(ocr_result)
        return ocr_result
        
    async def get_by_file_id(self, file_id: uuid.UUID) -> OCRResult | None:
        stmt = select(OCRResult).where(OCRResult.uploaded_file_id == file_id)
        result = await self.session.execute(stmt)
        return result.scalars().first()

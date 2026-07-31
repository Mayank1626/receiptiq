from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import select
import uuid
from app.models.ai_extraction_result import AIExtractionResult
from app.repositories.base import BaseRepository

class AIExtractionResultRepository(BaseRepository[AIExtractionResult]):
    def __init__(self, session: AsyncSession):
        super().__init__(AIExtractionResult, session)

    async def create(self, extraction_result: AIExtractionResult) -> AIExtractionResult:
        self.session.add(extraction_result)
        await self.session.flush()
        await self.session.refresh(extraction_result)
        return extraction_result
        
    async def get_by_ocr_result_id(self, ocr_result_id: uuid.UUID) -> AIExtractionResult | None:
        stmt = select(AIExtractionResult).where(AIExtractionResult.ocr_result_id == ocr_result_id)
        result = await self.session.execute(stmt)
        return result.scalars().first()

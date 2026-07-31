from sqlalchemy.ext.asyncio import AsyncSession
from app.models.uploaded_file import UploadedFile
from app.repositories.base import BaseRepository

class UploadedFileRepository(BaseRepository[UploadedFile]):
    def __init__(self, session: AsyncSession):
        super().__init__(UploadedFile, session)

    async def create(self, uploaded_file: UploadedFile) -> UploadedFile:
        self.session.add(uploaded_file)
        await self.session.flush()
        await self.session.refresh(uploaded_file)
        return uploaded_file

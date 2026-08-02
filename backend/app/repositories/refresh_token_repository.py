from sqlalchemy import select, delete
from sqlalchemy.ext.asyncio import AsyncSession
from typing import Optional
from uuid import UUID

from app.models.refresh_token import RefreshToken

class RefreshTokenRepository:
    def __init__(self, session: AsyncSession):
        self.session = session
        
    async def get_by_hashed_token(self, hashed_token: str) -> Optional[RefreshToken]:
        stmt = select(RefreshToken).where(RefreshToken.hashed_token == hashed_token)
        result = await self.session.execute(stmt)
        return result.scalars().first()
        
    async def create(self, token: RefreshToken) -> RefreshToken:
        self.session.add(token)
        await self.session.flush()
        return token
        
    async def delete_by_hashed_token(self, hashed_token: str) -> None:
        stmt = delete(RefreshToken).where(RefreshToken.hashed_token == hashed_token)
        await self.session.execute(stmt)

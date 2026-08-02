from uuid import UUID
from datetime import datetime, timezone
import hashlib
from fastapi import HTTPException, status

from app.schemas.auth import UserCreate, LoginRequest, TokenResponse
from app.models.user import User
from app.models.refresh_token import RefreshToken
from app.repositories.user_repository import UserRepository
from app.repositories.refresh_token_repository import RefreshTokenRepository
from app.core.security import get_password_hash, verify_password, create_access_token, create_refresh_token
from app.core.config import settings

def hash_refresh_token(token: str) -> str:
    return hashlib.sha256(token.encode()).hexdigest()

class AuthService:
    def __init__(self, user_repo: UserRepository, token_repo: RefreshTokenRepository):
        self.user_repo = user_repo
        self.token_repo = token_repo
        
    async def register(self, user_create: UserCreate) -> User:
        existing = await self.user_repo.get_by_email(user_create.email)
        if existing:
            raise HTTPException(status_code=400, detail="Email already registered")
            
        hashed_password = get_password_hash(user_create.password)
        user = User(
            email=user_create.email,
            hashed_password=hashed_password
        )
        return await self.user_repo.create(user)
        
    async def login(self, login_request: LoginRequest) -> TokenResponse:
        user = await self.user_repo.get_by_email(login_request.email)
        if not user or not verify_password(login_request.password, user.hashed_password):
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Incorrect email or password",
                headers={"WWW-Authenticate": "Bearer"},
            )
            
        return await self._create_tokens(user)
        
    async def refresh(self, refresh_token: str) -> TokenResponse:
        hashed = hash_refresh_token(refresh_token)
        token_obj = await self.token_repo.get_by_hashed_token(hashed)
        
        if not token_obj or token_obj.expires_at < datetime.now(timezone.utc):
            if token_obj:
                await self.token_repo.delete_by_hashed_token(hashed)
            raise HTTPException(
                status_code=status.HTTP_401_UNAUTHORIZED,
                detail="Invalid or expired refresh token",
                headers={"WWW-Authenticate": "Bearer"},
            )
            
        user = await self.user_repo.get_by_id(token_obj.user_id)
        if not user:
            raise HTTPException(status_code=401, detail="User not found")
            
        # Delete old token
        await self.token_repo.delete_by_hashed_token(hashed)
        
        # Issue new tokens
        return await self._create_tokens(user)
        
    async def logout(self, refresh_token: str) -> None:
        hashed = hash_refresh_token(refresh_token)
        await self.token_repo.delete_by_hashed_token(hashed)
        
    async def _create_tokens(self, user: User) -> TokenResponse:
        access_token = create_access_token(subject=str(user.id))
        refresh_token = create_refresh_token(subject=str(user.id))
        
        from datetime import timedelta
        expires_at = datetime.now(timezone.utc) + timedelta(days=settings.REFRESH_TOKEN_EXPIRE_DAYS)
        
        token_obj = RefreshToken(
            user_id=user.id,
            hashed_token=hash_refresh_token(refresh_token),
            expires_at=expires_at
        )
        await self.token_repo.create(token_obj)
        
        return TokenResponse(
            access_token=access_token,
            refresh_token=refresh_token
        )

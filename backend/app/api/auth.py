from fastapi import APIRouter, Depends, status
from app.schemas.auth import UserCreate, UserRead, LoginRequest, TokenResponse, RefreshRequest
from app.services.auth_service import AuthService
from app.api.dependencies import get_auth_service, get_current_user
from app.models.user import User

router = APIRouter(prefix="/auth", tags=["Authentication"])

@router.post("/register", response_model=UserRead, status_code=status.HTTP_201_CREATED)
async def register(
    user_create: UserCreate,
    auth_service: AuthService = Depends(get_auth_service)
):
    return await auth_service.register(user_create)

@router.post("/login", response_model=TokenResponse)
async def login(
    login_request: LoginRequest,
    auth_service: AuthService = Depends(get_auth_service)
):
    return await auth_service.login(login_request)

@router.post("/refresh", response_model=TokenResponse)
async def refresh(
    refresh_request: RefreshRequest,
    auth_service: AuthService = Depends(get_auth_service)
):
    return await auth_service.refresh(refresh_request.refresh_token)

@router.post("/logout", status_code=status.HTTP_204_NO_CONTENT)
async def logout(
    refresh_request: RefreshRequest,
    auth_service: AuthService = Depends(get_auth_service)
):
    await auth_service.logout(refresh_request.refresh_token)

@router.get("/me", response_model=UserRead)
async def get_me(
    current_user: User = Depends(get_current_user)
):
    return current_user

from fastapi import Depends, HTTPException, status
from fastapi.security import OAuth2PasswordBearer
from sqlalchemy.ext.asyncio import AsyncSession
import jwt
from uuid import UUID

from app.db.session import get_db
from app.core.config import settings

oauth2_scheme = OAuth2PasswordBearer(tokenUrl=f"{settings.API_V1_STR}/auth/login")

from app.models.user import User
from app.repositories.user_repository import UserRepository
from app.repositories.refresh_token_repository import RefreshTokenRepository
from app.services.auth_service import AuthService

def get_user_repository(session: AsyncSession = Depends(get_db)) -> UserRepository:
    return UserRepository(session)

def get_refresh_token_repository(session: AsyncSession = Depends(get_db)) -> RefreshTokenRepository:
    return RefreshTokenRepository(session)

def get_auth_service(
    user_repo: UserRepository = Depends(get_user_repository),
    token_repo: RefreshTokenRepository = Depends(get_refresh_token_repository)
) -> AuthService:
    return AuthService(user_repo, token_repo)

from app.repositories.household_repository import HouseholdRepository
from app.services.household_service import HouseholdService

def get_household_repository(session: AsyncSession = Depends(get_db)) -> HouseholdRepository:
    return HouseholdRepository(session)

def get_household_service(
    household_repo: HouseholdRepository = Depends(get_household_repository),
    user_repo: UserRepository = Depends(get_user_repository)
) -> HouseholdService:
    return HouseholdService(household_repo, user_repo)

async def get_current_user(
    token: str = Depends(oauth2_scheme),
    user_repo: UserRepository = Depends(get_user_repository)
) -> User:
    try:
        payload = jwt.decode(token, settings.JWT_SECRET_KEY, algorithms=[settings.JWT_ALGORITHM])
        user_id_str: str = payload.get("sub")
        if user_id_str is None:
            raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Could not validate credentials")
    except jwt.InvalidTokenError:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="Could not validate credentials")
        
    user = await user_repo.get_by_id(UUID(user_id_str))
    if user is None:
        raise HTTPException(status_code=status.HTTP_401_UNAUTHORIZED, detail="User not found")
    if not user.is_active:
        raise HTTPException(status_code=status.HTTP_400_BAD_REQUEST, detail="Inactive user")
    return user

from app.repositories.receipt_repository import ReceiptRepository
from app.repositories.receipt_item_repository import ReceiptItemRepository
from app.services.receipt_service import ReceiptService

def get_receipt_repository(session: AsyncSession = Depends(get_db)) -> ReceiptRepository:
    return ReceiptRepository(session)

def get_receipt_item_repository(session: AsyncSession = Depends(get_db)) -> ReceiptItemRepository:
    return ReceiptItemRepository(session)

from app.repositories.receipt_audit_repository import ReceiptAuditRepository
from app.repositories.analytics_repository import AnalyticsRepository
from app.services.analytics_service import AnalyticsService

def get_receipt_audit_repository(session: AsyncSession = Depends(get_db)) -> ReceiptAuditRepository:
    return ReceiptAuditRepository(session)

def get_analytics_repository(session: AsyncSession = Depends(get_db)) -> AnalyticsRepository:
    return AnalyticsRepository(session)

def get_analytics_service(
    repo: AnalyticsRepository = Depends(get_analytics_repository)
) -> AnalyticsService:
    return AnalyticsService(repo=repo)

def get_receipt_service(
    session: AsyncSession = Depends(get_db),
    receipt_repo: ReceiptRepository = Depends(get_receipt_repository),
    item_repo: ReceiptItemRepository = Depends(get_receipt_item_repository),
    audit_repo: ReceiptAuditRepository = Depends(get_receipt_audit_repository)
) -> ReceiptService:
    return ReceiptService(
        session=session,
        receipt_repo=receipt_repo,
        item_repo=item_repo,
        audit_repo=audit_repo
    )

from app.repositories.uploaded_file_repository import UploadedFileRepository
from app.services.upload_service import UploadService
from app.storage.base import StorageProvider
from app.storage.local import LocalStorageProvider

def get_storage_provider() -> StorageProvider:
    return LocalStorageProvider()

def get_uploaded_file_repository(session: AsyncSession = Depends(get_db)) -> UploadedFileRepository:
    return UploadedFileRepository(session)

def get_upload_service(
    session: AsyncSession = Depends(get_db),
    provider: StorageProvider = Depends(get_storage_provider),
    repository: UploadedFileRepository = Depends(get_uploaded_file_repository)
) -> UploadService:
    return UploadService(session, provider, repository)

from app.ocr.base import OCRProvider
from app.ocr.mock import MockOCRProvider
from app.repositories.ocr_result_repository import OCRResultRepository
from app.services.ocr_service import OCRService

def get_ocr_provider() -> OCRProvider:
    from app.core.config import settings
    if settings.OCR_PROVIDER == "google_vision":
        from app.ocr.google_vision import GoogleVisionOCRProvider
        return GoogleVisionOCRProvider()
    from app.ocr.mock import MockOCRProvider
    return MockOCRProvider()

def get_ocr_result_repository(session: AsyncSession = Depends(get_db)) -> OCRResultRepository:
    return OCRResultRepository(session)

def get_ocr_service(
    session: AsyncSession = Depends(get_db),
    provider: OCRProvider = Depends(get_ocr_provider),
    ocr_repo: OCRResultRepository = Depends(get_ocr_result_repository),
    upload_repo: UploadedFileRepository = Depends(get_uploaded_file_repository)
) -> OCRService:
    return OCRService(session, provider, ocr_repo, upload_repo)

from app.ai.base import AIProvider
from app.repositories.ai_extraction_result_repository import AIExtractionResultRepository
from app.services.ai_service import AIService

def get_ai_provider() -> AIProvider:
    from app.core.config import settings
    if settings.AI_PROVIDER == "gemini":
        from app.ai.gemini import GeminiAIProvider
        return GeminiAIProvider()
    from app.ai.mock import MockAIProvider
    return MockAIProvider()

def get_ai_result_repository(session: AsyncSession = Depends(get_db)) -> AIExtractionResultRepository:
    return AIExtractionResultRepository(session)

def get_ai_service(
    session: AsyncSession = Depends(get_db),
    provider: AIProvider = Depends(get_ai_provider),
    ai_repo: AIExtractionResultRepository = Depends(get_ai_result_repository),
    ocr_repo: OCRResultRepository = Depends(get_ocr_result_repository),
    upload_repo: UploadedFileRepository = Depends(get_uploaded_file_repository)
) -> AIService:
    return AIService(session, provider, ai_repo, ocr_repo, upload_repo)

from app.services.receipt_materialization_service import ReceiptMaterializationService
from app.repositories.receipt_repository import ReceiptRepository

def get_receipt_materialization_service(
    session: AsyncSession = Depends(get_db),
    ai_repo: AIExtractionResultRepository = Depends(get_ai_result_repository),
    receipt_repo: ReceiptRepository = Depends(get_receipt_repository),
    upload_repo: UploadedFileRepository = Depends(get_uploaded_file_repository),
    ocr_repo: OCRResultRepository = Depends(get_ocr_result_repository)
) -> ReceiptMaterializationService:
    return ReceiptMaterializationService(session, ai_repo, receipt_repo, upload_repo, ocr_repo)

from app.services.expense_split_service import ExpenseSplitService
from app.services.settlement_service import SettlementService

def get_expense_split_service(session: AsyncSession = Depends(get_db)) -> ExpenseSplitService:
    return ExpenseSplitService(session)

def get_settlement_service(session: AsyncSession = Depends(get_db)) -> SettlementService:
    return SettlementService(session)

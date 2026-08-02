from fastapi import APIRouter
from app.api.endpoints import health
from app.api import receipts
from app.api import uploads
from app.api import ocr
from app.api import ai
from app.api import normalization
from app.api import analytics

api_router = APIRouter()
api_router.include_router(health.router, tags=["health"])
api_router.include_router(receipts.router)
api_router.include_router(uploads.router)
api_router.include_router(ocr.router)
api_router.include_router(ai.router)
api_router.include_router(normalization.router)
api_router.include_router(analytics.router)

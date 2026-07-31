from fastapi import APIRouter
from app.api.endpoints import health
from app.api import receipts
from app.api import uploads

api_router = APIRouter()
api_router.include_router(health.router, tags=["health"])
api_router.include_router(receipts.router)
api_router.include_router(uploads.router)

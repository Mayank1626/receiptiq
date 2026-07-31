from fastapi import APIRouter
from app.api.endpoints import health
from app.api import receipts

api_router = APIRouter()
api_router.include_router(health.router, tags=["health"])
api_router.include_router(receipts.router)

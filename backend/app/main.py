import logging
from contextlib import asynccontextmanager
from fastapi import FastAPI, Request
from fastapi.responses import JSONResponse
from fastapi.middleware.cors import CORSMiddleware

from app.api.router import api_router
from app.core.config import settings
from app.core.logging import setup_logging
from app.db.session import engine
from app.core.exceptions import (
    ReceiptNotFoundError,
    InvalidReceiptError,
    DuplicateReceiptError,
    RepositoryError,
    FileValidationError
)

# Setup logging
setup_logging()
logger = logging.getLogger(__name__)

@asynccontextmanager
async def lifespan(app: FastAPI):
    logger.info("Starting up ReceiptIQ API...")
    # Initialization code can go here
    yield
    logger.info("Shutting down ReceiptIQ API...")
    await engine.dispose()

app = FastAPI(
    title=settings.PROJECT_NAME,
    openapi_url=f"{settings.API_V1_STR}/openapi.json",
    lifespan=lifespan,
)

@app.middleware("http")
async def log_requests(request: Request, call_next):
    logger.info(f"Incoming Request: {request.method} {request.url.path}")
    response = await call_next(request)
    return response

@app.exception_handler(ReceiptNotFoundError)
async def receipt_not_found_handler(request: Request, exc: ReceiptNotFoundError):
    logger.info(f"Receipt not found: {str(exc)}")
    return JSONResponse(status_code=404, content={"detail": str(exc)})

@app.exception_handler(InvalidReceiptError)
async def invalid_receipt_handler(request: Request, exc: InvalidReceiptError):
    logger.info(f"Invalid receipt data: {str(exc)}")
    return JSONResponse(status_code=400, content={"detail": str(exc)})

@app.exception_handler(FileValidationError)
async def file_validation_handler(request: Request, exc: FileValidationError):
    logger.info(f"File validation failed: {str(exc)}")
    return JSONResponse(status_code=400, content={"detail": str(exc)})

@app.exception_handler(DuplicateReceiptError)
async def duplicate_receipt_handler(request: Request, exc: DuplicateReceiptError):
    logger.info(f"Duplicate receipt: {str(exc)}")
    return JSONResponse(status_code=409, content={"detail": str(exc)})

@app.exception_handler(RepositoryError)
async def repository_error_handler(request: Request, exc: RepositoryError):
    logger.error(f"Repository error: {str(exc)}")
    return JSONResponse(status_code=500, content={"detail": "Internal server error."})


# Set all CORS enabled origins
if settings.BACKEND_CORS_ORIGINS:
    app.add_middleware(
        CORSMiddleware,
        allow_origins=[str(origin) for origin in settings.BACKEND_CORS_ORIGINS],
        allow_credentials=True,
        allow_methods=["*"],
        allow_headers=["*"],
    )

app.include_router(api_router, prefix=settings.API_V1_STR)

@app.get("/")
async def root():
    return {"message": f"Welcome to {settings.PROJECT_NAME}"}

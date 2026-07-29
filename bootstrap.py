import os
import pathlib

base_dir = pathlib.Path("c:/Users/mayan/OneDrive/Desktop/ReceiptIQ/backend")
base_dir.mkdir(parents=True, exist_ok=True)

files = {
    "pyproject.toml": """[tool.poetry]
name = "receiptiq-backend"
version = "0.1.0"
description = "ReceiptIQ Backend API"
authors = ["Admin <admin@example.com>"]
readme = "README.md"

[tool.poetry.dependencies]
python = "^3.12"
fastapi = "^0.111.0"
uvicorn = {extras = ["standard"], version = "^0.30.0"}
sqlalchemy = {extras = ["asyncio"], version = "^2.0.30"}
aiosqlite = "^0.20.0"
alembic = "^1.13.1"
pydantic = "^2.7.0"
pydantic-settings = "^2.2.1"

[tool.poetry.group.dev.dependencies]
pytest = "^8.2.0"
pytest-asyncio = "^0.23.6"
httpx = "^0.27.0"
ruff = "^0.4.8"
black = "^24.4.2"

[build-system]
requires = ["poetry-core"]
build-backend = "poetry.core.masonry.api"
""",
    "requirements.txt": """fastapi>=0.111.0
uvicorn[standard]>=0.30.0
sqlalchemy[asyncio]>=2.0.30
aiosqlite>=0.20.0
alembic>=1.13.1
pydantic>=2.7.0
pydantic-settings>=2.2.1
""",
    ".env.example": """# Server Settings
API_V1_STR="/api/v1"
PROJECT_NAME="ReceiptIQ API"

# Database Settings
DATABASE_URL="sqlite+aiosqlite:///./receiptiq.db"

# CORS
BACKEND_CORS_ORIGINS='["http://localhost", "http://localhost:8080", "http://localhost:3000"]'
""",
    "README.md": """# ReceiptIQ Backend

This is the FastAPI backend for ReceiptIQ.

## Requirements
- Python 3.12+

## Setup
1. Create a virtual environment: `python -m venv venv`
2. Activate the virtual environment: `.\\venv\\Scripts\\activate`
3. Install dependencies: `pip install -r requirements.txt` (or use Poetry: `poetry install`)
4. Copy `.env.example` to `.env`
5. Run migrations: `alembic upgrade head`
6. Run the server: `uvicorn app.main:app --reload`
""",
    ".gitignore": """venv/
__pycache__/
*.pyc
.env
receiptiq.db
.pytest_cache/
.coverage
alembic/versions/*.py
""",
    "alembic.ini": """[alembic]
script_location = alembic
prepend_sys_path = .
version_path_separator = os
sqlalchemy.url = sqlite+aiosqlite:///./receiptiq.db

[post_write_hooks]

[loggers]
keys = root,sqlalchemy,alembic

[handlers]
keys = console

[formatters]
keys = generic

[logger_root]
level = WARN
handlers = console
qualname =

[logger_sqlalchemy]
level = WARN
handlers =
qualname = sqlalchemy.engine

[logger_alembic]
level = INFO
handlers =
qualname = alembic

[handler_console]
class = StreamHandler
args = (sys.stderr,)
level = NOTSET
formatter = generic

[formatter_generic]
format = %(levelname)-5.5s [%(name)s] %(message)s
datefmt = %H:%M:%S
""",
    "alembic/env.py": """import asyncio
from logging.config import fileConfig

from sqlalchemy import pool
from sqlalchemy.engine import Connection
from sqlalchemy.ext.asyncio import async_engine_from_config

from alembic import context

from app.core.config import settings
from app.db.base import Base

config = context.config

if config.config_file_name is not None:
    fileConfig(config.config_file_name)

target_metadata = Base.metadata
config.set_main_option("sqlalchemy.url", str(settings.DATABASE_URL))

def run_migrations_offline() -> None:
    url = config.get_main_option("sqlalchemy.url")
    context.configure(
        url=url,
        target_metadata=target_metadata,
        literal_binds=True,
        dialect_opts={"paramstyle": "named"},
    )
    with context.begin_transaction():
        context.run_migrations()

def do_run_migrations(connection: Connection) -> None:
    context.configure(connection=connection, target_metadata=target_metadata)
    with context.begin_transaction():
        context.run_migrations()

async def run_async_migrations() -> None:
    connectable = async_engine_from_config(
        config.get_section(config.config_ini_section, {}),
        prefix="sqlalchemy.",
        poolclass=pool.NullPool,
    )
    async with connectable.connect() as connection:
        await connection.run_sync(do_run_migrations)
    await connectable.dispose()

def run_migrations_online() -> None:
    asyncio.run(run_async_migrations())

if context.is_offline_mode():
    run_migrations_offline()
else:
    run_migrations_online()
""",
    "alembic/script.py.mako": '\"\"\"${message}\n\nRevision ID: ${up_revision}\nRevises: ${down_revision | comma,n}\nCreate Date: ${create_date}\n\n\"\"\"\nfrom typing import Sequence, Union\n\nfrom alembic import op\nimport sqlalchemy as sa\n${imports if imports else ""}\n\n# revision identifiers, used by Alembic.\nrevision: str = \\\'${up_revision}\\\'\ndown_revision: Union[str, None] = ${repr(down_revision)}\nbranch_labels: Union[str, Sequence[str], None] = ${repr(branch_labels)}\ndepends_on: Union[str, Sequence[str], None] = ${repr(depends_on)}\n\n\ndef upgrade() -> None:\n    ${upgrades if upgrades else "pass"}\n\n\ndef downgrade() -> None:\n    ${downgrades if downgrades else "pass"}\n',
    "app/__init__.py": "",
    "app/main.py": """import logging
from contextlib import asynccontextmanager
from fastapi import FastAPI
from fastapi.middleware.cors import CORSMiddleware

from app.api.router import api_router
from app.core.config import settings
from app.core.logging import setup_logging
from app.db.session import engine

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
""",
    "app/core/__init__.py": "",
    "app/core/config.py": """from typing import List, Union
from pydantic import AnyHttpUrl, field_validator
from pydantic_settings import BaseSettings, SettingsConfigDict

class Settings(BaseSettings):
    API_V1_STR: str = "/api/v1"
    PROJECT_NAME: str = "ReceiptIQ API"
    
    # DB settings
    DATABASE_URL: str = "sqlite+aiosqlite:///./receiptiq.db"

    # CORS
    BACKEND_CORS_ORIGINS: List[AnyHttpUrl] = []

    @field_validator("BACKEND_CORS_ORIGINS", mode="before")
    @classmethod
    def assemble_cors_origins(cls, v: Union[str, List[str]]) -> Union[List[str], str]:
        if isinstance(v, str) and not v.startswith("["):
            return [i.strip() for i in v.split(",")]
        elif isinstance(v, (list, str)):
            return v
        raise ValueError(v)

    model_config = SettingsConfigDict(case_sensitive=True, env_file=".env")

settings = Settings()
""",
    "app/core/logging.py": """import logging
import sys

def setup_logging():
    logging.basicConfig(
        level=logging.INFO,
        format="%(asctime)s - %(name)s - %(levelname)s - %(message)s",
        handlers=[logging.StreamHandler(sys.stdout)],
    )
""",
    "app/db/__init__.py": "",
    "app/db/session.py": """from typing import AsyncGenerator
from sqlalchemy.ext.asyncio import create_async_engine, async_sessionmaker, AsyncSession
from app.core.config import settings

engine = create_async_engine(
    settings.DATABASE_URL, 
    echo=False, 
    future=True,
    connect_args={"check_same_thread": False} if "sqlite" in settings.DATABASE_URL else {}
)

AsyncSessionLocal = async_sessionmaker(
    engine, class_=AsyncSession, expire_on_commit=False
)

async def get_db() -> AsyncGenerator[AsyncSession, None]:
    async with AsyncSessionLocal() as session:
        yield session
""",
    "app/db/base.py": """from sqlalchemy.orm import DeclarativeBase

class Base(DeclarativeBase):
    pass
""",
    "app/api/__init__.py": "",
    "app/api/endpoints/__init__.py": "",
    "app/api/endpoints/health.py": """from fastapi import APIRouter, Depends
from sqlalchemy.ext.asyncio import AsyncSession
from sqlalchemy import text
from app.db.session import get_db

router = APIRouter()

@router.get("/health")
async def health_check(db: AsyncSession = Depends(get_db)):
    db_status = "ok"
    try:
        await db.execute(text("SELECT 1"))
    except Exception as e:
        db_status = f"error: {str(e)}"
        
    return {
        "status": "ok",
        "database": db_status
    }
""",
    "app/api/router.py": """from fastapi import APIRouter
from app.api.endpoints import health

api_router = APIRouter()
api_router.include_router(health.router, tags=["health"])
"""
}

for path, content in files.items():
    full_path = base_dir / path
    full_path.parent.mkdir(parents=True, exist_ok=True)
    full_path.write_text(content, encoding="utf-8")

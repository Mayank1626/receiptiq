# ReceiptIQ Backend

This is the FastAPI backend for ReceiptIQ.

## Requirements
- [uv](https://docs.astral.sh/uv/)
- Python 3.12+

## Setup
1. Install dependencies and create a virtual environment: `uv sync`
2. Copy `.env.example` to `.env`
3. Run migrations: `uv run alembic upgrade head`
4. Run the server: `uv run uvicorn app.main:app --reload`

*(Optional) You can activate the virtual environment manually with `.\.venv\Scripts\activate`.*

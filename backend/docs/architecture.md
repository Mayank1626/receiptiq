# ReceiptIQ Backend Architecture Guide

This document outlines the architectural patterns, coding conventions, and best practices for the ReceiptIQ backend. Future code generation and development must adhere to these guidelines to ensure consistency, maintainability, and scalability.

## 1. Clean Architecture Layers

The backend follows a pragmatic Clean Architecture approach tailored for FastAPI, heavily utilizing Dependency Injection to decouple layers.

- **Routers (`app/api/`)**: Strictly for handling HTTP requests, response serialization, and routing. Must contain **zero** business logic.
- **Services (`app/services/`)**: Orchestrates business logic, external API calls (e.g., OCR, AI extraction), and complex rules.
- **Repositories (`app/repositories/`)**: Encapsulates all SQLAlchemy queries and database interactions.
- **Schemas (`app/schemas/`)**: Pydantic v2 models for data validation, parsing, and serialization.
- **Models (`app/models/`)**: SQLAlchemy 2.0 declarative models representing database tables.

## 2. Naming & Typing Conventions

- **Typing**: Strict Python type hints are mandatory (`typing` module or native `|` syntax).
- **Files & Modules**: `snake_case.py`.
- **Classes**: `PascalCase`.
- **Functions & Variables**: `snake_case`.
- **SQLAlchemy Models**: Singular PascalCase (e.g., `Receipt`). Table names are plural snake_case (e.g., `__tablename__ = "receipts"`).
- **Pydantic Schemas**: Grouped by intent (e.g., `ReceiptBase`, `ReceiptCreate`, `ReceiptResponse`).

## 3. Dependency Injection (DI)

Leverage FastAPI's `Depends` to inject dependencies down the chain.
1. The Router injects the **Service**.
2. The Service injects the **Repository** (and any other external clients).
3. The Repository injects the **AsyncSession**.

```python
# Example
@router.post("/", response_model=ReceiptResponse)
async def create_receipt(
    receipt_in: ReceiptCreate,
    service: ReceiptService = Depends(get_receipt_service)
):
    return await service.create(receipt_in)
```

## 4. Database & Transaction Management

- **SQLAlchemy 2.0**: Exclusively use `Mapped[T]` and `mapped_column` with SQLAlchemy 2.0 style queries (`select()`, `insert()`).
- **Async Execution**: All database operations must be asynchronous via `aiosqlite` (or `asyncpg` later).
- **Transaction Scope**: The `AsyncSession` is yielded per request. Commits and Rollbacks should ideally be handled within the **Service Layer** to maintain atomic business transactions, while the Repository strictly handles querying.
- **Data Types**: Monetary fields must use `Numeric(10, 2)` (SQLAlchemy) and `decimal.Decimal` (Python).

## 5. Pydantic v2 Best Practices

- Use `model_config = ConfigDict(from_attributes=True)` to map ORM models to Pydantic responses.
- Avoid legacy `orm_mode`.
- Use `Field(default_factory=...)` for mutable default values (like lists).
- Ensure Decimal types are used for financial fields in schemas to prevent precision loss.

## 6. Exception Handling

- **Custom Exceptions**: Define application-specific exceptions (e.g., `ReceiptNotFoundError`, `OcrProcessingError`).
- **Global Handlers**: Map custom exceptions to HTTP responses via FastAPI global exception handlers in `app/main.py`.
- Do not leak raw database exceptions (`sqlalchemy.exc`) to the client. The Repository layer should catch them and raise domain-specific exceptions.

## 7. Logging

- Use the centralized structured logging setup initialized in `app/core/logging.py`.
- Retrieve loggers using `logger = logging.getLogger(__name__)`.
- Log exceptional events, external API latency, and state changes (e.g., Receipt processing started/finished), but do not log sensitive user data.

## 8. Testing Patterns

- **Framework**: `pytest` with `pytest-asyncio`.
- **Database**: Use a separate asynchronous testing database. Fixtures should handle DB schema setup (`alembic upgrade head`) and teardown.
- **Mocking**: External boundaries (Google Cloud, OCR APIs, AI models) must be mocked using `unittest.mock` or `pytest-mock`.
- **Fixtures**: Use `conftest.py` to provide reusable client, session, and mock fixtures.

## 9. API Response Standard

**Plain Resource Responses** are used as the standard across the application. 
Rather than wrapping all responses in a generic `{ "success": true, "data": ... }` envelope, endpoints will return the raw JSON resource (e.g., `{"id": "...", "total_amount": 10.00}`). 
This natively integrates with FastAPI's `response_model`, OpenAPI/Swagger specifications, and Pydantic validation without requiring boilerplate envelope classes.

## 10. Configuration Policy

- **No Hardcoded Secrets**: Never hardcode credentials, API keys, or environment-specific values in the source code.
- **Centralized Loading**: Always load configuration through `app/core/config.py` using `pydantic-settings`.
- **Environment Variables**: Environment-specific values belong in the `.env` file (or injected via deployment platforms).
- **Dependency Injection**: Services that require configuration values should receive them through dependency injection (or by importing `settings`), keeping configuration logically isolated.

## 11. AI Integration Guidelines

As ReceiptIQ heavily integrates with AI (e.g., Gemini) for OCR extraction and data normalization:

- **Abstraction**: AI providers must be abstracted behind interfaces (e.g., `BaseAIExtractor`).
- **No Direct Coupling**: Services must never depend directly on a specific provider's SDK (like Gemini). They must depend on the interface.
- **Validation Before Persistence**: AI responses are inherently unpredictable. Outputs must be rigorously validated via Pydantic schemas before persisting to the database.
- **Raw Storage**: Raw AI output (or the raw OCR text) should be stored separately from the normalized `Receipt` data to allow for future re-processing or auditing.

## 12. Authentication & Authorization (Households)

To support multiple users and shared expenses securely:

- **JWT Authentication**: We use stateless, short-lived JSON Web Tokens (JWT) for API authorization.
- **Refresh Tokens**: Long-lived sessions are maintained using stateful refresh tokens stored securely as SHA-256 hashes in the database.
- **Household Abstraction**: Users can collaborate on receipts through a "Household". A user can be a member of multiple households.
- **Row-level Ownership**: Resources (receipts, analytics, uploads) are owned by either an individual User (`owner_id`) or a Household (`household_id`). Access is evaluated at the repository query level using dependency injection (`get_current_user`).

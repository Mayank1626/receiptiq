# ADR 0002: Adopt Pragmatic Clean Architecture

## Context
As a FastAPI application that will heavily rely on external integrations (OCR, AI models, Cloud Storage), mixing HTTP routing logic, database queries, and business logic inside a single file or function would lead to a codebase that is hard to test and maintain.

## Decision
We adopted a pragmatic Clean Architecture approach, dividing the application into distinct layers:
- Routers (API endpoints)
- Services (Business logic & external API orchestration)
- Repositories (Database interactions)
- Models (SQLAlchemy entities)
- Schemas (Pydantic validation)

## Alternatives considered
- **MVC (Model-View-Controller)**: Usually pairs view rendering with data, which doesn't fit an API-first backend.
- **Transaction Script / "Fat Routers"**: Putting everything in the FastAPI route handlers. Faster to start, but impossible to maintain as the application scales.

## Consequences
- **Positive**: High testability. Business logic is completely decoupled from HTTP concerns and database specificities.
- **Negative**: Introduces minor boilerplate (e.g., writing an interface/class for a Service and Repository even for simple CRUD operations).

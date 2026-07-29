# ADR 0004: Adhere Strictly to SQLAlchemy 2.0

## Context
SQLAlchemy 2.0 introduced significant changes, entirely dropping the legacy `Query` syntax in favor of 2.0 style `select()`, and introducing strict typing via `Mapped[T]` and `mapped_column()`. 

## Decision
We will exclusively use SQLAlchemy 2.0 conventions. Legacy `.query()` patterns and dynamic relationship loading are prohibited. We use modern `sqlalchemy.Uuid` and database-managed defaults (`server_default=func.now()`).

## Alternatives considered
- **SQLModel**: A wrapper combining Pydantic and SQLAlchemy. Considered, but can obscure complex SQL operations and relationships when applications scale.
- **SQLAlchemy 1.4 compatibility mode**: Used during migrations, but since this is a greenfield project, it makes no sense to carry technical debt.

## Consequences
- **Positive**: Superior IDE typing support, fully asynchronous native APIs (`AsyncSession`), and cleaner model definitions.
- **Negative**: Developers accustomed to SQLAlchemy 1.x must adapt to the new `Session.execute(select(...))` paradigm.

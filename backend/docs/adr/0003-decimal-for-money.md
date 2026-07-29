# ADR 0003: Use Decimal Types for Monetary Values

## Context
ReceiptIQ revolves around parsing, storing, and analyzing receipts containing monetary amounts (totals, taxes, line items). Floating-point arithmetic is inherently imprecise (e.g. `0.1 + 0.2 != 0.3`), which is unacceptable for financial software.

## Decision
All monetary fields (`total_amount`, `subtotal`, `tax`, etc.) are mapped to `Numeric(10, 2)` in SQLAlchemy and `decimal.Decimal` in Python/Pydantic.

## Alternatives considered
- **Integer Cents**: Storing values as integer cents (e.g., `$10.50` -> `1050`). This completely avoids floating point issues but requires conversion logic every time data is displayed or saved.
- **Float**: The easiest type to implement, but fails quickly on basic arithmetic due to binary floating-point representation.

## Consequences
- **Positive**: Absolute precision for financial arithmetic. Direct mapping to PostgreSQL's robust `NUMERIC` type.
- **Negative**: Requires slight care to parse raw AI or user inputs as strings to `Decimal` to avoid float parsing errors.

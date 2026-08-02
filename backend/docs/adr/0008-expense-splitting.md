# 8. Expense Splitting & Settlements

Date: 2026-08-02

## Status
Accepted

## Context
Following the implementation of Household functionality, users need the ability to split receipt expenses among household members and settle their debts. 
Since a user can have many split receipts within a household, creating a settlement for every single split would result in too many transactions. We need an algorithm to simplify debts by calculating the net balance of each user within a household and suggesting optimal settlement payments.

## Decision

### 1. Expense Split Models
We introduce `ExpenseSplit` and `ExpenseShare` models to capture the intent of how a receipt's cost is distributed.
- `ExpenseSplit` is a 1-to-1 extension of a `Receipt`. It supports EQUAL, PERCENTAGE, and FIXED split types.
- `ExpenseShare` belongs to a split and a user. It captures `amount_paid` (how much the user contributed upfront) and `amount_owed` (the user's share of the cost).

### 2. Settlements and the Net Balance Approach
Rather than settling individual receipts, users settle against their overall **Household Net Balance**.
- `BalanceCalculator`: A pure algorithmic component that calculates the net balance for each user by summing their `amount_paid` minus `amount_owed` across all ACTIVE splits, and then adjusting for any COMPLETED `Settlement` records where they were the payer or payee.
- `SettlementOptimizer`: A greedy algorithm that takes the net balances and produces a minimal list of suggested payments (Settlements) to resolve all outstanding debt in the household.

### 3. Split Lifecycle and Receipt Modification
If a receipt's total amount is modified after an `ExpenseSplit` has been created, the split's underlying data may become invalid.
- We do not automatically delete the split.
- Instead, we introduce an `INVALID` state for splits. When a receipt's total changes, any associated ACTIVE split is transitioned to `INVALID`. The users must then recalculate and confirm a new split.

### 4. Precision
All financial calculations and database columns strictly use `Decimal` and `Numeric(10, 2)` to avoid floating-point errors.

### 5. Audit Logging
We track split creation, invalidation, and settlement completion events in the audit log for transparency.

### 6. Future Proofing
The `ExpenseSplit` and `Settlement` models include a `billing_cycle_id` (nullable). This allows future features where households settle on a monthly cadence rather than on a rolling continuous balance.

## Consequences
- **Positive:** Users can seamlessly split bills. The number of peer-to-peer transactions is mathematically minimized.
- **Positive:** Keeping `BalanceCalculator` and `SettlementOptimizer` as pure, side-effect-free functions makes them highly testable.
- **Negative:** The backend must fetch all ACTIVE splits and COMPLETED settlements for a household to calculate real-time balances, which could become slow for massive households over years of usage (this can be mitigated later with materialized views or periodic snapshots using `billing_cycle_id`).

# 7. Authentication and Authorization (Households)

Date: 2026-08-02

## Status
Accepted

## Context
With the core receipt processing pipeline (OCR, AI Extraction, Validation, Materialization) and analytics layer complete, the application needs a security and multi-tenancy model to support production usage. The goal is to allow users to securely register, manage their own receipts, and optionally collaborate with family members or roommates on shared expenses via a "Household" structure.

## Decision

### 1. JSON Web Tokens (JWT)
We use stateless JWT access tokens for API authorization.
- **Short-lived access tokens:** (e.g., 15 minutes) reduce the risk of token theft.
- **Stateless:** The backend does not need to query a database to verify token validity, which helps performance.
- The `subject` (sub) claim contains the `User.id` (UUID).

### 2. Refresh Tokens
Since access tokens are short-lived, we implement refresh tokens to maintain persistent sessions without requiring the user to constantly log in.
- **Long-lived:** Valid for 30 days.
- **Stateful (Database-backed):** Stored in a `refresh_tokens` table. This allows us to revoke sessions (e.g., on logout or password reset).
- **Security:** We store the *SHA-256 hash* of the refresh token in the database, not the raw token, protecting user sessions in case of a database leak.

### 3. Password Hashing
We use `argon2id` for hashing user passwords (via Passlib). It provides superior resistance against GPU cracking and side-channel attacks compared to older algorithms like bcrypt or PBKDF2.

### 4. Households and Collaboration
To support shared expenses, we implement a "Household" abstraction.
- A user can create or join multiple households.
- A `HouseholdMember` link table maps Users to Households and defines their role (OWNER, ADMIN, MEMBER).
- **Row-level ownership:** Receipts (and uploaded files) now belong either to an individual `User` (`owner_id`) or to a `Household` (`household_id`).

### 5. Authorization
API endpoints enforce data ownership via dependency injection (`get_current_user`).
- Access rules are evaluated at the database query level for security and efficiency.
- An authenticated user has access to a resource if:
  - `owner_id == user.id` OR
  - `household_id IN (user's active household memberships)` OR
  - The resource is globally unassigned (for legacy draft data migration).

## Consequences
- **Positive:** Improved security posture; enables future mobile/web clients to maintain secure, persistent sessions; allows multi-user collaboration out-of-the-box.
- **Negative:** Increased complexity in API dependency injection and repository query logic (having to filter by user and household IDs on every query).

# ADR 0001: Use uv for Project Management

## Context
The project required a fast, modern, and reliable way to manage Python dependencies, virtual environments, and project packaging. Traditional tools like `pip` and `poetry` often suffer from slow resolution times and complex lockfile conflicts.

## Decision
We adopted `uv` as the single source of truth for dependencies and project management, utilizing a PEP 621 compliant `pyproject.toml` (without a legacy `requirements.txt`).

## Alternatives considered
- **Poetry**: Good lockfile support but generally slower and relies on a proprietary `[tool.poetry]` configuration block.
- **Pip + requirements.txt**: Simple, but lacks a strict lockfile mechanism for transient dependencies without relying on third-party tools like `pip-tools`.

## Consequences
- **Positive**: Extremely fast dependency resolution and environment setup. Project configuration follows modern PEP 621 standards.
- **Negative**: Requires developers to have `uv` installed, which is relatively new compared to standard tools.

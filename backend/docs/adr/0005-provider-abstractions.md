# ADR 0005: Provider Abstractions for External Services

## Context
ReceiptIQ integrates with multiple external services including AI models (e.g., Gemini), OCR engines, cloud storage providers (e.g., Google Cloud Storage, S3), and email providers. Directly importing and calling vendor-specific SDKs within our core business logic tightly couples our application to third-party implementations. This makes testing difficult, vendor lock-in inevitable, and swapping providers extremely costly.

## Decision
External services (AI models, OCR engines, storage providers, email providers) must always be accessed through project-defined interfaces (abstract base classes) rather than directly through vendor SDKs.

## Alternatives considered
- **Direct SDK Integration**: Using vendor SDKs (e.g., `google-generativeai`) directly in the Service layer. This is faster initially but violates the Dependency Inversion principle and makes unit testing complex.
- **Provider-Specific Modules without Abstraction**: Wrapping the SDKs in helper functions but not formally defining interfaces. This still leaves the application coupled to the specific data structures of the provider.

## Consequences
- **Positive**: High testability (we can easily inject mock providers). No vendor lock-in (we can swap an AI provider by implementing a new class that adheres to the interface). Core logic remains focused on our domain rather than external HTTP APIs.
- **Negative**: Requires writing additional boilerplate (interfaces and concrete wrapper classes) for every external service integration.

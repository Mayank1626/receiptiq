class ReceiptIQError(Exception):
    """Base exception for all domain errors."""
    pass

class ResourceNotFoundError(ReceiptIQError):
    """Raised when a requested resource is not found."""
    pass

class ReceiptNotFoundError(ResourceNotFoundError):
    """Raised when a receipt is not found."""
    pass

class InvalidReceiptError(ReceiptIQError):
    """Raised when receipt data is invalid."""
    pass

class DuplicateReceiptError(ReceiptIQError):
    """Raised when a duplicate receipt is detected."""
    pass

class RepositoryError(ReceiptIQError):
    """Raised when a repository operation fails."""
    pass

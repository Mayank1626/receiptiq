class ReceiptIQError(Exception):
    """Base exception for all domain errors."""
    pass

class ResourceNotFoundError(ReceiptIQError):
    """Raised when a requested resource is not found."""
    pass

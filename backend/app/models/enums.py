import enum

class ReceiptStatus(str, enum.Enum):
    PENDING = "PENDING"
    PROCESSING = "PROCESSING"
    COMPLETED = "COMPLETED"
    FAILED = "FAILED"
    REJECTED = "REJECTED"

class ReceiptSource(str, enum.Enum):
    UPLOAD = "UPLOAD"
    EMAIL = "EMAIL"
    CAMERA = "CAMERA"

class StoreType(str, enum.Enum):
    GROCERY = "GROCERY"
    RESTAURANT = "RESTAURANT"
    ELECTRONICS = "ELECTRONICS"
    CLOTHING = "CLOTHING"
    OTHER = "OTHER"

class StorageProvider(str, enum.Enum):
    LOCAL = "LOCAL"
    GCS = "GCS"
    S3 = "S3"

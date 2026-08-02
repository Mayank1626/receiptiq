import enum

class ReceiptStatus(str, enum.Enum):
    DRAFT = "DRAFT"
    REVIEW_REQUIRED = "REVIEW_REQUIRED"
    CONFIRMED = "CONFIRMED"
    FAILED = "FAILED"

class AuditAction(str, enum.Enum):
    UPDATE_FIELD = "UPDATE_FIELD"
    ADD_ITEM = "ADD_ITEM"
    UPDATE_ITEM = "UPDATE_ITEM"
    DELETE_ITEM = "DELETE_ITEM"
    CONFIRM = "CONFIRM"

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

class ProcessingStatus(str, enum.Enum):
    UPLOADED = "UPLOADED"
    OCR_COMPLETED = "OCR_COMPLETED"
    AI_COMPLETED = "AI_COMPLETED"
    MATERIALIZED = "MATERIALIZED"
    FAILED = "FAILED"

class HouseholdRole(str, enum.Enum):
    OWNER = "OWNER"
    ADMIN = "ADMIN"
    MEMBER = "MEMBER"

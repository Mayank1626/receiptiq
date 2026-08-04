import 'package:freezed_annotation/freezed_annotation.dart';
import '../../receipts/domain/receipt_model.dart';

part 'review_models.freezed.dart';
part 'review_models.g.dart';

enum AuditAction {
  CREATED,
  UPDATED,
  DELETED,
  CONFIRMED,
  REJECTED,
  AI_PROCESSED
}

@freezed
class AuditEntry with _$AuditEntry {
  const factory AuditEntry({
    required String id,
    @JsonKey(name: 'receipt_id') required String receiptId,
    required String action,
    @JsonKey(name: 'field_name') String? fieldName,
    @JsonKey(name: 'old_value') String? oldValue,
    @JsonKey(name: 'new_value') String? newValue,
    @JsonKey(name: 'edited_at') required DateTime editedAt,
  }) = _AuditEntry;

  factory AuditEntry.fromJson(Map<String, dynamic> json) => _$AuditEntryFromJson(json);
}

@freezed
class ReviewStateData with _$ReviewStateData {
  const factory ReviewStateData({
    required ReceiptModel originalReceipt,
    required ReceiptModel editedReceipt,
    @Default(false) bool hasUnsavedChanges,
    @Default(false) bool isSaving,
    @Default(false) bool isConfirming,
    double? aiConfidence,
    @Default([]) List<AuditEntry> auditHistory,
  }) = _ReviewStateData;
}

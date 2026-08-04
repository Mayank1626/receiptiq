// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AuditEntryImpl _$$AuditEntryImplFromJson(Map<String, dynamic> json) =>
    _$AuditEntryImpl(
      id: json['id'] as String,
      receiptId: json['receipt_id'] as String,
      action: json['action'] as String,
      fieldName: json['field_name'] as String?,
      oldValue: json['old_value'] as String?,
      newValue: json['new_value'] as String?,
      editedAt: DateTime.parse(json['edited_at'] as String),
    );

Map<String, dynamic> _$$AuditEntryImplToJson(_$AuditEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receipt_id': instance.receiptId,
      'action': instance.action,
      'field_name': instance.fieldName,
      'old_value': instance.oldValue,
      'new_value': instance.newValue,
      'edited_at': instance.editedAt.toIso8601String(),
    };

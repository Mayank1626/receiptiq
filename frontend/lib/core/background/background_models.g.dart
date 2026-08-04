// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'background_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BackgroundProcessingJobImpl _$$BackgroundProcessingJobImplFromJson(
        Map<String, dynamic> json) =>
    _$BackgroundProcessingJobImpl(
      id: json['id'] as String,
      filePath: json['filePath'] as String,
      state: $enumDecode(_$ProcessingStateEnumMap, json['state']),
      retries: (json['retries'] as num?)?.toInt() ?? 0,
      createdAt: DateTime.parse(json['createdAt'] as String),
      uploadedFileId: json['uploadedFileId'] as String?,
      ocrResultId: json['ocrResultId'] as String?,
      aiExtractionResultId: json['aiExtractionResultId'] as String?,
      receiptId: json['receiptId'] as String?,
      errorMessage: json['errorMessage'] as String?,
    );

Map<String, dynamic> _$$BackgroundProcessingJobImplToJson(
        _$BackgroundProcessingJobImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'filePath': instance.filePath,
      'state': _$ProcessingStateEnumMap[instance.state]!,
      'retries': instance.retries,
      'createdAt': instance.createdAt.toIso8601String(),
      'uploadedFileId': instance.uploadedFileId,
      'ocrResultId': instance.ocrResultId,
      'aiExtractionResultId': instance.aiExtractionResultId,
      'receiptId': instance.receiptId,
      'errorMessage': instance.errorMessage,
    };

const _$ProcessingStateEnumMap = {
  ProcessingState.queued: 'queued',
  ProcessingState.uploading: 'uploading',
  ProcessingState.uploaded: 'uploaded',
  ProcessingState.ocr: 'ocr',
  ProcessingState.ocrCompleted: 'ocrCompleted',
  ProcessingState.ai: 'ai',
  ProcessingState.aiCompleted: 'aiCompleted',
  ProcessingState.materializing: 'materializing',
  ProcessingState.completed: 'completed',
  ProcessingState.failed: 'failed',
  ProcessingState.retrying: 'retrying',
  ProcessingState.paused: 'paused',
};

_$AppNotificationImpl _$$AppNotificationImplFromJson(
        Map<String, dynamic> json) =>
    _$AppNotificationImpl(
      id: json['id'] as String,
      type: $enumDecode(_$NotificationTypeEnumMap, json['type']),
      title: json['title'] as String,
      body: json['body'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      isRead: json['isRead'] as bool? ?? false,
      payload: json['payload'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$$AppNotificationImplToJson(
        _$AppNotificationImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': _$NotificationTypeEnumMap[instance.type]!,
      'title': instance.title,
      'body': instance.body,
      'timestamp': instance.timestamp.toIso8601String(),
      'isRead': instance.isRead,
      'payload': instance.payload,
    };

const _$NotificationTypeEnumMap = {
  NotificationType.receipt: 'receipt',
  NotificationType.household: 'household',
  NotificationType.settlement: 'settlement',
  NotificationType.processing: 'processing',
  NotificationType.system: 'system',
};

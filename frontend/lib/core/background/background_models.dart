import 'package:freezed_annotation/freezed_annotation.dart';

part 'background_models.freezed.dart';
part 'background_models.g.dart';

enum ProcessingState {
  queued,
  uploading,
  uploaded,
  ocr,
  ocrCompleted,
  ai,
  aiCompleted,
  materializing,
  completed,
  failed,
  retrying,
  paused,
}

@freezed
class BackgroundProcessingJob with _$BackgroundProcessingJob {
  const factory BackgroundProcessingJob({
    required String id,
    required String filePath,
    required ProcessingState state,
    @Default(0) int retries,
    required DateTime createdAt,
    String? uploadedFileId,
    String? ocrResultId,
    String? aiExtractionResultId,
    String? receiptId,
    String? errorMessage,
  }) = _BackgroundProcessingJob;

  factory BackgroundProcessingJob.fromJson(Map<String, dynamic> json) => _$BackgroundProcessingJobFromJson(json);
}

enum NotificationType {
  receipt,
  household,
  settlement,
  processing,
  system,
}

@freezed
class AppNotification with _$AppNotification {
  const factory AppNotification({
    required String id,
    required NotificationType type,
    required String title,
    required String body,
    required DateTime timestamp,
    @Default(false) bool isRead,
    Map<String, dynamic>? payload,
  }) = _AppNotification;

  factory AppNotification.fromJson(Map<String, dynamic> json) => _$AppNotificationFromJson(json);
}

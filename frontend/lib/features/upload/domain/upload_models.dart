import 'package:freezed_annotation/freezed_annotation.dart';

part 'upload_models.freezed.dart';
part 'upload_models.g.dart';

enum ProcessingStage {
  idle,
  uploading,
  ocr,
  ai,
  materializing,
  completed,
  failed,
}

@freezed
class ProcessingJob with _$ProcessingJob {
  const factory ProcessingJob({
    required ProcessingStage stage,
    String? receiptId,
  }) = _ProcessingJob;
}

@freezed
class UploadedFile with _$UploadedFile {
  const factory UploadedFile({
    required String id,
    @JsonKey(name: 'original_filename') required String originalFilename,
    @JsonKey(name: 'mime_type') required String mimeType,
  }) = _UploadedFile;

  factory UploadedFile.fromJson(Map<String, dynamic> json) => _$UploadedFileFromJson(json);
}

@freezed
class OCRResult with _$OCRResult {
  const factory OCRResult({
    required String id,
    @JsonKey(name: 'uploaded_file_id') required String uploadedFileId,
  }) = _OCRResult;

  factory OCRResult.fromJson(Map<String, dynamic> json) => _$OCRResultFromJson(json);
}

@freezed
class AIExtractionResult with _$AIExtractionResult {
  const factory AIExtractionResult({
    required String id,
    @JsonKey(name: 'ocr_result_id') required String ocrResultId,
  }) = _AIExtractionResult;

  factory AIExtractionResult.fromJson(Map<String, dynamic> json) => _$AIExtractionResultFromJson(json);
}

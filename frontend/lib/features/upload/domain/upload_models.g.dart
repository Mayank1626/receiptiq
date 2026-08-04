// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UploadedFileImpl _$$UploadedFileImplFromJson(Map<String, dynamic> json) =>
    _$UploadedFileImpl(
      id: json['id'] as String,
      originalFilename: json['original_filename'] as String,
      mimeType: json['mime_type'] as String,
    );

Map<String, dynamic> _$$UploadedFileImplToJson(_$UploadedFileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'original_filename': instance.originalFilename,
      'mime_type': instance.mimeType,
    };

_$OCRResultImpl _$$OCRResultImplFromJson(Map<String, dynamic> json) =>
    _$OCRResultImpl(
      id: json['id'] as String,
      uploadedFileId: json['uploaded_file_id'] as String,
    );

Map<String, dynamic> _$$OCRResultImplToJson(_$OCRResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'uploaded_file_id': instance.uploadedFileId,
    };

_$AIExtractionResultImpl _$$AIExtractionResultImplFromJson(
        Map<String, dynamic> json) =>
    _$AIExtractionResultImpl(
      id: json['id'] as String,
      ocrResultId: json['ocr_result_id'] as String,
    );

Map<String, dynamic> _$$AIExtractionResultImplToJson(
        _$AIExtractionResultImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ocr_result_id': instance.ocrResultId,
    };

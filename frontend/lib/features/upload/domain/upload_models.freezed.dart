// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'upload_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ProcessingJob {
  ProcessingStage get stage => throw _privateConstructorUsedError;
  String? get receiptId => throw _privateConstructorUsedError;

  /// Create a copy of ProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProcessingJobCopyWith<ProcessingJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProcessingJobCopyWith<$Res> {
  factory $ProcessingJobCopyWith(
          ProcessingJob value, $Res Function(ProcessingJob) then) =
      _$ProcessingJobCopyWithImpl<$Res, ProcessingJob>;
  @useResult
  $Res call({ProcessingStage stage, String? receiptId});
}

/// @nodoc
class _$ProcessingJobCopyWithImpl<$Res, $Val extends ProcessingJob>
    implements $ProcessingJobCopyWith<$Res> {
  _$ProcessingJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? receiptId = freezed,
  }) {
    return _then(_value.copyWith(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as ProcessingStage,
      receiptId: freezed == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProcessingJobImplCopyWith<$Res>
    implements $ProcessingJobCopyWith<$Res> {
  factory _$$ProcessingJobImplCopyWith(
          _$ProcessingJobImpl value, $Res Function(_$ProcessingJobImpl) then) =
      __$$ProcessingJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({ProcessingStage stage, String? receiptId});
}

/// @nodoc
class __$$ProcessingJobImplCopyWithImpl<$Res>
    extends _$ProcessingJobCopyWithImpl<$Res, _$ProcessingJobImpl>
    implements _$$ProcessingJobImplCopyWith<$Res> {
  __$$ProcessingJobImplCopyWithImpl(
      _$ProcessingJobImpl _value, $Res Function(_$ProcessingJobImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? stage = null,
    Object? receiptId = freezed,
  }) {
    return _then(_$ProcessingJobImpl(
      stage: null == stage
          ? _value.stage
          : stage // ignore: cast_nullable_to_non_nullable
              as ProcessingStage,
      receiptId: freezed == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$ProcessingJobImpl implements _ProcessingJob {
  const _$ProcessingJobImpl({required this.stage, this.receiptId});

  @override
  final ProcessingStage stage;
  @override
  final String? receiptId;

  @override
  String toString() {
    return 'ProcessingJob(stage: $stage, receiptId: $receiptId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProcessingJobImpl &&
            (identical(other.stage, stage) || other.stage == stage) &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, stage, receiptId);

  /// Create a copy of ProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProcessingJobImplCopyWith<_$ProcessingJobImpl> get copyWith =>
      __$$ProcessingJobImplCopyWithImpl<_$ProcessingJobImpl>(this, _$identity);
}

abstract class _ProcessingJob implements ProcessingJob {
  const factory _ProcessingJob(
      {required final ProcessingStage stage,
      final String? receiptId}) = _$ProcessingJobImpl;

  @override
  ProcessingStage get stage;
  @override
  String? get receiptId;

  /// Create a copy of ProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProcessingJobImplCopyWith<_$ProcessingJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UploadedFile _$UploadedFileFromJson(Map<String, dynamic> json) {
  return _UploadedFile.fromJson(json);
}

/// @nodoc
mixin _$UploadedFile {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'original_filename')
  String get originalFilename => throw _privateConstructorUsedError;
  @JsonKey(name: 'mime_type')
  String get mimeType => throw _privateConstructorUsedError;

  /// Serializes this UploadedFile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UploadedFileCopyWith<UploadedFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UploadedFileCopyWith<$Res> {
  factory $UploadedFileCopyWith(
          UploadedFile value, $Res Function(UploadedFile) then) =
      _$UploadedFileCopyWithImpl<$Res, UploadedFile>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'original_filename') String originalFilename,
      @JsonKey(name: 'mime_type') String mimeType});
}

/// @nodoc
class _$UploadedFileCopyWithImpl<$Res, $Val extends UploadedFile>
    implements $UploadedFileCopyWith<$Res> {
  _$UploadedFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalFilename = null,
    Object? mimeType = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      originalFilename: null == originalFilename
          ? _value.originalFilename
          : originalFilename // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UploadedFileImplCopyWith<$Res>
    implements $UploadedFileCopyWith<$Res> {
  factory _$$UploadedFileImplCopyWith(
          _$UploadedFileImpl value, $Res Function(_$UploadedFileImpl) then) =
      __$$UploadedFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'original_filename') String originalFilename,
      @JsonKey(name: 'mime_type') String mimeType});
}

/// @nodoc
class __$$UploadedFileImplCopyWithImpl<$Res>
    extends _$UploadedFileCopyWithImpl<$Res, _$UploadedFileImpl>
    implements _$$UploadedFileImplCopyWith<$Res> {
  __$$UploadedFileImplCopyWithImpl(
      _$UploadedFileImpl _value, $Res Function(_$UploadedFileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? originalFilename = null,
    Object? mimeType = null,
  }) {
    return _then(_$UploadedFileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      originalFilename: null == originalFilename
          ? _value.originalFilename
          : originalFilename // ignore: cast_nullable_to_non_nullable
              as String,
      mimeType: null == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UploadedFileImpl implements _UploadedFile {
  const _$UploadedFileImpl(
      {required this.id,
      @JsonKey(name: 'original_filename') required this.originalFilename,
      @JsonKey(name: 'mime_type') required this.mimeType});

  factory _$UploadedFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UploadedFileImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'original_filename')
  final String originalFilename;
  @override
  @JsonKey(name: 'mime_type')
  final String mimeType;

  @override
  String toString() {
    return 'UploadedFile(id: $id, originalFilename: $originalFilename, mimeType: $mimeType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UploadedFileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.originalFilename, originalFilename) ||
                other.originalFilename == originalFilename) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, originalFilename, mimeType);

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UploadedFileImplCopyWith<_$UploadedFileImpl> get copyWith =>
      __$$UploadedFileImplCopyWithImpl<_$UploadedFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UploadedFileImplToJson(
      this,
    );
  }
}

abstract class _UploadedFile implements UploadedFile {
  const factory _UploadedFile(
          {required final String id,
          @JsonKey(name: 'original_filename')
          required final String originalFilename,
          @JsonKey(name: 'mime_type') required final String mimeType}) =
      _$UploadedFileImpl;

  factory _UploadedFile.fromJson(Map<String, dynamic> json) =
      _$UploadedFileImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'original_filename')
  String get originalFilename;
  @override
  @JsonKey(name: 'mime_type')
  String get mimeType;

  /// Create a copy of UploadedFile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UploadedFileImplCopyWith<_$UploadedFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

OCRResult _$OCRResultFromJson(Map<String, dynamic> json) {
  return _OCRResult.fromJson(json);
}

/// @nodoc
mixin _$OCRResult {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'uploaded_file_id')
  String get uploadedFileId => throw _privateConstructorUsedError;

  /// Serializes this OCRResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of OCRResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $OCRResultCopyWith<OCRResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OCRResultCopyWith<$Res> {
  factory $OCRResultCopyWith(OCRResult value, $Res Function(OCRResult) then) =
      _$OCRResultCopyWithImpl<$Res, OCRResult>;
  @useResult
  $Res call(
      {String id, @JsonKey(name: 'uploaded_file_id') String uploadedFileId});
}

/// @nodoc
class _$OCRResultCopyWithImpl<$Res, $Val extends OCRResult>
    implements $OCRResultCopyWith<$Res> {
  _$OCRResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of OCRResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uploadedFileId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedFileId: null == uploadedFileId
          ? _value.uploadedFileId
          : uploadedFileId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OCRResultImplCopyWith<$Res>
    implements $OCRResultCopyWith<$Res> {
  factory _$$OCRResultImplCopyWith(
          _$OCRResultImpl value, $Res Function(_$OCRResultImpl) then) =
      __$$OCRResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id, @JsonKey(name: 'uploaded_file_id') String uploadedFileId});
}

/// @nodoc
class __$$OCRResultImplCopyWithImpl<$Res>
    extends _$OCRResultCopyWithImpl<$Res, _$OCRResultImpl>
    implements _$$OCRResultImplCopyWith<$Res> {
  __$$OCRResultImplCopyWithImpl(
      _$OCRResultImpl _value, $Res Function(_$OCRResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of OCRResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? uploadedFileId = null,
  }) {
    return _then(_$OCRResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      uploadedFileId: null == uploadedFileId
          ? _value.uploadedFileId
          : uploadedFileId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$OCRResultImpl implements _OCRResult {
  const _$OCRResultImpl(
      {required this.id,
      @JsonKey(name: 'uploaded_file_id') required this.uploadedFileId});

  factory _$OCRResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$OCRResultImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'uploaded_file_id')
  final String uploadedFileId;

  @override
  String toString() {
    return 'OCRResult(id: $id, uploadedFileId: $uploadedFileId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OCRResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.uploadedFileId, uploadedFileId) ||
                other.uploadedFileId == uploadedFileId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, uploadedFileId);

  /// Create a copy of OCRResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$OCRResultImplCopyWith<_$OCRResultImpl> get copyWith =>
      __$$OCRResultImplCopyWithImpl<_$OCRResultImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OCRResultImplToJson(
      this,
    );
  }
}

abstract class _OCRResult implements OCRResult {
  const factory _OCRResult(
      {required final String id,
      @JsonKey(name: 'uploaded_file_id')
      required final String uploadedFileId}) = _$OCRResultImpl;

  factory _OCRResult.fromJson(Map<String, dynamic> json) =
      _$OCRResultImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'uploaded_file_id')
  String get uploadedFileId;

  /// Create a copy of OCRResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$OCRResultImplCopyWith<_$OCRResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AIExtractionResult _$AIExtractionResultFromJson(Map<String, dynamic> json) {
  return _AIExtractionResult.fromJson(json);
}

/// @nodoc
mixin _$AIExtractionResult {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'ocr_result_id')
  String get ocrResultId => throw _privateConstructorUsedError;

  /// Serializes this AIExtractionResult to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AIExtractionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AIExtractionResultCopyWith<AIExtractionResult> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AIExtractionResultCopyWith<$Res> {
  factory $AIExtractionResultCopyWith(
          AIExtractionResult value, $Res Function(AIExtractionResult) then) =
      _$AIExtractionResultCopyWithImpl<$Res, AIExtractionResult>;
  @useResult
  $Res call({String id, @JsonKey(name: 'ocr_result_id') String ocrResultId});
}

/// @nodoc
class _$AIExtractionResultCopyWithImpl<$Res, $Val extends AIExtractionResult>
    implements $AIExtractionResultCopyWith<$Res> {
  _$AIExtractionResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AIExtractionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ocrResultId = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ocrResultId: null == ocrResultId
          ? _value.ocrResultId
          : ocrResultId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AIExtractionResultImplCopyWith<$Res>
    implements $AIExtractionResultCopyWith<$Res> {
  factory _$$AIExtractionResultImplCopyWith(_$AIExtractionResultImpl value,
          $Res Function(_$AIExtractionResultImpl) then) =
      __$$AIExtractionResultImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, @JsonKey(name: 'ocr_result_id') String ocrResultId});
}

/// @nodoc
class __$$AIExtractionResultImplCopyWithImpl<$Res>
    extends _$AIExtractionResultCopyWithImpl<$Res, _$AIExtractionResultImpl>
    implements _$$AIExtractionResultImplCopyWith<$Res> {
  __$$AIExtractionResultImplCopyWithImpl(_$AIExtractionResultImpl _value,
      $Res Function(_$AIExtractionResultImpl) _then)
      : super(_value, _then);

  /// Create a copy of AIExtractionResult
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ocrResultId = null,
  }) {
    return _then(_$AIExtractionResultImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ocrResultId: null == ocrResultId
          ? _value.ocrResultId
          : ocrResultId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AIExtractionResultImpl implements _AIExtractionResult {
  const _$AIExtractionResultImpl(
      {required this.id,
      @JsonKey(name: 'ocr_result_id') required this.ocrResultId});

  factory _$AIExtractionResultImpl.fromJson(Map<String, dynamic> json) =>
      _$$AIExtractionResultImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'ocr_result_id')
  final String ocrResultId;

  @override
  String toString() {
    return 'AIExtractionResult(id: $id, ocrResultId: $ocrResultId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AIExtractionResultImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ocrResultId, ocrResultId) ||
                other.ocrResultId == ocrResultId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, ocrResultId);

  /// Create a copy of AIExtractionResult
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AIExtractionResultImplCopyWith<_$AIExtractionResultImpl> get copyWith =>
      __$$AIExtractionResultImplCopyWithImpl<_$AIExtractionResultImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AIExtractionResultImplToJson(
      this,
    );
  }
}

abstract class _AIExtractionResult implements AIExtractionResult {
  const factory _AIExtractionResult(
          {required final String id,
          @JsonKey(name: 'ocr_result_id') required final String ocrResultId}) =
      _$AIExtractionResultImpl;

  factory _AIExtractionResult.fromJson(Map<String, dynamic> json) =
      _$AIExtractionResultImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'ocr_result_id')
  String get ocrResultId;

  /// Create a copy of AIExtractionResult
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AIExtractionResultImplCopyWith<_$AIExtractionResultImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

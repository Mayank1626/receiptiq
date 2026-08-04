// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'background_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BackgroundProcessingJob _$BackgroundProcessingJobFromJson(
    Map<String, dynamic> json) {
  return _BackgroundProcessingJob.fromJson(json);
}

/// @nodoc
mixin _$BackgroundProcessingJob {
  String get id => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  ProcessingState get state => throw _privateConstructorUsedError;
  int get retries => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get uploadedFileId => throw _privateConstructorUsedError;
  String? get ocrResultId => throw _privateConstructorUsedError;
  String? get aiExtractionResultId => throw _privateConstructorUsedError;
  String? get receiptId => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;

  /// Serializes this BackgroundProcessingJob to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BackgroundProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BackgroundProcessingJobCopyWith<BackgroundProcessingJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BackgroundProcessingJobCopyWith<$Res> {
  factory $BackgroundProcessingJobCopyWith(BackgroundProcessingJob value,
          $Res Function(BackgroundProcessingJob) then) =
      _$BackgroundProcessingJobCopyWithImpl<$Res, BackgroundProcessingJob>;
  @useResult
  $Res call(
      {String id,
      String filePath,
      ProcessingState state,
      int retries,
      DateTime createdAt,
      String? uploadedFileId,
      String? ocrResultId,
      String? aiExtractionResultId,
      String? receiptId,
      String? errorMessage});
}

/// @nodoc
class _$BackgroundProcessingJobCopyWithImpl<$Res,
        $Val extends BackgroundProcessingJob>
    implements $BackgroundProcessingJobCopyWith<$Res> {
  _$BackgroundProcessingJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BackgroundProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filePath = null,
    Object? state = null,
    Object? retries = null,
    Object? createdAt = null,
    Object? uploadedFileId = freezed,
    Object? ocrResultId = freezed,
    Object? aiExtractionResultId = freezed,
    Object? receiptId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ProcessingState,
      retries: null == retries
          ? _value.retries
          : retries // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadedFileId: freezed == uploadedFileId
          ? _value.uploadedFileId
          : uploadedFileId // ignore: cast_nullable_to_non_nullable
              as String?,
      ocrResultId: freezed == ocrResultId
          ? _value.ocrResultId
          : ocrResultId // ignore: cast_nullable_to_non_nullable
              as String?,
      aiExtractionResultId: freezed == aiExtractionResultId
          ? _value.aiExtractionResultId
          : aiExtractionResultId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptId: freezed == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BackgroundProcessingJobImplCopyWith<$Res>
    implements $BackgroundProcessingJobCopyWith<$Res> {
  factory _$$BackgroundProcessingJobImplCopyWith(
          _$BackgroundProcessingJobImpl value,
          $Res Function(_$BackgroundProcessingJobImpl) then) =
      __$$BackgroundProcessingJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String filePath,
      ProcessingState state,
      int retries,
      DateTime createdAt,
      String? uploadedFileId,
      String? ocrResultId,
      String? aiExtractionResultId,
      String? receiptId,
      String? errorMessage});
}

/// @nodoc
class __$$BackgroundProcessingJobImplCopyWithImpl<$Res>
    extends _$BackgroundProcessingJobCopyWithImpl<$Res,
        _$BackgroundProcessingJobImpl>
    implements _$$BackgroundProcessingJobImplCopyWith<$Res> {
  __$$BackgroundProcessingJobImplCopyWithImpl(
      _$BackgroundProcessingJobImpl _value,
      $Res Function(_$BackgroundProcessingJobImpl) _then)
      : super(_value, _then);

  /// Create a copy of BackgroundProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? filePath = null,
    Object? state = null,
    Object? retries = null,
    Object? createdAt = null,
    Object? uploadedFileId = freezed,
    Object? ocrResultId = freezed,
    Object? aiExtractionResultId = freezed,
    Object? receiptId = freezed,
    Object? errorMessage = freezed,
  }) {
    return _then(_$BackgroundProcessingJobImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as ProcessingState,
      retries: null == retries
          ? _value.retries
          : retries // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      uploadedFileId: freezed == uploadedFileId
          ? _value.uploadedFileId
          : uploadedFileId // ignore: cast_nullable_to_non_nullable
              as String?,
      ocrResultId: freezed == ocrResultId
          ? _value.ocrResultId
          : ocrResultId // ignore: cast_nullable_to_non_nullable
              as String?,
      aiExtractionResultId: freezed == aiExtractionResultId
          ? _value.aiExtractionResultId
          : aiExtractionResultId // ignore: cast_nullable_to_non_nullable
              as String?,
      receiptId: freezed == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BackgroundProcessingJobImpl implements _BackgroundProcessingJob {
  const _$BackgroundProcessingJobImpl(
      {required this.id,
      required this.filePath,
      required this.state,
      this.retries = 0,
      required this.createdAt,
      this.uploadedFileId,
      this.ocrResultId,
      this.aiExtractionResultId,
      this.receiptId,
      this.errorMessage});

  factory _$BackgroundProcessingJobImpl.fromJson(Map<String, dynamic> json) =>
      _$$BackgroundProcessingJobImplFromJson(json);

  @override
  final String id;
  @override
  final String filePath;
  @override
  final ProcessingState state;
  @override
  @JsonKey()
  final int retries;
  @override
  final DateTime createdAt;
  @override
  final String? uploadedFileId;
  @override
  final String? ocrResultId;
  @override
  final String? aiExtractionResultId;
  @override
  final String? receiptId;
  @override
  final String? errorMessage;

  @override
  String toString() {
    return 'BackgroundProcessingJob(id: $id, filePath: $filePath, state: $state, retries: $retries, createdAt: $createdAt, uploadedFileId: $uploadedFileId, ocrResultId: $ocrResultId, aiExtractionResultId: $aiExtractionResultId, receiptId: $receiptId, errorMessage: $errorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BackgroundProcessingJobImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.retries, retries) || other.retries == retries) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.uploadedFileId, uploadedFileId) ||
                other.uploadedFileId == uploadedFileId) &&
            (identical(other.ocrResultId, ocrResultId) ||
                other.ocrResultId == ocrResultId) &&
            (identical(other.aiExtractionResultId, aiExtractionResultId) ||
                other.aiExtractionResultId == aiExtractionResultId) &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      filePath,
      state,
      retries,
      createdAt,
      uploadedFileId,
      ocrResultId,
      aiExtractionResultId,
      receiptId,
      errorMessage);

  /// Create a copy of BackgroundProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BackgroundProcessingJobImplCopyWith<_$BackgroundProcessingJobImpl>
      get copyWith => __$$BackgroundProcessingJobImplCopyWithImpl<
          _$BackgroundProcessingJobImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BackgroundProcessingJobImplToJson(
      this,
    );
  }
}

abstract class _BackgroundProcessingJob implements BackgroundProcessingJob {
  const factory _BackgroundProcessingJob(
      {required final String id,
      required final String filePath,
      required final ProcessingState state,
      final int retries,
      required final DateTime createdAt,
      final String? uploadedFileId,
      final String? ocrResultId,
      final String? aiExtractionResultId,
      final String? receiptId,
      final String? errorMessage}) = _$BackgroundProcessingJobImpl;

  factory _BackgroundProcessingJob.fromJson(Map<String, dynamic> json) =
      _$BackgroundProcessingJobImpl.fromJson;

  @override
  String get id;
  @override
  String get filePath;
  @override
  ProcessingState get state;
  @override
  int get retries;
  @override
  DateTime get createdAt;
  @override
  String? get uploadedFileId;
  @override
  String? get ocrResultId;
  @override
  String? get aiExtractionResultId;
  @override
  String? get receiptId;
  @override
  String? get errorMessage;

  /// Create a copy of BackgroundProcessingJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BackgroundProcessingJobImplCopyWith<_$BackgroundProcessingJobImpl>
      get copyWith => throw _privateConstructorUsedError;
}

AppNotification _$AppNotificationFromJson(Map<String, dynamic> json) {
  return _AppNotification.fromJson(json);
}

/// @nodoc
mixin _$AppNotification {
  String get id => throw _privateConstructorUsedError;
  NotificationType get type => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get body => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  Map<String, dynamic>? get payload => throw _privateConstructorUsedError;

  /// Serializes this AppNotification to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AppNotificationCopyWith<AppNotification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AppNotificationCopyWith<$Res> {
  factory $AppNotificationCopyWith(
          AppNotification value, $Res Function(AppNotification) then) =
      _$AppNotificationCopyWithImpl<$Res, AppNotification>;
  @useResult
  $Res call(
      {String id,
      NotificationType type,
      String title,
      String body,
      DateTime timestamp,
      bool isRead,
      Map<String, dynamic>? payload});
}

/// @nodoc
class _$AppNotificationCopyWithImpl<$Res, $Val extends AppNotification>
    implements $AppNotificationCopyWith<$Res> {
  _$AppNotificationCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? timestamp = null,
    Object? isRead = null,
    Object? payload = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      payload: freezed == payload
          ? _value.payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AppNotificationImplCopyWith<$Res>
    implements $AppNotificationCopyWith<$Res> {
  factory _$$AppNotificationImplCopyWith(_$AppNotificationImpl value,
          $Res Function(_$AppNotificationImpl) then) =
      __$$AppNotificationImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      NotificationType type,
      String title,
      String body,
      DateTime timestamp,
      bool isRead,
      Map<String, dynamic>? payload});
}

/// @nodoc
class __$$AppNotificationImplCopyWithImpl<$Res>
    extends _$AppNotificationCopyWithImpl<$Res, _$AppNotificationImpl>
    implements _$$AppNotificationImplCopyWith<$Res> {
  __$$AppNotificationImplCopyWithImpl(
      _$AppNotificationImpl _value, $Res Function(_$AppNotificationImpl) _then)
      : super(_value, _then);

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? title = null,
    Object? body = null,
    Object? timestamp = null,
    Object? isRead = null,
    Object? payload = freezed,
  }) {
    return _then(_$AppNotificationImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as NotificationType,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      body: null == body
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      payload: freezed == payload
          ? _value._payload
          : payload // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AppNotificationImpl implements _AppNotification {
  const _$AppNotificationImpl(
      {required this.id,
      required this.type,
      required this.title,
      required this.body,
      required this.timestamp,
      this.isRead = false,
      final Map<String, dynamic>? payload})
      : _payload = payload;

  factory _$AppNotificationImpl.fromJson(Map<String, dynamic> json) =>
      _$$AppNotificationImplFromJson(json);

  @override
  final String id;
  @override
  final NotificationType type;
  @override
  final String title;
  @override
  final String body;
  @override
  final DateTime timestamp;
  @override
  @JsonKey()
  final bool isRead;
  final Map<String, dynamic>? _payload;
  @override
  Map<String, dynamic>? get payload {
    final value = _payload;
    if (value == null) return null;
    if (_payload is EqualUnmodifiableMapView) return _payload;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  String toString() {
    return 'AppNotification(id: $id, type: $type, title: $title, body: $body, timestamp: $timestamp, isRead: $isRead, payload: $payload)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AppNotificationImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.body, body) || other.body == body) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            const DeepCollectionEquality().equals(other._payload, _payload));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, type, title, body, timestamp,
      isRead, const DeepCollectionEquality().hash(_payload));

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      __$$AppNotificationImplCopyWithImpl<_$AppNotificationImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AppNotificationImplToJson(
      this,
    );
  }
}

abstract class _AppNotification implements AppNotification {
  const factory _AppNotification(
      {required final String id,
      required final NotificationType type,
      required final String title,
      required final String body,
      required final DateTime timestamp,
      final bool isRead,
      final Map<String, dynamic>? payload}) = _$AppNotificationImpl;

  factory _AppNotification.fromJson(Map<String, dynamic> json) =
      _$AppNotificationImpl.fromJson;

  @override
  String get id;
  @override
  NotificationType get type;
  @override
  String get title;
  @override
  String get body;
  @override
  DateTime get timestamp;
  @override
  bool get isRead;
  @override
  Map<String, dynamic>? get payload;

  /// Create a copy of AppNotification
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AppNotificationImplCopyWith<_$AppNotificationImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

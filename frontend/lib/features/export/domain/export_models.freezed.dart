// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'export_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ExportJob {
  ExportJobStatus get status => throw _privateConstructorUsedError;
  String? get generatedFilePath => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  double? get progress => throw _privateConstructorUsedError;

  /// Create a copy of ExportJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExportJobCopyWith<ExportJob> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportJobCopyWith<$Res> {
  factory $ExportJobCopyWith(ExportJob value, $Res Function(ExportJob) then) =
      _$ExportJobCopyWithImpl<$Res, ExportJob>;
  @useResult
  $Res call(
      {ExportJobStatus status,
      String? generatedFilePath,
      String? errorMessage,
      double? progress});
}

/// @nodoc
class _$ExportJobCopyWithImpl<$Res, $Val extends ExportJob>
    implements $ExportJobCopyWith<$Res> {
  _$ExportJobCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExportJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? generatedFilePath = freezed,
    Object? errorMessage = freezed,
    Object? progress = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExportJobStatus,
      generatedFilePath: freezed == generatedFilePath
          ? _value.generatedFilePath
          : generatedFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExportJobImplCopyWith<$Res>
    implements $ExportJobCopyWith<$Res> {
  factory _$$ExportJobImplCopyWith(
          _$ExportJobImpl value, $Res Function(_$ExportJobImpl) then) =
      __$$ExportJobImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ExportJobStatus status,
      String? generatedFilePath,
      String? errorMessage,
      double? progress});
}

/// @nodoc
class __$$ExportJobImplCopyWithImpl<$Res>
    extends _$ExportJobCopyWithImpl<$Res, _$ExportJobImpl>
    implements _$$ExportJobImplCopyWith<$Res> {
  __$$ExportJobImplCopyWithImpl(
      _$ExportJobImpl _value, $Res Function(_$ExportJobImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExportJob
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? generatedFilePath = freezed,
    Object? errorMessage = freezed,
    Object? progress = freezed,
  }) {
    return _then(_$ExportJobImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ExportJobStatus,
      generatedFilePath: freezed == generatedFilePath
          ? _value.generatedFilePath
          : generatedFilePath // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      progress: freezed == progress
          ? _value.progress
          : progress // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc

class _$ExportJobImpl implements _ExportJob {
  const _$ExportJobImpl(
      {this.status = ExportJobStatus.idle,
      this.generatedFilePath,
      this.errorMessage,
      this.progress});

  @override
  @JsonKey()
  final ExportJobStatus status;
  @override
  final String? generatedFilePath;
  @override
  final String? errorMessage;
  @override
  final double? progress;

  @override
  String toString() {
    return 'ExportJob(status: $status, generatedFilePath: $generatedFilePath, errorMessage: $errorMessage, progress: $progress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportJobImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.generatedFilePath, generatedFilePath) ||
                other.generatedFilePath == generatedFilePath) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.progress, progress) ||
                other.progress == progress));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, generatedFilePath, errorMessage, progress);

  /// Create a copy of ExportJob
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportJobImplCopyWith<_$ExportJobImpl> get copyWith =>
      __$$ExportJobImplCopyWithImpl<_$ExportJobImpl>(this, _$identity);
}

abstract class _ExportJob implements ExportJob {
  const factory _ExportJob(
      {final ExportJobStatus status,
      final String? generatedFilePath,
      final String? errorMessage,
      final double? progress}) = _$ExportJobImpl;

  @override
  ExportJobStatus get status;
  @override
  String? get generatedFilePath;
  @override
  String? get errorMessage;
  @override
  double? get progress;

  /// Create a copy of ExportJob
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportJobImplCopyWith<_$ExportJobImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ExportRequest {
  ExportFormat get format => throw _privateConstructorUsedError;
  ReportPeriod get period => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  bool get includeSummary => throw _privateConstructorUsedError;
  bool get includeReceipts => throw _privateConstructorUsedError;
  bool get includeCategories => throw _privateConstructorUsedError;
  bool get includeStores => throw _privateConstructorUsedError;
  bool get includeHousehold => throw _privateConstructorUsedError;

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExportRequestCopyWith<ExportRequest> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportRequestCopyWith<$Res> {
  factory $ExportRequestCopyWith(
          ExportRequest value, $Res Function(ExportRequest) then) =
      _$ExportRequestCopyWithImpl<$Res, ExportRequest>;
  @useResult
  $Res call(
      {ExportFormat format,
      ReportPeriod period,
      DateTime? startDate,
      DateTime? endDate,
      bool includeSummary,
      bool includeReceipts,
      bool includeCategories,
      bool includeStores,
      bool includeHousehold});
}

/// @nodoc
class _$ExportRequestCopyWithImpl<$Res, $Val extends ExportRequest>
    implements $ExportRequestCopyWith<$Res> {
  _$ExportRequestCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? period = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? includeSummary = null,
    Object? includeReceipts = null,
    Object? includeCategories = null,
    Object? includeStores = null,
    Object? includeHousehold = null,
  }) {
    return _then(_value.copyWith(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ExportFormat,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as ReportPeriod,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      includeSummary: null == includeSummary
          ? _value.includeSummary
          : includeSummary // ignore: cast_nullable_to_non_nullable
              as bool,
      includeReceipts: null == includeReceipts
          ? _value.includeReceipts
          : includeReceipts // ignore: cast_nullable_to_non_nullable
              as bool,
      includeCategories: null == includeCategories
          ? _value.includeCategories
          : includeCategories // ignore: cast_nullable_to_non_nullable
              as bool,
      includeStores: null == includeStores
          ? _value.includeStores
          : includeStores // ignore: cast_nullable_to_non_nullable
              as bool,
      includeHousehold: null == includeHousehold
          ? _value.includeHousehold
          : includeHousehold // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExportRequestImplCopyWith<$Res>
    implements $ExportRequestCopyWith<$Res> {
  factory _$$ExportRequestImplCopyWith(
          _$ExportRequestImpl value, $Res Function(_$ExportRequestImpl) then) =
      __$$ExportRequestImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ExportFormat format,
      ReportPeriod period,
      DateTime? startDate,
      DateTime? endDate,
      bool includeSummary,
      bool includeReceipts,
      bool includeCategories,
      bool includeStores,
      bool includeHousehold});
}

/// @nodoc
class __$$ExportRequestImplCopyWithImpl<$Res>
    extends _$ExportRequestCopyWithImpl<$Res, _$ExportRequestImpl>
    implements _$$ExportRequestImplCopyWith<$Res> {
  __$$ExportRequestImplCopyWithImpl(
      _$ExportRequestImpl _value, $Res Function(_$ExportRequestImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? format = null,
    Object? period = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? includeSummary = null,
    Object? includeReceipts = null,
    Object? includeCategories = null,
    Object? includeStores = null,
    Object? includeHousehold = null,
  }) {
    return _then(_$ExportRequestImpl(
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ExportFormat,
      period: null == period
          ? _value.period
          : period // ignore: cast_nullable_to_non_nullable
              as ReportPeriod,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      includeSummary: null == includeSummary
          ? _value.includeSummary
          : includeSummary // ignore: cast_nullable_to_non_nullable
              as bool,
      includeReceipts: null == includeReceipts
          ? _value.includeReceipts
          : includeReceipts // ignore: cast_nullable_to_non_nullable
              as bool,
      includeCategories: null == includeCategories
          ? _value.includeCategories
          : includeCategories // ignore: cast_nullable_to_non_nullable
              as bool,
      includeStores: null == includeStores
          ? _value.includeStores
          : includeStores // ignore: cast_nullable_to_non_nullable
              as bool,
      includeHousehold: null == includeHousehold
          ? _value.includeHousehold
          : includeHousehold // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$ExportRequestImpl implements _ExportRequest {
  const _$ExportRequestImpl(
      {this.format = ExportFormat.pdf,
      this.period = ReportPeriod.thisMonth,
      this.startDate,
      this.endDate,
      this.includeSummary = true,
      this.includeReceipts = true,
      this.includeCategories = true,
      this.includeStores = true,
      this.includeHousehold = false});

  @override
  @JsonKey()
  final ExportFormat format;
  @override
  @JsonKey()
  final ReportPeriod period;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  @JsonKey()
  final bool includeSummary;
  @override
  @JsonKey()
  final bool includeReceipts;
  @override
  @JsonKey()
  final bool includeCategories;
  @override
  @JsonKey()
  final bool includeStores;
  @override
  @JsonKey()
  final bool includeHousehold;

  @override
  String toString() {
    return 'ExportRequest(format: $format, period: $period, startDate: $startDate, endDate: $endDate, includeSummary: $includeSummary, includeReceipts: $includeReceipts, includeCategories: $includeCategories, includeStores: $includeStores, includeHousehold: $includeHousehold)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportRequestImpl &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.period, period) || other.period == period) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.includeSummary, includeSummary) ||
                other.includeSummary == includeSummary) &&
            (identical(other.includeReceipts, includeReceipts) ||
                other.includeReceipts == includeReceipts) &&
            (identical(other.includeCategories, includeCategories) ||
                other.includeCategories == includeCategories) &&
            (identical(other.includeStores, includeStores) ||
                other.includeStores == includeStores) &&
            (identical(other.includeHousehold, includeHousehold) ||
                other.includeHousehold == includeHousehold));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      format,
      period,
      startDate,
      endDate,
      includeSummary,
      includeReceipts,
      includeCategories,
      includeStores,
      includeHousehold);

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportRequestImplCopyWith<_$ExportRequestImpl> get copyWith =>
      __$$ExportRequestImplCopyWithImpl<_$ExportRequestImpl>(this, _$identity);
}

abstract class _ExportRequest implements ExportRequest {
  const factory _ExportRequest(
      {final ExportFormat format,
      final ReportPeriod period,
      final DateTime? startDate,
      final DateTime? endDate,
      final bool includeSummary,
      final bool includeReceipts,
      final bool includeCategories,
      final bool includeStores,
      final bool includeHousehold}) = _$ExportRequestImpl;

  @override
  ExportFormat get format;
  @override
  ReportPeriod get period;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  bool get includeSummary;
  @override
  bool get includeReceipts;
  @override
  bool get includeCategories;
  @override
  bool get includeStores;
  @override
  bool get includeHousehold;

  /// Create a copy of ExportRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportRequestImplCopyWith<_$ExportRequestImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExportHistoryItem _$ExportHistoryItemFromJson(Map<String, dynamic> json) {
  return _ExportHistoryItem.fromJson(json);
}

/// @nodoc
mixin _$ExportHistoryItem {
  String get id => throw _privateConstructorUsedError;
  ExportFormat get format => throw _privateConstructorUsedError;
  DateTime get date => throw _privateConstructorUsedError;
  String get periodDescription => throw _privateConstructorUsedError;
  String get fileName => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;

  /// Serializes this ExportHistoryItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExportHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExportHistoryItemCopyWith<ExportHistoryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExportHistoryItemCopyWith<$Res> {
  factory $ExportHistoryItemCopyWith(
          ExportHistoryItem value, $Res Function(ExportHistoryItem) then) =
      _$ExportHistoryItemCopyWithImpl<$Res, ExportHistoryItem>;
  @useResult
  $Res call(
      {String id,
      ExportFormat format,
      DateTime date,
      String periodDescription,
      String fileName,
      String filePath});
}

/// @nodoc
class _$ExportHistoryItemCopyWithImpl<$Res, $Val extends ExportHistoryItem>
    implements $ExportHistoryItemCopyWith<$Res> {
  _$ExportHistoryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExportHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? format = null,
    Object? date = null,
    Object? periodDescription = null,
    Object? fileName = null,
    Object? filePath = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ExportFormat,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodDescription: null == periodDescription
          ? _value.periodDescription
          : periodDescription // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExportHistoryItemImplCopyWith<$Res>
    implements $ExportHistoryItemCopyWith<$Res> {
  factory _$$ExportHistoryItemImplCopyWith(_$ExportHistoryItemImpl value,
          $Res Function(_$ExportHistoryItemImpl) then) =
      __$$ExportHistoryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      ExportFormat format,
      DateTime date,
      String periodDescription,
      String fileName,
      String filePath});
}

/// @nodoc
class __$$ExportHistoryItemImplCopyWithImpl<$Res>
    extends _$ExportHistoryItemCopyWithImpl<$Res, _$ExportHistoryItemImpl>
    implements _$$ExportHistoryItemImplCopyWith<$Res> {
  __$$ExportHistoryItemImplCopyWithImpl(_$ExportHistoryItemImpl _value,
      $Res Function(_$ExportHistoryItemImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExportHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? format = null,
    Object? date = null,
    Object? periodDescription = null,
    Object? fileName = null,
    Object? filePath = null,
  }) {
    return _then(_$ExportHistoryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      format: null == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as ExportFormat,
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      periodDescription: null == periodDescription
          ? _value.periodDescription
          : periodDescription // ignore: cast_nullable_to_non_nullable
              as String,
      fileName: null == fileName
          ? _value.fileName
          : fileName // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExportHistoryItemImpl implements _ExportHistoryItem {
  const _$ExportHistoryItemImpl(
      {required this.id,
      required this.format,
      required this.date,
      required this.periodDescription,
      required this.fileName,
      required this.filePath});

  factory _$ExportHistoryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExportHistoryItemImplFromJson(json);

  @override
  final String id;
  @override
  final ExportFormat format;
  @override
  final DateTime date;
  @override
  final String periodDescription;
  @override
  final String fileName;
  @override
  final String filePath;

  @override
  String toString() {
    return 'ExportHistoryItem(id: $id, format: $format, date: $date, periodDescription: $periodDescription, fileName: $fileName, filePath: $filePath)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExportHistoryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.periodDescription, periodDescription) ||
                other.periodDescription == periodDescription) &&
            (identical(other.fileName, fileName) ||
                other.fileName == fileName) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, format, date, periodDescription, fileName, filePath);

  /// Create a copy of ExportHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExportHistoryItemImplCopyWith<_$ExportHistoryItemImpl> get copyWith =>
      __$$ExportHistoryItemImplCopyWithImpl<_$ExportHistoryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExportHistoryItemImplToJson(
      this,
    );
  }
}

abstract class _ExportHistoryItem implements ExportHistoryItem {
  const factory _ExportHistoryItem(
      {required final String id,
      required final ExportFormat format,
      required final DateTime date,
      required final String periodDescription,
      required final String fileName,
      required final String filePath}) = _$ExportHistoryItemImpl;

  factory _ExportHistoryItem.fromJson(Map<String, dynamic> json) =
      _$ExportHistoryItemImpl.fromJson;

  @override
  String get id;
  @override
  ExportFormat get format;
  @override
  DateTime get date;
  @override
  String get periodDescription;
  @override
  String get fileName;
  @override
  String get filePath;

  /// Create a copy of ExportHistoryItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExportHistoryItemImplCopyWith<_$ExportHistoryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

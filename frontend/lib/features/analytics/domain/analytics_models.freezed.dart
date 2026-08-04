// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'analytics_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatusCounts _$StatusCountsFromJson(Map<String, dynamic> json) {
  return _StatusCounts.fromJson(json);
}

/// @nodoc
mixin _$StatusCounts {
  int get draft => throw _privateConstructorUsedError;
  @JsonKey(name: 'review_required')
  int get reviewRequired => throw _privateConstructorUsedError;
  int get confirmed => throw _privateConstructorUsedError;
  int get failed => throw _privateConstructorUsedError;

  /// Serializes this StatusCounts to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatusCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatusCountsCopyWith<StatusCounts> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatusCountsCopyWith<$Res> {
  factory $StatusCountsCopyWith(
          StatusCounts value, $Res Function(StatusCounts) then) =
      _$StatusCountsCopyWithImpl<$Res, StatusCounts>;
  @useResult
  $Res call(
      {int draft,
      @JsonKey(name: 'review_required') int reviewRequired,
      int confirmed,
      int failed});
}

/// @nodoc
class _$StatusCountsCopyWithImpl<$Res, $Val extends StatusCounts>
    implements $StatusCountsCopyWith<$Res> {
  _$StatusCountsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatusCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft = null,
    Object? reviewRequired = null,
    Object? confirmed = null,
    Object? failed = null,
  }) {
    return _then(_value.copyWith(
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as int,
      reviewRequired: null == reviewRequired
          ? _value.reviewRequired
          : reviewRequired // ignore: cast_nullable_to_non_nullable
              as int,
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as int,
      failed: null == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatusCountsImplCopyWith<$Res>
    implements $StatusCountsCopyWith<$Res> {
  factory _$$StatusCountsImplCopyWith(
          _$StatusCountsImpl value, $Res Function(_$StatusCountsImpl) then) =
      __$$StatusCountsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int draft,
      @JsonKey(name: 'review_required') int reviewRequired,
      int confirmed,
      int failed});
}

/// @nodoc
class __$$StatusCountsImplCopyWithImpl<$Res>
    extends _$StatusCountsCopyWithImpl<$Res, _$StatusCountsImpl>
    implements _$$StatusCountsImplCopyWith<$Res> {
  __$$StatusCountsImplCopyWithImpl(
      _$StatusCountsImpl _value, $Res Function(_$StatusCountsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatusCounts
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? draft = null,
    Object? reviewRequired = null,
    Object? confirmed = null,
    Object? failed = null,
  }) {
    return _then(_$StatusCountsImpl(
      draft: null == draft
          ? _value.draft
          : draft // ignore: cast_nullable_to_non_nullable
              as int,
      reviewRequired: null == reviewRequired
          ? _value.reviewRequired
          : reviewRequired // ignore: cast_nullable_to_non_nullable
              as int,
      confirmed: null == confirmed
          ? _value.confirmed
          : confirmed // ignore: cast_nullable_to_non_nullable
              as int,
      failed: null == failed
          ? _value.failed
          : failed // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatusCountsImpl implements _StatusCounts {
  const _$StatusCountsImpl(
      {this.draft = 0,
      @JsonKey(name: 'review_required') this.reviewRequired = 0,
      this.confirmed = 0,
      this.failed = 0});

  factory _$StatusCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusCountsImplFromJson(json);

  @override
  @JsonKey()
  final int draft;
  @override
  @JsonKey(name: 'review_required')
  final int reviewRequired;
  @override
  @JsonKey()
  final int confirmed;
  @override
  @JsonKey()
  final int failed;

  @override
  String toString() {
    return 'StatusCounts(draft: $draft, reviewRequired: $reviewRequired, confirmed: $confirmed, failed: $failed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatusCountsImpl &&
            (identical(other.draft, draft) || other.draft == draft) &&
            (identical(other.reviewRequired, reviewRequired) ||
                other.reviewRequired == reviewRequired) &&
            (identical(other.confirmed, confirmed) ||
                other.confirmed == confirmed) &&
            (identical(other.failed, failed) || other.failed == failed));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, draft, reviewRequired, confirmed, failed);

  /// Create a copy of StatusCounts
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatusCountsImplCopyWith<_$StatusCountsImpl> get copyWith =>
      __$$StatusCountsImplCopyWithImpl<_$StatusCountsImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatusCountsImplToJson(
      this,
    );
  }
}

abstract class _StatusCounts implements StatusCounts {
  const factory _StatusCounts(
      {final int draft,
      @JsonKey(name: 'review_required') final int reviewRequired,
      final int confirmed,
      final int failed}) = _$StatusCountsImpl;

  factory _StatusCounts.fromJson(Map<String, dynamic> json) =
      _$StatusCountsImpl.fromJson;

  @override
  int get draft;
  @override
  @JsonKey(name: 'review_required')
  int get reviewRequired;
  @override
  int get confirmed;
  @override
  int get failed;

  /// Create a copy of StatusCounts
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatusCountsImplCopyWith<_$StatusCountsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DashboardMetrics _$DashboardMetricsFromJson(Map<String, dynamic> json) {
  return _DashboardMetrics.fromJson(json);
}

/// @nodoc
mixin _$DashboardMetrics {
  @JsonKey(name: 'total_receipts')
  int get totalReceipts => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spend')
  double get totalSpend => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_receipt')
  double get averageReceipt => throw _privateConstructorUsedError;
  @JsonKey(name: 'largest_receipt')
  double get largestReceipt => throw _privateConstructorUsedError;
  @JsonKey(name: 'smallest_receipt')
  double get smallestReceipt => throw _privateConstructorUsedError;
  @JsonKey(name: 'status_counts')
  StatusCounts get statusCounts => throw _privateConstructorUsedError;

  /// Serializes this DashboardMetrics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardMetricsCopyWith<DashboardMetrics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardMetricsCopyWith<$Res> {
  factory $DashboardMetricsCopyWith(
          DashboardMetrics value, $Res Function(DashboardMetrics) then) =
      _$DashboardMetricsCopyWithImpl<$Res, DashboardMetrics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'total_receipts') int totalReceipts,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'average_receipt') double averageReceipt,
      @JsonKey(name: 'largest_receipt') double largestReceipt,
      @JsonKey(name: 'smallest_receipt') double smallestReceipt,
      @JsonKey(name: 'status_counts') StatusCounts statusCounts});

  $StatusCountsCopyWith<$Res> get statusCounts;
}

/// @nodoc
class _$DashboardMetricsCopyWithImpl<$Res, $Val extends DashboardMetrics>
    implements $DashboardMetricsCopyWith<$Res> {
  _$DashboardMetricsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReceipts = null,
    Object? totalSpend = null,
    Object? averageReceipt = null,
    Object? largestReceipt = null,
    Object? smallestReceipt = null,
    Object? statusCounts = null,
  }) {
    return _then(_value.copyWith(
      totalReceipts: null == totalReceipts
          ? _value.totalReceipts
          : totalReceipts // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      averageReceipt: null == averageReceipt
          ? _value.averageReceipt
          : averageReceipt // ignore: cast_nullable_to_non_nullable
              as double,
      largestReceipt: null == largestReceipt
          ? _value.largestReceipt
          : largestReceipt // ignore: cast_nullable_to_non_nullable
              as double,
      smallestReceipt: null == smallestReceipt
          ? _value.smallestReceipt
          : smallestReceipt // ignore: cast_nullable_to_non_nullable
              as double,
      statusCounts: null == statusCounts
          ? _value.statusCounts
          : statusCounts // ignore: cast_nullable_to_non_nullable
              as StatusCounts,
    ) as $Val);
  }

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $StatusCountsCopyWith<$Res> get statusCounts {
    return $StatusCountsCopyWith<$Res>(_value.statusCounts, (value) {
      return _then(_value.copyWith(statusCounts: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DashboardMetricsImplCopyWith<$Res>
    implements $DashboardMetricsCopyWith<$Res> {
  factory _$$DashboardMetricsImplCopyWith(_$DashboardMetricsImpl value,
          $Res Function(_$DashboardMetricsImpl) then) =
      __$$DashboardMetricsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'total_receipts') int totalReceipts,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'average_receipt') double averageReceipt,
      @JsonKey(name: 'largest_receipt') double largestReceipt,
      @JsonKey(name: 'smallest_receipt') double smallestReceipt,
      @JsonKey(name: 'status_counts') StatusCounts statusCounts});

  @override
  $StatusCountsCopyWith<$Res> get statusCounts;
}

/// @nodoc
class __$$DashboardMetricsImplCopyWithImpl<$Res>
    extends _$DashboardMetricsCopyWithImpl<$Res, _$DashboardMetricsImpl>
    implements _$$DashboardMetricsImplCopyWith<$Res> {
  __$$DashboardMetricsImplCopyWithImpl(_$DashboardMetricsImpl _value,
      $Res Function(_$DashboardMetricsImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? totalReceipts = null,
    Object? totalSpend = null,
    Object? averageReceipt = null,
    Object? largestReceipt = null,
    Object? smallestReceipt = null,
    Object? statusCounts = null,
  }) {
    return _then(_$DashboardMetricsImpl(
      totalReceipts: null == totalReceipts
          ? _value.totalReceipts
          : totalReceipts // ignore: cast_nullable_to_non_nullable
              as int,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      averageReceipt: null == averageReceipt
          ? _value.averageReceipt
          : averageReceipt // ignore: cast_nullable_to_non_nullable
              as double,
      largestReceipt: null == largestReceipt
          ? _value.largestReceipt
          : largestReceipt // ignore: cast_nullable_to_non_nullable
              as double,
      smallestReceipt: null == smallestReceipt
          ? _value.smallestReceipt
          : smallestReceipt // ignore: cast_nullable_to_non_nullable
              as double,
      statusCounts: null == statusCounts
          ? _value.statusCounts
          : statusCounts // ignore: cast_nullable_to_non_nullable
              as StatusCounts,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardMetricsImpl implements _DashboardMetrics {
  const _$DashboardMetricsImpl(
      {@JsonKey(name: 'total_receipts') required this.totalReceipts,
      @JsonKey(name: 'total_spend') required this.totalSpend,
      @JsonKey(name: 'average_receipt') required this.averageReceipt,
      @JsonKey(name: 'largest_receipt') required this.largestReceipt,
      @JsonKey(name: 'smallest_receipt') required this.smallestReceipt,
      @JsonKey(name: 'status_counts') required this.statusCounts});

  factory _$DashboardMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardMetricsImplFromJson(json);

  @override
  @JsonKey(name: 'total_receipts')
  final int totalReceipts;
  @override
  @JsonKey(name: 'total_spend')
  final double totalSpend;
  @override
  @JsonKey(name: 'average_receipt')
  final double averageReceipt;
  @override
  @JsonKey(name: 'largest_receipt')
  final double largestReceipt;
  @override
  @JsonKey(name: 'smallest_receipt')
  final double smallestReceipt;
  @override
  @JsonKey(name: 'status_counts')
  final StatusCounts statusCounts;

  @override
  String toString() {
    return 'DashboardMetrics(totalReceipts: $totalReceipts, totalSpend: $totalSpend, averageReceipt: $averageReceipt, largestReceipt: $largestReceipt, smallestReceipt: $smallestReceipt, statusCounts: $statusCounts)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardMetricsImpl &&
            (identical(other.totalReceipts, totalReceipts) ||
                other.totalReceipts == totalReceipts) &&
            (identical(other.totalSpend, totalSpend) ||
                other.totalSpend == totalSpend) &&
            (identical(other.averageReceipt, averageReceipt) ||
                other.averageReceipt == averageReceipt) &&
            (identical(other.largestReceipt, largestReceipt) ||
                other.largestReceipt == largestReceipt) &&
            (identical(other.smallestReceipt, smallestReceipt) ||
                other.smallestReceipt == smallestReceipt) &&
            (identical(other.statusCounts, statusCounts) ||
                other.statusCounts == statusCounts));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, totalReceipts, totalSpend,
      averageReceipt, largestReceipt, smallestReceipt, statusCounts);

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardMetricsImplCopyWith<_$DashboardMetricsImpl> get copyWith =>
      __$$DashboardMetricsImplCopyWithImpl<_$DashboardMetricsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardMetricsImplToJson(
      this,
    );
  }
}

abstract class _DashboardMetrics implements DashboardMetrics {
  const factory _DashboardMetrics(
      {@JsonKey(name: 'total_receipts') required final int totalReceipts,
      @JsonKey(name: 'total_spend') required final double totalSpend,
      @JsonKey(name: 'average_receipt') required final double averageReceipt,
      @JsonKey(name: 'largest_receipt') required final double largestReceipt,
      @JsonKey(name: 'smallest_receipt') required final double smallestReceipt,
      @JsonKey(name: 'status_counts')
      required final StatusCounts statusCounts}) = _$DashboardMetricsImpl;

  factory _DashboardMetrics.fromJson(Map<String, dynamic> json) =
      _$DashboardMetricsImpl.fromJson;

  @override
  @JsonKey(name: 'total_receipts')
  int get totalReceipts;
  @override
  @JsonKey(name: 'total_spend')
  double get totalSpend;
  @override
  @JsonKey(name: 'average_receipt')
  double get averageReceipt;
  @override
  @JsonKey(name: 'largest_receipt')
  double get largestReceipt;
  @override
  @JsonKey(name: 'smallest_receipt')
  double get smallestReceipt;
  @override
  @JsonKey(name: 'status_counts')
  StatusCounts get statusCounts;

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardMetricsImplCopyWith<_$DashboardMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MonthlySpend _$MonthlySpendFromJson(Map<String, dynamic> json) {
  return _MonthlySpend.fromJson(json);
}

/// @nodoc
mixin _$MonthlySpend {
  String get month => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spend')
  double get totalSpend => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_count')
  int get receiptCount => throw _privateConstructorUsedError;

  /// Serializes this MonthlySpend to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthlySpendCopyWith<MonthlySpend> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthlySpendCopyWith<$Res> {
  factory $MonthlySpendCopyWith(
          MonthlySpend value, $Res Function(MonthlySpend) then) =
      _$MonthlySpendCopyWithImpl<$Res, MonthlySpend>;
  @useResult
  $Res call(
      {String month,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'receipt_count') int receiptCount});
}

/// @nodoc
class _$MonthlySpendCopyWithImpl<$Res, $Val extends MonthlySpend>
    implements $MonthlySpendCopyWith<$Res> {
  _$MonthlySpendCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? totalSpend = null,
    Object? receiptCount = null,
  }) {
    return _then(_value.copyWith(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      receiptCount: null == receiptCount
          ? _value.receiptCount
          : receiptCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MonthlySpendImplCopyWith<$Res>
    implements $MonthlySpendCopyWith<$Res> {
  factory _$$MonthlySpendImplCopyWith(
          _$MonthlySpendImpl value, $Res Function(_$MonthlySpendImpl) then) =
      __$$MonthlySpendImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String month,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'receipt_count') int receiptCount});
}

/// @nodoc
class __$$MonthlySpendImplCopyWithImpl<$Res>
    extends _$MonthlySpendCopyWithImpl<$Res, _$MonthlySpendImpl>
    implements _$$MonthlySpendImplCopyWith<$Res> {
  __$$MonthlySpendImplCopyWithImpl(
      _$MonthlySpendImpl _value, $Res Function(_$MonthlySpendImpl) _then)
      : super(_value, _then);

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? month = null,
    Object? totalSpend = null,
    Object? receiptCount = null,
  }) {
    return _then(_$MonthlySpendImpl(
      month: null == month
          ? _value.month
          : month // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      receiptCount: null == receiptCount
          ? _value.receiptCount
          : receiptCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MonthlySpendImpl implements _MonthlySpend {
  const _$MonthlySpendImpl(
      {required this.month,
      @JsonKey(name: 'total_spend') required this.totalSpend,
      @JsonKey(name: 'receipt_count') required this.receiptCount});

  factory _$MonthlySpendImpl.fromJson(Map<String, dynamic> json) =>
      _$$MonthlySpendImplFromJson(json);

  @override
  final String month;
  @override
  @JsonKey(name: 'total_spend')
  final double totalSpend;
  @override
  @JsonKey(name: 'receipt_count')
  final int receiptCount;

  @override
  String toString() {
    return 'MonthlySpend(month: $month, totalSpend: $totalSpend, receiptCount: $receiptCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthlySpendImpl &&
            (identical(other.month, month) || other.month == month) &&
            (identical(other.totalSpend, totalSpend) ||
                other.totalSpend == totalSpend) &&
            (identical(other.receiptCount, receiptCount) ||
                other.receiptCount == receiptCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, month, totalSpend, receiptCount);

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthlySpendImplCopyWith<_$MonthlySpendImpl> get copyWith =>
      __$$MonthlySpendImplCopyWithImpl<_$MonthlySpendImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MonthlySpendImplToJson(
      this,
    );
  }
}

abstract class _MonthlySpend implements MonthlySpend {
  const factory _MonthlySpend(
          {required final String month,
          @JsonKey(name: 'total_spend') required final double totalSpend,
          @JsonKey(name: 'receipt_count') required final int receiptCount}) =
      _$MonthlySpendImpl;

  factory _MonthlySpend.fromJson(Map<String, dynamic> json) =
      _$MonthlySpendImpl.fromJson;

  @override
  String get month;
  @override
  @JsonKey(name: 'total_spend')
  double get totalSpend;
  @override
  @JsonKey(name: 'receipt_count')
  int get receiptCount;

  /// Create a copy of MonthlySpend
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthlySpendImplCopyWith<_$MonthlySpendImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StoreAnalytics _$StoreAnalyticsFromJson(Map<String, dynamic> json) {
  return _StoreAnalytics.fromJson(json);
}

/// @nodoc
mixin _$StoreAnalytics {
  @JsonKey(name: 'store_name')
  String get storeName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spend')
  double get totalSpend => throw _privateConstructorUsedError;
  @JsonKey(name: 'visit_count')
  int get visitCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_spend')
  double get averageSpend => throw _privateConstructorUsedError;
  @JsonKey(name: 'last_visit')
  DateTime? get lastVisit => throw _privateConstructorUsedError;

  /// Serializes this StoreAnalytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StoreAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StoreAnalyticsCopyWith<StoreAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StoreAnalyticsCopyWith<$Res> {
  factory $StoreAnalyticsCopyWith(
          StoreAnalytics value, $Res Function(StoreAnalytics) then) =
      _$StoreAnalyticsCopyWithImpl<$Res, StoreAnalytics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'store_name') String storeName,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'visit_count') int visitCount,
      @JsonKey(name: 'average_spend') double averageSpend,
      @JsonKey(name: 'last_visit') DateTime? lastVisit});
}

/// @nodoc
class _$StoreAnalyticsCopyWithImpl<$Res, $Val extends StoreAnalytics>
    implements $StoreAnalyticsCopyWith<$Res> {
  _$StoreAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StoreAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = null,
    Object? totalSpend = null,
    Object? visitCount = null,
    Object? averageSpend = null,
    Object? lastVisit = freezed,
  }) {
    return _then(_value.copyWith(
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      visitCount: null == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageSpend: null == averageSpend
          ? _value.averageSpend
          : averageSpend // ignore: cast_nullable_to_non_nullable
              as double,
      lastVisit: freezed == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StoreAnalyticsImplCopyWith<$Res>
    implements $StoreAnalyticsCopyWith<$Res> {
  factory _$$StoreAnalyticsImplCopyWith(_$StoreAnalyticsImpl value,
          $Res Function(_$StoreAnalyticsImpl) then) =
      __$$StoreAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'store_name') String storeName,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'visit_count') int visitCount,
      @JsonKey(name: 'average_spend') double averageSpend,
      @JsonKey(name: 'last_visit') DateTime? lastVisit});
}

/// @nodoc
class __$$StoreAnalyticsImplCopyWithImpl<$Res>
    extends _$StoreAnalyticsCopyWithImpl<$Res, _$StoreAnalyticsImpl>
    implements _$$StoreAnalyticsImplCopyWith<$Res> {
  __$$StoreAnalyticsImplCopyWithImpl(
      _$StoreAnalyticsImpl _value, $Res Function(_$StoreAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of StoreAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? storeName = null,
    Object? totalSpend = null,
    Object? visitCount = null,
    Object? averageSpend = null,
    Object? lastVisit = freezed,
  }) {
    return _then(_$StoreAnalyticsImpl(
      storeName: null == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      visitCount: null == visitCount
          ? _value.visitCount
          : visitCount // ignore: cast_nullable_to_non_nullable
              as int,
      averageSpend: null == averageSpend
          ? _value.averageSpend
          : averageSpend // ignore: cast_nullable_to_non_nullable
              as double,
      lastVisit: freezed == lastVisit
          ? _value.lastVisit
          : lastVisit // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StoreAnalyticsImpl implements _StoreAnalytics {
  const _$StoreAnalyticsImpl(
      {@JsonKey(name: 'store_name') required this.storeName,
      @JsonKey(name: 'total_spend') required this.totalSpend,
      @JsonKey(name: 'visit_count') required this.visitCount,
      @JsonKey(name: 'average_spend') required this.averageSpend,
      @JsonKey(name: 'last_visit') this.lastVisit});

  factory _$StoreAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StoreAnalyticsImplFromJson(json);

  @override
  @JsonKey(name: 'store_name')
  final String storeName;
  @override
  @JsonKey(name: 'total_spend')
  final double totalSpend;
  @override
  @JsonKey(name: 'visit_count')
  final int visitCount;
  @override
  @JsonKey(name: 'average_spend')
  final double averageSpend;
  @override
  @JsonKey(name: 'last_visit')
  final DateTime? lastVisit;

  @override
  String toString() {
    return 'StoreAnalytics(storeName: $storeName, totalSpend: $totalSpend, visitCount: $visitCount, averageSpend: $averageSpend, lastVisit: $lastVisit)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StoreAnalyticsImpl &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.totalSpend, totalSpend) ||
                other.totalSpend == totalSpend) &&
            (identical(other.visitCount, visitCount) ||
                other.visitCount == visitCount) &&
            (identical(other.averageSpend, averageSpend) ||
                other.averageSpend == averageSpend) &&
            (identical(other.lastVisit, lastVisit) ||
                other.lastVisit == lastVisit));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, storeName, totalSpend, visitCount, averageSpend, lastVisit);

  /// Create a copy of StoreAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StoreAnalyticsImplCopyWith<_$StoreAnalyticsImpl> get copyWith =>
      __$$StoreAnalyticsImplCopyWithImpl<_$StoreAnalyticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StoreAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _StoreAnalytics implements StoreAnalytics {
  const factory _StoreAnalytics(
          {@JsonKey(name: 'store_name') required final String storeName,
          @JsonKey(name: 'total_spend') required final double totalSpend,
          @JsonKey(name: 'visit_count') required final int visitCount,
          @JsonKey(name: 'average_spend') required final double averageSpend,
          @JsonKey(name: 'last_visit') final DateTime? lastVisit}) =
      _$StoreAnalyticsImpl;

  factory _StoreAnalytics.fromJson(Map<String, dynamic> json) =
      _$StoreAnalyticsImpl.fromJson;

  @override
  @JsonKey(name: 'store_name')
  String get storeName;
  @override
  @JsonKey(name: 'total_spend')
  double get totalSpend;
  @override
  @JsonKey(name: 'visit_count')
  int get visitCount;
  @override
  @JsonKey(name: 'average_spend')
  double get averageSpend;
  @override
  @JsonKey(name: 'last_visit')
  DateTime? get lastVisit;

  /// Create a copy of StoreAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StoreAnalyticsImplCopyWith<_$StoreAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProductAnalytics _$ProductAnalyticsFromJson(Map<String, dynamic> json) {
  return _ProductAnalytics.fromJson(json);
}

/// @nodoc
mixin _$ProductAnalytics {
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_quantity_purchased')
  double get totalQuantityPurchased => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spend')
  double get totalSpend => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_price')
  double get averagePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_price_trend')
  double? get percentagePriceTrend => throw _privateConstructorUsedError;

  /// Serializes this ProductAnalytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProductAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProductAnalyticsCopyWith<ProductAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProductAnalyticsCopyWith<$Res> {
  factory $ProductAnalyticsCopyWith(
          ProductAnalytics value, $Res Function(ProductAnalytics) then) =
      _$ProductAnalyticsCopyWithImpl<$Res, ProductAnalytics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'total_quantity_purchased') double totalQuantityPurchased,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'average_price') double averagePrice,
      @JsonKey(name: 'percentage_price_trend') double? percentagePriceTrend});
}

/// @nodoc
class _$ProductAnalyticsCopyWithImpl<$Res, $Val extends ProductAnalytics>
    implements $ProductAnalyticsCopyWith<$Res> {
  _$ProductAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProductAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? totalQuantityPurchased = null,
    Object? totalSpend = null,
    Object? averagePrice = null,
    Object? percentagePriceTrend = freezed,
  }) {
    return _then(_value.copyWith(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantityPurchased: null == totalQuantityPurchased
          ? _value.totalQuantityPurchased
          : totalQuantityPurchased // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      averagePrice: null == averagePrice
          ? _value.averagePrice
          : averagePrice // ignore: cast_nullable_to_non_nullable
              as double,
      percentagePriceTrend: freezed == percentagePriceTrend
          ? _value.percentagePriceTrend
          : percentagePriceTrend // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProductAnalyticsImplCopyWith<$Res>
    implements $ProductAnalyticsCopyWith<$Res> {
  factory _$$ProductAnalyticsImplCopyWith(_$ProductAnalyticsImpl value,
          $Res Function(_$ProductAnalyticsImpl) then) =
      __$$ProductAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'total_quantity_purchased') double totalQuantityPurchased,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'average_price') double averagePrice,
      @JsonKey(name: 'percentage_price_trend') double? percentagePriceTrend});
}

/// @nodoc
class __$$ProductAnalyticsImplCopyWithImpl<$Res>
    extends _$ProductAnalyticsCopyWithImpl<$Res, _$ProductAnalyticsImpl>
    implements _$$ProductAnalyticsImplCopyWith<$Res> {
  __$$ProductAnalyticsImplCopyWithImpl(_$ProductAnalyticsImpl _value,
      $Res Function(_$ProductAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProductAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? totalQuantityPurchased = null,
    Object? totalSpend = null,
    Object? averagePrice = null,
    Object? percentagePriceTrend = freezed,
  }) {
    return _then(_$ProductAnalyticsImpl(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantityPurchased: null == totalQuantityPurchased
          ? _value.totalQuantityPurchased
          : totalQuantityPurchased // ignore: cast_nullable_to_non_nullable
              as double,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      averagePrice: null == averagePrice
          ? _value.averagePrice
          : averagePrice // ignore: cast_nullable_to_non_nullable
              as double,
      percentagePriceTrend: freezed == percentagePriceTrend
          ? _value.percentagePriceTrend
          : percentagePriceTrend // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProductAnalyticsImpl implements _ProductAnalytics {
  const _$ProductAnalyticsImpl(
      {@JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'total_quantity_purchased')
      required this.totalQuantityPurchased,
      @JsonKey(name: 'total_spend') required this.totalSpend,
      @JsonKey(name: 'average_price') required this.averagePrice,
      @JsonKey(name: 'percentage_price_trend') this.percentagePriceTrend});

  factory _$ProductAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProductAnalyticsImplFromJson(json);

  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  @JsonKey(name: 'total_quantity_purchased')
  final double totalQuantityPurchased;
  @override
  @JsonKey(name: 'total_spend')
  final double totalSpend;
  @override
  @JsonKey(name: 'average_price')
  final double averagePrice;
  @override
  @JsonKey(name: 'percentage_price_trend')
  final double? percentagePriceTrend;

  @override
  String toString() {
    return 'ProductAnalytics(itemName: $itemName, totalQuantityPurchased: $totalQuantityPurchased, totalSpend: $totalSpend, averagePrice: $averagePrice, percentagePriceTrend: $percentagePriceTrend)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProductAnalyticsImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.totalQuantityPurchased, totalQuantityPurchased) ||
                other.totalQuantityPurchased == totalQuantityPurchased) &&
            (identical(other.totalSpend, totalSpend) ||
                other.totalSpend == totalSpend) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.percentagePriceTrend, percentagePriceTrend) ||
                other.percentagePriceTrend == percentagePriceTrend));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemName, totalQuantityPurchased,
      totalSpend, averagePrice, percentagePriceTrend);

  /// Create a copy of ProductAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProductAnalyticsImplCopyWith<_$ProductAnalyticsImpl> get copyWith =>
      __$$ProductAnalyticsImplCopyWithImpl<_$ProductAnalyticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProductAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _ProductAnalytics implements ProductAnalytics {
  const factory _ProductAnalytics(
      {@JsonKey(name: 'item_name') required final String itemName,
      @JsonKey(name: 'total_quantity_purchased')
      required final double totalQuantityPurchased,
      @JsonKey(name: 'total_spend') required final double totalSpend,
      @JsonKey(name: 'average_price') required final double averagePrice,
      @JsonKey(name: 'percentage_price_trend')
      final double? percentagePriceTrend}) = _$ProductAnalyticsImpl;

  factory _ProductAnalytics.fromJson(Map<String, dynamic> json) =
      _$ProductAnalyticsImpl.fromJson;

  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'total_quantity_purchased')
  double get totalQuantityPurchased;
  @override
  @JsonKey(name: 'total_spend')
  double get totalSpend;
  @override
  @JsonKey(name: 'average_price')
  double get averagePrice;
  @override
  @JsonKey(name: 'percentage_price_trend')
  double? get percentagePriceTrend;

  /// Create a copy of ProductAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProductAnalyticsImplCopyWith<_$ProductAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

PriceHistory _$PriceHistoryFromJson(Map<String, dynamic> json) {
  return _PriceHistory.fromJson(json);
}

/// @nodoc
mixin _$PriceHistory {
  @JsonKey(name: 'item_name')
  String get itemName => throw _privateConstructorUsedError;
  @JsonKey(name: 'average_price')
  double get averagePrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'min_price')
  double get minPrice => throw _privateConstructorUsedError;
  @JsonKey(name: 'max_price')
  double get maxPrice => throw _privateConstructorUsedError;
  String get trend => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_change')
  double? get percentageChange => throw _privateConstructorUsedError;

  /// Serializes this PriceHistory to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PriceHistoryCopyWith<PriceHistory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PriceHistoryCopyWith<$Res> {
  factory $PriceHistoryCopyWith(
          PriceHistory value, $Res Function(PriceHistory) then) =
      _$PriceHistoryCopyWithImpl<$Res, PriceHistory>;
  @useResult
  $Res call(
      {@JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'average_price') double averagePrice,
      @JsonKey(name: 'min_price') double minPrice,
      @JsonKey(name: 'max_price') double maxPrice,
      String trend,
      @JsonKey(name: 'percentage_change') double? percentageChange});
}

/// @nodoc
class _$PriceHistoryCopyWithImpl<$Res, $Val extends PriceHistory>
    implements $PriceHistoryCopyWith<$Res> {
  _$PriceHistoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? averagePrice = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? trend = null,
    Object? percentageChange = freezed,
  }) {
    return _then(_value.copyWith(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      averagePrice: null == averagePrice
          ? _value.averagePrice
          : averagePrice // ignore: cast_nullable_to_non_nullable
              as double,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      trend: null == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as String,
      percentageChange: freezed == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PriceHistoryImplCopyWith<$Res>
    implements $PriceHistoryCopyWith<$Res> {
  factory _$$PriceHistoryImplCopyWith(
          _$PriceHistoryImpl value, $Res Function(_$PriceHistoryImpl) then) =
      __$$PriceHistoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'item_name') String itemName,
      @JsonKey(name: 'average_price') double averagePrice,
      @JsonKey(name: 'min_price') double minPrice,
      @JsonKey(name: 'max_price') double maxPrice,
      String trend,
      @JsonKey(name: 'percentage_change') double? percentageChange});
}

/// @nodoc
class __$$PriceHistoryImplCopyWithImpl<$Res>
    extends _$PriceHistoryCopyWithImpl<$Res, _$PriceHistoryImpl>
    implements _$$PriceHistoryImplCopyWith<$Res> {
  __$$PriceHistoryImplCopyWithImpl(
      _$PriceHistoryImpl _value, $Res Function(_$PriceHistoryImpl) _then)
      : super(_value, _then);

  /// Create a copy of PriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemName = null,
    Object? averagePrice = null,
    Object? minPrice = null,
    Object? maxPrice = null,
    Object? trend = null,
    Object? percentageChange = freezed,
  }) {
    return _then(_$PriceHistoryImpl(
      itemName: null == itemName
          ? _value.itemName
          : itemName // ignore: cast_nullable_to_non_nullable
              as String,
      averagePrice: null == averagePrice
          ? _value.averagePrice
          : averagePrice // ignore: cast_nullable_to_non_nullable
              as double,
      minPrice: null == minPrice
          ? _value.minPrice
          : minPrice // ignore: cast_nullable_to_non_nullable
              as double,
      maxPrice: null == maxPrice
          ? _value.maxPrice
          : maxPrice // ignore: cast_nullable_to_non_nullable
              as double,
      trend: null == trend
          ? _value.trend
          : trend // ignore: cast_nullable_to_non_nullable
              as String,
      percentageChange: freezed == percentageChange
          ? _value.percentageChange
          : percentageChange // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PriceHistoryImpl implements _PriceHistory {
  const _$PriceHistoryImpl(
      {@JsonKey(name: 'item_name') required this.itemName,
      @JsonKey(name: 'average_price') required this.averagePrice,
      @JsonKey(name: 'min_price') required this.minPrice,
      @JsonKey(name: 'max_price') required this.maxPrice,
      required this.trend,
      @JsonKey(name: 'percentage_change') this.percentageChange});

  factory _$PriceHistoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$PriceHistoryImplFromJson(json);

  @override
  @JsonKey(name: 'item_name')
  final String itemName;
  @override
  @JsonKey(name: 'average_price')
  final double averagePrice;
  @override
  @JsonKey(name: 'min_price')
  final double minPrice;
  @override
  @JsonKey(name: 'max_price')
  final double maxPrice;
  @override
  final String trend;
  @override
  @JsonKey(name: 'percentage_change')
  final double? percentageChange;

  @override
  String toString() {
    return 'PriceHistory(itemName: $itemName, averagePrice: $averagePrice, minPrice: $minPrice, maxPrice: $maxPrice, trend: $trend, percentageChange: $percentageChange)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PriceHistoryImpl &&
            (identical(other.itemName, itemName) ||
                other.itemName == itemName) &&
            (identical(other.averagePrice, averagePrice) ||
                other.averagePrice == averagePrice) &&
            (identical(other.minPrice, minPrice) ||
                other.minPrice == minPrice) &&
            (identical(other.maxPrice, maxPrice) ||
                other.maxPrice == maxPrice) &&
            (identical(other.trend, trend) || other.trend == trend) &&
            (identical(other.percentageChange, percentageChange) ||
                other.percentageChange == percentageChange));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, itemName, averagePrice, minPrice,
      maxPrice, trend, percentageChange);

  /// Create a copy of PriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PriceHistoryImplCopyWith<_$PriceHistoryImpl> get copyWith =>
      __$$PriceHistoryImplCopyWithImpl<_$PriceHistoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PriceHistoryImplToJson(
      this,
    );
  }
}

abstract class _PriceHistory implements PriceHistory {
  const factory _PriceHistory(
          {@JsonKey(name: 'item_name') required final String itemName,
          @JsonKey(name: 'average_price') required final double averagePrice,
          @JsonKey(name: 'min_price') required final double minPrice,
          @JsonKey(name: 'max_price') required final double maxPrice,
          required final String trend,
          @JsonKey(name: 'percentage_change') final double? percentageChange}) =
      _$PriceHistoryImpl;

  factory _PriceHistory.fromJson(Map<String, dynamic> json) =
      _$PriceHistoryImpl.fromJson;

  @override
  @JsonKey(name: 'item_name')
  String get itemName;
  @override
  @JsonKey(name: 'average_price')
  double get averagePrice;
  @override
  @JsonKey(name: 'min_price')
  double get minPrice;
  @override
  @JsonKey(name: 'max_price')
  double get maxPrice;
  @override
  String get trend;
  @override
  @JsonKey(name: 'percentage_change')
  double? get percentageChange;

  /// Create a copy of PriceHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PriceHistoryImplCopyWith<_$PriceHistoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CategoryAnalytics _$CategoryAnalyticsFromJson(Map<String, dynamic> json) {
  return _CategoryAnalytics.fromJson(json);
}

/// @nodoc
mixin _$CategoryAnalytics {
  @JsonKey(name: 'category_name')
  String get categoryName => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spend')
  double get totalSpend => throw _privateConstructorUsedError;
  @JsonKey(name: 'item_count')
  int get itemCount => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_count')
  int get receiptCount => throw _privateConstructorUsedError;

  /// Serializes this CategoryAnalytics to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CategoryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CategoryAnalyticsCopyWith<CategoryAnalytics> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CategoryAnalyticsCopyWith<$Res> {
  factory $CategoryAnalyticsCopyWith(
          CategoryAnalytics value, $Res Function(CategoryAnalytics) then) =
      _$CategoryAnalyticsCopyWithImpl<$Res, CategoryAnalytics>;
  @useResult
  $Res call(
      {@JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'item_count') int itemCount,
      @JsonKey(name: 'receipt_count') int receiptCount});
}

/// @nodoc
class _$CategoryAnalyticsCopyWithImpl<$Res, $Val extends CategoryAnalytics>
    implements $CategoryAnalyticsCopyWith<$Res> {
  _$CategoryAnalyticsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CategoryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? totalSpend = null,
    Object? itemCount = null,
    Object? receiptCount = null,
  }) {
    return _then(_value.copyWith(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      receiptCount: null == receiptCount
          ? _value.receiptCount
          : receiptCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CategoryAnalyticsImplCopyWith<$Res>
    implements $CategoryAnalyticsCopyWith<$Res> {
  factory _$$CategoryAnalyticsImplCopyWith(_$CategoryAnalyticsImpl value,
          $Res Function(_$CategoryAnalyticsImpl) then) =
      __$$CategoryAnalyticsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'category_name') String categoryName,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'item_count') int itemCount,
      @JsonKey(name: 'receipt_count') int receiptCount});
}

/// @nodoc
class __$$CategoryAnalyticsImplCopyWithImpl<$Res>
    extends _$CategoryAnalyticsCopyWithImpl<$Res, _$CategoryAnalyticsImpl>
    implements _$$CategoryAnalyticsImplCopyWith<$Res> {
  __$$CategoryAnalyticsImplCopyWithImpl(_$CategoryAnalyticsImpl _value,
      $Res Function(_$CategoryAnalyticsImpl) _then)
      : super(_value, _then);

  /// Create a copy of CategoryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryName = null,
    Object? totalSpend = null,
    Object? itemCount = null,
    Object? receiptCount = null,
  }) {
    return _then(_$CategoryAnalyticsImpl(
      categoryName: null == categoryName
          ? _value.categoryName
          : categoryName // ignore: cast_nullable_to_non_nullable
              as String,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      itemCount: null == itemCount
          ? _value.itemCount
          : itemCount // ignore: cast_nullable_to_non_nullable
              as int,
      receiptCount: null == receiptCount
          ? _value.receiptCount
          : receiptCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CategoryAnalyticsImpl implements _CategoryAnalytics {
  const _$CategoryAnalyticsImpl(
      {@JsonKey(name: 'category_name') required this.categoryName,
      @JsonKey(name: 'total_spend') required this.totalSpend,
      @JsonKey(name: 'item_count') required this.itemCount,
      @JsonKey(name: 'receipt_count') required this.receiptCount});

  factory _$CategoryAnalyticsImpl.fromJson(Map<String, dynamic> json) =>
      _$$CategoryAnalyticsImplFromJson(json);

  @override
  @JsonKey(name: 'category_name')
  final String categoryName;
  @override
  @JsonKey(name: 'total_spend')
  final double totalSpend;
  @override
  @JsonKey(name: 'item_count')
  final int itemCount;
  @override
  @JsonKey(name: 'receipt_count')
  final int receiptCount;

  @override
  String toString() {
    return 'CategoryAnalytics(categoryName: $categoryName, totalSpend: $totalSpend, itemCount: $itemCount, receiptCount: $receiptCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CategoryAnalyticsImpl &&
            (identical(other.categoryName, categoryName) ||
                other.categoryName == categoryName) &&
            (identical(other.totalSpend, totalSpend) ||
                other.totalSpend == totalSpend) &&
            (identical(other.itemCount, itemCount) ||
                other.itemCount == itemCount) &&
            (identical(other.receiptCount, receiptCount) ||
                other.receiptCount == receiptCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, categoryName, totalSpend, itemCount, receiptCount);

  /// Create a copy of CategoryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CategoryAnalyticsImplCopyWith<_$CategoryAnalyticsImpl> get copyWith =>
      __$$CategoryAnalyticsImplCopyWithImpl<_$CategoryAnalyticsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CategoryAnalyticsImplToJson(
      this,
    );
  }
}

abstract class _CategoryAnalytics implements CategoryAnalytics {
  const factory _CategoryAnalytics(
          {@JsonKey(name: 'category_name') required final String categoryName,
          @JsonKey(name: 'total_spend') required final double totalSpend,
          @JsonKey(name: 'item_count') required final int itemCount,
          @JsonKey(name: 'receipt_count') required final int receiptCount}) =
      _$CategoryAnalyticsImpl;

  factory _CategoryAnalytics.fromJson(Map<String, dynamic> json) =
      _$CategoryAnalyticsImpl.fromJson;

  @override
  @JsonKey(name: 'category_name')
  String get categoryName;
  @override
  @JsonKey(name: 'total_spend')
  double get totalSpend;
  @override
  @JsonKey(name: 'item_count')
  int get itemCount;
  @override
  @JsonKey(name: 'receipt_count')
  int get receiptCount;

  /// Create a copy of CategoryAnalytics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CategoryAnalyticsImplCopyWith<_$CategoryAnalyticsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

DailyTimeline _$DailyTimelineFromJson(Map<String, dynamic> json) {
  return _DailyTimeline.fromJson(json);
}

/// @nodoc
mixin _$DailyTimeline {
  DateTime get date => throw _privateConstructorUsedError;
  @JsonKey(name: 'total_spend')
  double get totalSpend => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_count')
  int get receiptCount => throw _privateConstructorUsedError;

  /// Serializes this DailyTimeline to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DailyTimeline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DailyTimelineCopyWith<DailyTimeline> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DailyTimelineCopyWith<$Res> {
  factory $DailyTimelineCopyWith(
          DailyTimeline value, $Res Function(DailyTimeline) then) =
      _$DailyTimelineCopyWithImpl<$Res, DailyTimeline>;
  @useResult
  $Res call(
      {DateTime date,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'receipt_count') int receiptCount});
}

/// @nodoc
class _$DailyTimelineCopyWithImpl<$Res, $Val extends DailyTimeline>
    implements $DailyTimelineCopyWith<$Res> {
  _$DailyTimelineCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DailyTimeline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalSpend = null,
    Object? receiptCount = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      receiptCount: null == receiptCount
          ? _value.receiptCount
          : receiptCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DailyTimelineImplCopyWith<$Res>
    implements $DailyTimelineCopyWith<$Res> {
  factory _$$DailyTimelineImplCopyWith(
          _$DailyTimelineImpl value, $Res Function(_$DailyTimelineImpl) then) =
      __$$DailyTimelineImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DateTime date,
      @JsonKey(name: 'total_spend') double totalSpend,
      @JsonKey(name: 'receipt_count') int receiptCount});
}

/// @nodoc
class __$$DailyTimelineImplCopyWithImpl<$Res>
    extends _$DailyTimelineCopyWithImpl<$Res, _$DailyTimelineImpl>
    implements _$$DailyTimelineImplCopyWith<$Res> {
  __$$DailyTimelineImplCopyWithImpl(
      _$DailyTimelineImpl _value, $Res Function(_$DailyTimelineImpl) _then)
      : super(_value, _then);

  /// Create a copy of DailyTimeline
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? totalSpend = null,
    Object? receiptCount = null,
  }) {
    return _then(_$DailyTimelineImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime,
      totalSpend: null == totalSpend
          ? _value.totalSpend
          : totalSpend // ignore: cast_nullable_to_non_nullable
              as double,
      receiptCount: null == receiptCount
          ? _value.receiptCount
          : receiptCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DailyTimelineImpl implements _DailyTimeline {
  const _$DailyTimelineImpl(
      {required this.date,
      @JsonKey(name: 'total_spend') required this.totalSpend,
      @JsonKey(name: 'receipt_count') required this.receiptCount});

  factory _$DailyTimelineImpl.fromJson(Map<String, dynamic> json) =>
      _$$DailyTimelineImplFromJson(json);

  @override
  final DateTime date;
  @override
  @JsonKey(name: 'total_spend')
  final double totalSpend;
  @override
  @JsonKey(name: 'receipt_count')
  final int receiptCount;

  @override
  String toString() {
    return 'DailyTimeline(date: $date, totalSpend: $totalSpend, receiptCount: $receiptCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DailyTimelineImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.totalSpend, totalSpend) ||
                other.totalSpend == totalSpend) &&
            (identical(other.receiptCount, receiptCount) ||
                other.receiptCount == receiptCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, date, totalSpend, receiptCount);

  /// Create a copy of DailyTimeline
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DailyTimelineImplCopyWith<_$DailyTimelineImpl> get copyWith =>
      __$$DailyTimelineImplCopyWithImpl<_$DailyTimelineImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DailyTimelineImplToJson(
      this,
    );
  }
}

abstract class _DailyTimeline implements DailyTimeline {
  const factory _DailyTimeline(
          {required final DateTime date,
          @JsonKey(name: 'total_spend') required final double totalSpend,
          @JsonKey(name: 'receipt_count') required final int receiptCount}) =
      _$DailyTimelineImpl;

  factory _DailyTimeline.fromJson(Map<String, dynamic> json) =
      _$DailyTimelineImpl.fromJson;

  @override
  DateTime get date;
  @override
  @JsonKey(name: 'total_spend')
  double get totalSpend;
  @override
  @JsonKey(name: 'receipt_count')
  int get receiptCount;

  /// Create a copy of DailyTimeline
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DailyTimelineImplCopyWith<_$DailyTimelineImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

AnalyticsDashboardData _$AnalyticsDashboardDataFromJson(
    Map<String, dynamic> json) {
  return _AnalyticsDashboardData.fromJson(json);
}

/// @nodoc
mixin _$AnalyticsDashboardData {
  DashboardMetrics get metrics => throw _privateConstructorUsedError;
  List<MonthlySpend> get monthly => throw _privateConstructorUsedError;
  List<DailyTimeline> get timeline => throw _privateConstructorUsedError;
  List<CategoryAnalytics> get categories => throw _privateConstructorUsedError;
  List<StoreAnalytics> get stores => throw _privateConstructorUsedError;
  List<ProductAnalytics> get products => throw _privateConstructorUsedError;

  /// Serializes this AnalyticsDashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsDashboardDataCopyWith<AnalyticsDashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsDashboardDataCopyWith<$Res> {
  factory $AnalyticsDashboardDataCopyWith(AnalyticsDashboardData value,
          $Res Function(AnalyticsDashboardData) then) =
      _$AnalyticsDashboardDataCopyWithImpl<$Res, AnalyticsDashboardData>;
  @useResult
  $Res call(
      {DashboardMetrics metrics,
      List<MonthlySpend> monthly,
      List<DailyTimeline> timeline,
      List<CategoryAnalytics> categories,
      List<StoreAnalytics> stores,
      List<ProductAnalytics> products});

  $DashboardMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$AnalyticsDashboardDataCopyWithImpl<$Res,
        $Val extends AnalyticsDashboardData>
    implements $AnalyticsDashboardDataCopyWith<$Res> {
  _$AnalyticsDashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metrics = null,
    Object? monthly = null,
    Object? timeline = null,
    Object? categories = null,
    Object? stores = null,
    Object? products = null,
  }) {
    return _then(_value.copyWith(
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as DashboardMetrics,
      monthly: null == monthly
          ? _value.monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as List<MonthlySpend>,
      timeline: null == timeline
          ? _value.timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as List<DailyTimeline>,
      categories: null == categories
          ? _value.categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryAnalytics>,
      stores: null == stores
          ? _value.stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<StoreAnalytics>,
      products: null == products
          ? _value.products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductAnalytics>,
    ) as $Val);
  }

  /// Create a copy of AnalyticsDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $DashboardMetricsCopyWith<$Res> get metrics {
    return $DashboardMetricsCopyWith<$Res>(_value.metrics, (value) {
      return _then(_value.copyWith(metrics: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AnalyticsDashboardDataImplCopyWith<$Res>
    implements $AnalyticsDashboardDataCopyWith<$Res> {
  factory _$$AnalyticsDashboardDataImplCopyWith(
          _$AnalyticsDashboardDataImpl value,
          $Res Function(_$AnalyticsDashboardDataImpl) then) =
      __$$AnalyticsDashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DashboardMetrics metrics,
      List<MonthlySpend> monthly,
      List<DailyTimeline> timeline,
      List<CategoryAnalytics> categories,
      List<StoreAnalytics> stores,
      List<ProductAnalytics> products});

  @override
  $DashboardMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$$AnalyticsDashboardDataImplCopyWithImpl<$Res>
    extends _$AnalyticsDashboardDataCopyWithImpl<$Res,
        _$AnalyticsDashboardDataImpl>
    implements _$$AnalyticsDashboardDataImplCopyWith<$Res> {
  __$$AnalyticsDashboardDataImplCopyWithImpl(
      _$AnalyticsDashboardDataImpl _value,
      $Res Function(_$AnalyticsDashboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metrics = null,
    Object? monthly = null,
    Object? timeline = null,
    Object? categories = null,
    Object? stores = null,
    Object? products = null,
  }) {
    return _then(_$AnalyticsDashboardDataImpl(
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as DashboardMetrics,
      monthly: null == monthly
          ? _value._monthly
          : monthly // ignore: cast_nullable_to_non_nullable
              as List<MonthlySpend>,
      timeline: null == timeline
          ? _value._timeline
          : timeline // ignore: cast_nullable_to_non_nullable
              as List<DailyTimeline>,
      categories: null == categories
          ? _value._categories
          : categories // ignore: cast_nullable_to_non_nullable
              as List<CategoryAnalytics>,
      stores: null == stores
          ? _value._stores
          : stores // ignore: cast_nullable_to_non_nullable
              as List<StoreAnalytics>,
      products: null == products
          ? _value._products
          : products // ignore: cast_nullable_to_non_nullable
              as List<ProductAnalytics>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AnalyticsDashboardDataImpl implements _AnalyticsDashboardData {
  const _$AnalyticsDashboardDataImpl(
      {required this.metrics,
      required final List<MonthlySpend> monthly,
      required final List<DailyTimeline> timeline,
      required final List<CategoryAnalytics> categories,
      required final List<StoreAnalytics> stores,
      required final List<ProductAnalytics> products})
      : _monthly = monthly,
        _timeline = timeline,
        _categories = categories,
        _stores = stores,
        _products = products;

  factory _$AnalyticsDashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$AnalyticsDashboardDataImplFromJson(json);

  @override
  final DashboardMetrics metrics;
  final List<MonthlySpend> _monthly;
  @override
  List<MonthlySpend> get monthly {
    if (_monthly is EqualUnmodifiableListView) return _monthly;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_monthly);
  }

  final List<DailyTimeline> _timeline;
  @override
  List<DailyTimeline> get timeline {
    if (_timeline is EqualUnmodifiableListView) return _timeline;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_timeline);
  }

  final List<CategoryAnalytics> _categories;
  @override
  List<CategoryAnalytics> get categories {
    if (_categories is EqualUnmodifiableListView) return _categories;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_categories);
  }

  final List<StoreAnalytics> _stores;
  @override
  List<StoreAnalytics> get stores {
    if (_stores is EqualUnmodifiableListView) return _stores;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_stores);
  }

  final List<ProductAnalytics> _products;
  @override
  List<ProductAnalytics> get products {
    if (_products is EqualUnmodifiableListView) return _products;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_products);
  }

  @override
  String toString() {
    return 'AnalyticsDashboardData(metrics: $metrics, monthly: $monthly, timeline: $timeline, categories: $categories, stores: $stores, products: $products)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsDashboardDataImpl &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            const DeepCollectionEquality().equals(other._monthly, _monthly) &&
            const DeepCollectionEquality().equals(other._timeline, _timeline) &&
            const DeepCollectionEquality()
                .equals(other._categories, _categories) &&
            const DeepCollectionEquality().equals(other._stores, _stores) &&
            const DeepCollectionEquality().equals(other._products, _products));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      metrics,
      const DeepCollectionEquality().hash(_monthly),
      const DeepCollectionEquality().hash(_timeline),
      const DeepCollectionEquality().hash(_categories),
      const DeepCollectionEquality().hash(_stores),
      const DeepCollectionEquality().hash(_products));

  /// Create a copy of AnalyticsDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsDashboardDataImplCopyWith<_$AnalyticsDashboardDataImpl>
      get copyWith => __$$AnalyticsDashboardDataImplCopyWithImpl<
          _$AnalyticsDashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AnalyticsDashboardDataImplToJson(
      this,
    );
  }
}

abstract class _AnalyticsDashboardData implements AnalyticsDashboardData {
  const factory _AnalyticsDashboardData(
          {required final DashboardMetrics metrics,
          required final List<MonthlySpend> monthly,
          required final List<DailyTimeline> timeline,
          required final List<CategoryAnalytics> categories,
          required final List<StoreAnalytics> stores,
          required final List<ProductAnalytics> products}) =
      _$AnalyticsDashboardDataImpl;

  factory _AnalyticsDashboardData.fromJson(Map<String, dynamic> json) =
      _$AnalyticsDashboardDataImpl.fromJson;

  @override
  DashboardMetrics get metrics;
  @override
  List<MonthlySpend> get monthly;
  @override
  List<DailyTimeline> get timeline;
  @override
  List<CategoryAnalytics> get categories;
  @override
  List<StoreAnalytics> get stores;
  @override
  List<ProductAnalytics> get products;

  /// Create a copy of AnalyticsDashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsDashboardDataImplCopyWith<_$AnalyticsDashboardDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$AnalyticsState {
  dynamic get data => throw _privateConstructorUsedError;
  DateRange get selectedRange => throw _privateConstructorUsedError;
  bool get isRefreshing => throw _privateConstructorUsedError;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AnalyticsStateCopyWith<AnalyticsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AnalyticsStateCopyWith<$Res> {
  factory $AnalyticsStateCopyWith(
          AnalyticsState value, $Res Function(AnalyticsState) then) =
      _$AnalyticsStateCopyWithImpl<$Res, AnalyticsState>;
  @useResult
  $Res call({dynamic data, DateRange selectedRange, bool isRefreshing});
}

/// @nodoc
class _$AnalyticsStateCopyWithImpl<$Res, $Val extends AnalyticsState>
    implements $AnalyticsStateCopyWith<$Res> {
  _$AnalyticsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? selectedRange = null,
    Object? isRefreshing = null,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as dynamic,
      selectedRange: null == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AnalyticsStateImplCopyWith<$Res>
    implements $AnalyticsStateCopyWith<$Res> {
  factory _$$AnalyticsStateImplCopyWith(_$AnalyticsStateImpl value,
          $Res Function(_$AnalyticsStateImpl) then) =
      __$$AnalyticsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic data, DateRange selectedRange, bool isRefreshing});
}

/// @nodoc
class __$$AnalyticsStateImplCopyWithImpl<$Res>
    extends _$AnalyticsStateCopyWithImpl<$Res, _$AnalyticsStateImpl>
    implements _$$AnalyticsStateImplCopyWith<$Res> {
  __$$AnalyticsStateImplCopyWithImpl(
      _$AnalyticsStateImpl _value, $Res Function(_$AnalyticsStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
    Object? selectedRange = null,
    Object? isRefreshing = null,
  }) {
    return _then(_$AnalyticsStateImpl(
      data: freezed == data ? _value.data! : data,
      selectedRange: null == selectedRange
          ? _value.selectedRange
          : selectedRange // ignore: cast_nullable_to_non_nullable
              as DateRange,
      isRefreshing: null == isRefreshing
          ? _value.isRefreshing
          : isRefreshing // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$AnalyticsStateImpl implements _AnalyticsState {
  const _$AnalyticsStateImpl(
      {this.data = const ApiState.initial(),
      required this.selectedRange,
      this.isRefreshing = false});

  @override
  @JsonKey()
  final dynamic data;
  @override
  final DateRange selectedRange;
  @override
  @JsonKey()
  final bool isRefreshing;

  @override
  String toString() {
    return 'AnalyticsState(data: $data, selectedRange: $selectedRange, isRefreshing: $isRefreshing)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AnalyticsStateImpl &&
            const DeepCollectionEquality().equals(other.data, data) &&
            (identical(other.selectedRange, selectedRange) ||
                other.selectedRange == selectedRange) &&
            (identical(other.isRefreshing, isRefreshing) ||
                other.isRefreshing == isRefreshing));
  }

  @override
  int get hashCode => Object.hash(runtimeType,
      const DeepCollectionEquality().hash(data), selectedRange, isRefreshing);

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AnalyticsStateImplCopyWith<_$AnalyticsStateImpl> get copyWith =>
      __$$AnalyticsStateImplCopyWithImpl<_$AnalyticsStateImpl>(
          this, _$identity);
}

abstract class _AnalyticsState implements AnalyticsState {
  const factory _AnalyticsState(
      {final dynamic data,
      required final DateRange selectedRange,
      final bool isRefreshing}) = _$AnalyticsStateImpl;

  @override
  dynamic get data;
  @override
  DateRange get selectedRange;
  @override
  bool get isRefreshing;

  /// Create a copy of AnalyticsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AnalyticsStateImplCopyWith<_$AnalyticsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_metrics.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardMetrics _$DashboardMetricsFromJson(Map<String, dynamic> json) {
  return _DashboardMetrics.fromJson(json);
}

/// @nodoc
mixin _$DashboardMetrics {
  int get totalReceipts => throw _privateConstructorUsedError;
  double get totalSpend => throw _privateConstructorUsedError;
  double get averageReceipt => throw _privateConstructorUsedError;
  double get largestReceipt => throw _privateConstructorUsedError;
  double get smallestReceipt => throw _privateConstructorUsedError;
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
      {int totalReceipts,
      double totalSpend,
      double averageReceipt,
      double largestReceipt,
      double smallestReceipt,
      StatusCounts statusCounts});

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
      {int totalReceipts,
      double totalSpend,
      double averageReceipt,
      double largestReceipt,
      double smallestReceipt,
      StatusCounts statusCounts});

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
      {this.totalReceipts = 0,
      this.totalSpend = 0.0,
      this.averageReceipt = 0.0,
      this.largestReceipt = 0.0,
      this.smallestReceipt = 0.0,
      required this.statusCounts});

  factory _$DashboardMetricsImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardMetricsImplFromJson(json);

  @override
  @JsonKey()
  final int totalReceipts;
  @override
  @JsonKey()
  final double totalSpend;
  @override
  @JsonKey()
  final double averageReceipt;
  @override
  @JsonKey()
  final double largestReceipt;
  @override
  @JsonKey()
  final double smallestReceipt;
  @override
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
      {final int totalReceipts,
      final double totalSpend,
      final double averageReceipt,
      final double largestReceipt,
      final double smallestReceipt,
      required final StatusCounts statusCounts}) = _$DashboardMetricsImpl;

  factory _DashboardMetrics.fromJson(Map<String, dynamic> json) =
      _$DashboardMetricsImpl.fromJson;

  @override
  int get totalReceipts;
  @override
  double get totalSpend;
  @override
  double get averageReceipt;
  @override
  double get largestReceipt;
  @override
  double get smallestReceipt;
  @override
  StatusCounts get statusCounts;

  /// Create a copy of DashboardMetrics
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardMetricsImplCopyWith<_$DashboardMetricsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatusCounts _$StatusCountsFromJson(Map<String, dynamic> json) {
  return _StatusCounts.fromJson(json);
}

/// @nodoc
mixin _$StatusCounts {
  int get draft => throw _privateConstructorUsedError;
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
  $Res call({int draft, int reviewRequired, int confirmed, int failed});
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
  $Res call({int draft, int reviewRequired, int confirmed, int failed});
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
      this.reviewRequired = 0,
      this.confirmed = 0,
      this.failed = 0});

  factory _$StatusCountsImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatusCountsImplFromJson(json);

  @override
  @JsonKey()
  final int draft;
  @override
  @JsonKey()
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
      final int reviewRequired,
      final int confirmed,
      final int failed}) = _$StatusCountsImpl;

  factory _StatusCounts.fromJson(Map<String, dynamic> json) =
      _$StatusCountsImpl.fromJson;

  @override
  int get draft;
  @override
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

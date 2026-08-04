// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'dashboard_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DashboardData _$DashboardDataFromJson(Map<String, dynamic> json) {
  return _DashboardData.fromJson(json);
}

/// @nodoc
mixin _$DashboardData {
  DashboardMetrics get metrics => throw _privateConstructorUsedError;
  List<ReceiptModel> get recentReceipts => throw _privateConstructorUsedError;
  List<ReceiptModel> get pendingReviews => throw _privateConstructorUsedError;

  /// Serializes this DashboardData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $DashboardDataCopyWith<DashboardData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DashboardDataCopyWith<$Res> {
  factory $DashboardDataCopyWith(
          DashboardData value, $Res Function(DashboardData) then) =
      _$DashboardDataCopyWithImpl<$Res, DashboardData>;
  @useResult
  $Res call(
      {DashboardMetrics metrics,
      List<ReceiptModel> recentReceipts,
      List<ReceiptModel> pendingReviews});

  $DashboardMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class _$DashboardDataCopyWithImpl<$Res, $Val extends DashboardData>
    implements $DashboardDataCopyWith<$Res> {
  _$DashboardDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metrics = null,
    Object? recentReceipts = null,
    Object? pendingReviews = null,
  }) {
    return _then(_value.copyWith(
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as DashboardMetrics,
      recentReceipts: null == recentReceipts
          ? _value.recentReceipts
          : recentReceipts // ignore: cast_nullable_to_non_nullable
              as List<ReceiptModel>,
      pendingReviews: null == pendingReviews
          ? _value.pendingReviews
          : pendingReviews // ignore: cast_nullable_to_non_nullable
              as List<ReceiptModel>,
    ) as $Val);
  }

  /// Create a copy of DashboardData
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
abstract class _$$DashboardDataImplCopyWith<$Res>
    implements $DashboardDataCopyWith<$Res> {
  factory _$$DashboardDataImplCopyWith(
          _$DashboardDataImpl value, $Res Function(_$DashboardDataImpl) then) =
      __$$DashboardDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {DashboardMetrics metrics,
      List<ReceiptModel> recentReceipts,
      List<ReceiptModel> pendingReviews});

  @override
  $DashboardMetricsCopyWith<$Res> get metrics;
}

/// @nodoc
class __$$DashboardDataImplCopyWithImpl<$Res>
    extends _$DashboardDataCopyWithImpl<$Res, _$DashboardDataImpl>
    implements _$$DashboardDataImplCopyWith<$Res> {
  __$$DashboardDataImplCopyWithImpl(
      _$DashboardDataImpl _value, $Res Function(_$DashboardDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metrics = null,
    Object? recentReceipts = null,
    Object? pendingReviews = null,
  }) {
    return _then(_$DashboardDataImpl(
      metrics: null == metrics
          ? _value.metrics
          : metrics // ignore: cast_nullable_to_non_nullable
              as DashboardMetrics,
      recentReceipts: null == recentReceipts
          ? _value._recentReceipts
          : recentReceipts // ignore: cast_nullable_to_non_nullable
              as List<ReceiptModel>,
      pendingReviews: null == pendingReviews
          ? _value._pendingReviews
          : pendingReviews // ignore: cast_nullable_to_non_nullable
              as List<ReceiptModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DashboardDataImpl implements _DashboardData {
  const _$DashboardDataImpl(
      {required this.metrics,
      required final List<ReceiptModel> recentReceipts,
      required final List<ReceiptModel> pendingReviews})
      : _recentReceipts = recentReceipts,
        _pendingReviews = pendingReviews;

  factory _$DashboardDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$DashboardDataImplFromJson(json);

  @override
  final DashboardMetrics metrics;
  final List<ReceiptModel> _recentReceipts;
  @override
  List<ReceiptModel> get recentReceipts {
    if (_recentReceipts is EqualUnmodifiableListView) return _recentReceipts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_recentReceipts);
  }

  final List<ReceiptModel> _pendingReviews;
  @override
  List<ReceiptModel> get pendingReviews {
    if (_pendingReviews is EqualUnmodifiableListView) return _pendingReviews;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_pendingReviews);
  }

  @override
  String toString() {
    return 'DashboardData(metrics: $metrics, recentReceipts: $recentReceipts, pendingReviews: $pendingReviews)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DashboardDataImpl &&
            (identical(other.metrics, metrics) || other.metrics == metrics) &&
            const DeepCollectionEquality()
                .equals(other._recentReceipts, _recentReceipts) &&
            const DeepCollectionEquality()
                .equals(other._pendingReviews, _pendingReviews));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      metrics,
      const DeepCollectionEquality().hash(_recentReceipts),
      const DeepCollectionEquality().hash(_pendingReviews));

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      __$$DashboardDataImplCopyWithImpl<_$DashboardDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DashboardDataImplToJson(
      this,
    );
  }
}

abstract class _DashboardData implements DashboardData {
  const factory _DashboardData(
      {required final DashboardMetrics metrics,
      required final List<ReceiptModel> recentReceipts,
      required final List<ReceiptModel> pendingReviews}) = _$DashboardDataImpl;

  factory _DashboardData.fromJson(Map<String, dynamic> json) =
      _$DashboardDataImpl.fromJson;

  @override
  DashboardMetrics get metrics;
  @override
  List<ReceiptModel> get recentReceipts;
  @override
  List<ReceiptModel> get pendingReviews;

  /// Create a copy of DashboardData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$DashboardDataImplCopyWith<_$DashboardDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

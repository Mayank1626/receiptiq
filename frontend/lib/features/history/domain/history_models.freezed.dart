// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'history_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$ReceiptFilter {
  ReceiptStatus? get status => throw _privateConstructorUsedError;
  DateRange? get dateRange => throw _privateConstructorUsedError;
  double? get minAmount => throw _privateConstructorUsedError;
  double? get maxAmount => throw _privateConstructorUsedError;
  String get searchQuery => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptFilterCopyWith<ReceiptFilter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptFilterCopyWith<$Res> {
  factory $ReceiptFilterCopyWith(
          ReceiptFilter value, $Res Function(ReceiptFilter) then) =
      _$ReceiptFilterCopyWithImpl<$Res, ReceiptFilter>;
  @useResult
  $Res call(
      {ReceiptStatus? status,
      DateRange? dateRange,
      double? minAmount,
      double? maxAmount,
      String searchQuery});
}

/// @nodoc
class _$ReceiptFilterCopyWithImpl<$Res, $Val extends ReceiptFilter>
    implements $ReceiptFilterCopyWith<$Res> {
  _$ReceiptFilterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? dateRange = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? searchQuery = null,
  }) {
    return _then(_value.copyWith(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReceiptStatus?,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRange?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptFilterImplCopyWith<$Res>
    implements $ReceiptFilterCopyWith<$Res> {
  factory _$$ReceiptFilterImplCopyWith(
          _$ReceiptFilterImpl value, $Res Function(_$ReceiptFilterImpl) then) =
      __$$ReceiptFilterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReceiptStatus? status,
      DateRange? dateRange,
      double? minAmount,
      double? maxAmount,
      String searchQuery});
}

/// @nodoc
class __$$ReceiptFilterImplCopyWithImpl<$Res>
    extends _$ReceiptFilterCopyWithImpl<$Res, _$ReceiptFilterImpl>
    implements _$$ReceiptFilterImplCopyWith<$Res> {
  __$$ReceiptFilterImplCopyWithImpl(
      _$ReceiptFilterImpl _value, $Res Function(_$ReceiptFilterImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptFilter
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = freezed,
    Object? dateRange = freezed,
    Object? minAmount = freezed,
    Object? maxAmount = freezed,
    Object? searchQuery = null,
  }) {
    return _then(_$ReceiptFilterImpl(
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as ReceiptStatus?,
      dateRange: freezed == dateRange
          ? _value.dateRange
          : dateRange // ignore: cast_nullable_to_non_nullable
              as DateRange?,
      minAmount: freezed == minAmount
          ? _value.minAmount
          : minAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      maxAmount: freezed == maxAmount
          ? _value.maxAmount
          : maxAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      searchQuery: null == searchQuery
          ? _value.searchQuery
          : searchQuery // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$ReceiptFilterImpl implements _ReceiptFilter {
  const _$ReceiptFilterImpl(
      {this.status,
      this.dateRange,
      this.minAmount,
      this.maxAmount,
      this.searchQuery = ''});

  @override
  final ReceiptStatus? status;
  @override
  final DateRange? dateRange;
  @override
  final double? minAmount;
  @override
  final double? maxAmount;
  @override
  @JsonKey()
  final String searchQuery;

  @override
  String toString() {
    return 'ReceiptFilter(status: $status, dateRange: $dateRange, minAmount: $minAmount, maxAmount: $maxAmount, searchQuery: $searchQuery)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptFilterImpl &&
            const DeepCollectionEquality().equals(other.status, status) &&
            (identical(other.dateRange, dateRange) ||
                other.dateRange == dateRange) &&
            (identical(other.minAmount, minAmount) ||
                other.minAmount == minAmount) &&
            (identical(other.maxAmount, maxAmount) ||
                other.maxAmount == maxAmount) &&
            (identical(other.searchQuery, searchQuery) ||
                other.searchQuery == searchQuery));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(status),
      dateRange,
      minAmount,
      maxAmount,
      searchQuery);

  /// Create a copy of ReceiptFilter
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptFilterImplCopyWith<_$ReceiptFilterImpl> get copyWith =>
      __$$ReceiptFilterImplCopyWithImpl<_$ReceiptFilterImpl>(this, _$identity);
}

abstract class _ReceiptFilter implements ReceiptFilter {
  const factory _ReceiptFilter(
      {final ReceiptStatus? status,
      final DateRange? dateRange,
      final double? minAmount,
      final double? maxAmount,
      final String searchQuery}) = _$ReceiptFilterImpl;

  @override
  ReceiptStatus? get status;
  @override
  DateRange? get dateRange;
  @override
  double? get minAmount;
  @override
  double? get maxAmount;
  @override
  String get searchQuery;

  /// Create a copy of ReceiptFilter
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptFilterImplCopyWith<_$ReceiptFilterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HistoryState {
  List<ReceiptModel> get items => throw _privateConstructorUsedError;
  ReceiptFilter get filter => throw _privateConstructorUsedError;
  bool get isFirstLoad => throw _privateConstructorUsedError;
  bool get isLoadingMore => throw _privateConstructorUsedError;
  bool get hasReachedEnd => throw _privateConstructorUsedError;
  Failure? get error => throw _privateConstructorUsedError;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HistoryStateCopyWith<HistoryState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HistoryStateCopyWith<$Res> {
  factory $HistoryStateCopyWith(
          HistoryState value, $Res Function(HistoryState) then) =
      _$HistoryStateCopyWithImpl<$Res, HistoryState>;
  @useResult
  $Res call(
      {List<ReceiptModel> items,
      ReceiptFilter filter,
      bool isFirstLoad,
      bool isLoadingMore,
      bool hasReachedEnd,
      Failure? error});

  $ReceiptFilterCopyWith<$Res> get filter;
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class _$HistoryStateCopyWithImpl<$Res, $Val extends HistoryState>
    implements $HistoryStateCopyWith<$Res> {
  _$HistoryStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? filter = null,
    Object? isFirstLoad = null,
    Object? isLoadingMore = null,
    Object? hasReachedEnd = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReceiptModel>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ReceiptFilter,
      isFirstLoad: null == isFirstLoad
          ? _value.isFirstLoad
          : isFirstLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ) as $Val);
  }

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceiptFilterCopyWith<$Res> get filter {
    return $ReceiptFilterCopyWith<$Res>(_value.filter, (value) {
      return _then(_value.copyWith(filter: value) as $Val);
    });
  }

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $FailureCopyWith<$Res>? get error {
    if (_value.error == null) {
      return null;
    }

    return $FailureCopyWith<$Res>(_value.error!, (value) {
      return _then(_value.copyWith(error: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HistoryStateImplCopyWith<$Res>
    implements $HistoryStateCopyWith<$Res> {
  factory _$$HistoryStateImplCopyWith(
          _$HistoryStateImpl value, $Res Function(_$HistoryStateImpl) then) =
      __$$HistoryStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {List<ReceiptModel> items,
      ReceiptFilter filter,
      bool isFirstLoad,
      bool isLoadingMore,
      bool hasReachedEnd,
      Failure? error});

  @override
  $ReceiptFilterCopyWith<$Res> get filter;
  @override
  $FailureCopyWith<$Res>? get error;
}

/// @nodoc
class __$$HistoryStateImplCopyWithImpl<$Res>
    extends _$HistoryStateCopyWithImpl<$Res, _$HistoryStateImpl>
    implements _$$HistoryStateImplCopyWith<$Res> {
  __$$HistoryStateImplCopyWithImpl(
      _$HistoryStateImpl _value, $Res Function(_$HistoryStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? items = null,
    Object? filter = null,
    Object? isFirstLoad = null,
    Object? isLoadingMore = null,
    Object? hasReachedEnd = null,
    Object? error = freezed,
  }) {
    return _then(_$HistoryStateImpl(
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReceiptModel>,
      filter: null == filter
          ? _value.filter
          : filter // ignore: cast_nullable_to_non_nullable
              as ReceiptFilter,
      isFirstLoad: null == isFirstLoad
          ? _value.isFirstLoad
          : isFirstLoad // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoadingMore: null == isLoadingMore
          ? _value.isLoadingMore
          : isLoadingMore // ignore: cast_nullable_to_non_nullable
              as bool,
      hasReachedEnd: null == hasReachedEnd
          ? _value.hasReachedEnd
          : hasReachedEnd // ignore: cast_nullable_to_non_nullable
              as bool,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as Failure?,
    ));
  }
}

/// @nodoc

class _$HistoryStateImpl implements _HistoryState {
  const _$HistoryStateImpl(
      {final List<ReceiptModel> items = const [],
      this.filter = const ReceiptFilter(),
      this.isFirstLoad = true,
      this.isLoadingMore = false,
      this.hasReachedEnd = false,
      this.error})
      : _items = items;

  final List<ReceiptModel> _items;
  @override
  @JsonKey()
  List<ReceiptModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  @JsonKey()
  final ReceiptFilter filter;
  @override
  @JsonKey()
  final bool isFirstLoad;
  @override
  @JsonKey()
  final bool isLoadingMore;
  @override
  @JsonKey()
  final bool hasReachedEnd;
  @override
  final Failure? error;

  @override
  String toString() {
    return 'HistoryState(items: $items, filter: $filter, isFirstLoad: $isFirstLoad, isLoadingMore: $isLoadingMore, hasReachedEnd: $hasReachedEnd, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HistoryStateImpl &&
            const DeepCollectionEquality().equals(other._items, _items) &&
            (identical(other.filter, filter) || other.filter == filter) &&
            (identical(other.isFirstLoad, isFirstLoad) ||
                other.isFirstLoad == isFirstLoad) &&
            (identical(other.isLoadingMore, isLoadingMore) ||
                other.isLoadingMore == isLoadingMore) &&
            (identical(other.hasReachedEnd, hasReachedEnd) ||
                other.hasReachedEnd == hasReachedEnd) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_items),
      filter,
      isFirstLoad,
      isLoadingMore,
      hasReachedEnd,
      error);

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      __$$HistoryStateImplCopyWithImpl<_$HistoryStateImpl>(this, _$identity);
}

abstract class _HistoryState implements HistoryState {
  const factory _HistoryState(
      {final List<ReceiptModel> items,
      final ReceiptFilter filter,
      final bool isFirstLoad,
      final bool isLoadingMore,
      final bool hasReachedEnd,
      final Failure? error}) = _$HistoryStateImpl;

  @override
  List<ReceiptModel> get items;
  @override
  ReceiptFilter get filter;
  @override
  bool get isFirstLoad;
  @override
  bool get isLoadingMore;
  @override
  bool get hasReachedEnd;
  @override
  Failure? get error;

  /// Create a copy of HistoryState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HistoryStateImplCopyWith<_$HistoryStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

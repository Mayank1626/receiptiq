// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'split_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ExpenseShareBase _$ExpenseShareBaseFromJson(Map<String, dynamic> json) {
  return _ExpenseShareBase.fromJson(json);
}

/// @nodoc
mixin _$ExpenseShareBase {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_paid')
  double get amountPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_owed')
  double get amountOwed => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_share')
  double? get percentageShare => throw _privateConstructorUsedError;

  /// Serializes this ExpenseShareBase to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseShareBase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseShareBaseCopyWith<ExpenseShareBase> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseShareBaseCopyWith<$Res> {
  factory $ExpenseShareBaseCopyWith(
          ExpenseShareBase value, $Res Function(ExpenseShareBase) then) =
      _$ExpenseShareBaseCopyWithImpl<$Res, ExpenseShareBase>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'amount_paid') double amountPaid,
      @JsonKey(name: 'amount_owed') double amountOwed,
      @JsonKey(name: 'percentage_share') double? percentageShare});
}

/// @nodoc
class _$ExpenseShareBaseCopyWithImpl<$Res, $Val extends ExpenseShareBase>
    implements $ExpenseShareBaseCopyWith<$Res> {
  _$ExpenseShareBaseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseShareBase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amountPaid = null,
    Object? amountOwed = null,
    Object? percentageShare = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      amountOwed: null == amountOwed
          ? _value.amountOwed
          : amountOwed // ignore: cast_nullable_to_non_nullable
              as double,
      percentageShare: freezed == percentageShare
          ? _value.percentageShare
          : percentageShare // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseShareBaseImplCopyWith<$Res>
    implements $ExpenseShareBaseCopyWith<$Res> {
  factory _$$ExpenseShareBaseImplCopyWith(_$ExpenseShareBaseImpl value,
          $Res Function(_$ExpenseShareBaseImpl) then) =
      __$$ExpenseShareBaseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'amount_paid') double amountPaid,
      @JsonKey(name: 'amount_owed') double amountOwed,
      @JsonKey(name: 'percentage_share') double? percentageShare});
}

/// @nodoc
class __$$ExpenseShareBaseImplCopyWithImpl<$Res>
    extends _$ExpenseShareBaseCopyWithImpl<$Res, _$ExpenseShareBaseImpl>
    implements _$$ExpenseShareBaseImplCopyWith<$Res> {
  __$$ExpenseShareBaseImplCopyWithImpl(_$ExpenseShareBaseImpl _value,
      $Res Function(_$ExpenseShareBaseImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseShareBase
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amountPaid = null,
    Object? amountOwed = null,
    Object? percentageShare = freezed,
  }) {
    return _then(_$ExpenseShareBaseImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      amountOwed: null == amountOwed
          ? _value.amountOwed
          : amountOwed // ignore: cast_nullable_to_non_nullable
              as double,
      percentageShare: freezed == percentageShare
          ? _value.percentageShare
          : percentageShare // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseShareBaseImpl implements _ExpenseShareBase {
  const _$ExpenseShareBaseImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'amount_paid') this.amountPaid = 0.0,
      @JsonKey(name: 'amount_owed') required this.amountOwed,
      @JsonKey(name: 'percentage_share') this.percentageShare});

  factory _$ExpenseShareBaseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseShareBaseImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'amount_paid')
  final double amountPaid;
  @override
  @JsonKey(name: 'amount_owed')
  final double amountOwed;
  @override
  @JsonKey(name: 'percentage_share')
  final double? percentageShare;

  @override
  String toString() {
    return 'ExpenseShareBase(userId: $userId, amountPaid: $amountPaid, amountOwed: $amountOwed, percentageShare: $percentageShare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseShareBaseImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.amountOwed, amountOwed) ||
                other.amountOwed == amountOwed) &&
            (identical(other.percentageShare, percentageShare) ||
                other.percentageShare == percentageShare));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, amountPaid, amountOwed, percentageShare);

  /// Create a copy of ExpenseShareBase
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseShareBaseImplCopyWith<_$ExpenseShareBaseImpl> get copyWith =>
      __$$ExpenseShareBaseImplCopyWithImpl<_$ExpenseShareBaseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseShareBaseImplToJson(
      this,
    );
  }
}

abstract class _ExpenseShareBase implements ExpenseShareBase {
  const factory _ExpenseShareBase(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'amount_paid') final double amountPaid,
          @JsonKey(name: 'amount_owed') required final double amountOwed,
          @JsonKey(name: 'percentage_share') final double? percentageShare}) =
      _$ExpenseShareBaseImpl;

  factory _ExpenseShareBase.fromJson(Map<String, dynamic> json) =
      _$ExpenseShareBaseImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'amount_paid')
  double get amountPaid;
  @override
  @JsonKey(name: 'amount_owed')
  double get amountOwed;
  @override
  @JsonKey(name: 'percentage_share')
  double? get percentageShare;

  /// Create a copy of ExpenseShareBase
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseShareBaseImplCopyWith<_$ExpenseShareBaseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseShareCreate _$ExpenseShareCreateFromJson(Map<String, dynamic> json) {
  return _ExpenseShareCreate.fromJson(json);
}

/// @nodoc
mixin _$ExpenseShareCreate {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_paid')
  double get amountPaid => throw _privateConstructorUsedError;
  @JsonKey(name: 'amount_owed')
  double get amountOwed => throw _privateConstructorUsedError;
  @JsonKey(name: 'percentage_share')
  double? get percentageShare => throw _privateConstructorUsedError;

  /// Serializes this ExpenseShareCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseShareCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseShareCreateCopyWith<ExpenseShareCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseShareCreateCopyWith<$Res> {
  factory $ExpenseShareCreateCopyWith(
          ExpenseShareCreate value, $Res Function(ExpenseShareCreate) then) =
      _$ExpenseShareCreateCopyWithImpl<$Res, ExpenseShareCreate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'amount_paid') double amountPaid,
      @JsonKey(name: 'amount_owed') double amountOwed,
      @JsonKey(name: 'percentage_share') double? percentageShare});
}

/// @nodoc
class _$ExpenseShareCreateCopyWithImpl<$Res, $Val extends ExpenseShareCreate>
    implements $ExpenseShareCreateCopyWith<$Res> {
  _$ExpenseShareCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseShareCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amountPaid = null,
    Object? amountOwed = null,
    Object? percentageShare = freezed,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      amountOwed: null == amountOwed
          ? _value.amountOwed
          : amountOwed // ignore: cast_nullable_to_non_nullable
              as double,
      percentageShare: freezed == percentageShare
          ? _value.percentageShare
          : percentageShare // ignore: cast_nullable_to_non_nullable
              as double?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseShareCreateImplCopyWith<$Res>
    implements $ExpenseShareCreateCopyWith<$Res> {
  factory _$$ExpenseShareCreateImplCopyWith(_$ExpenseShareCreateImpl value,
          $Res Function(_$ExpenseShareCreateImpl) then) =
      __$$ExpenseShareCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'amount_paid') double amountPaid,
      @JsonKey(name: 'amount_owed') double amountOwed,
      @JsonKey(name: 'percentage_share') double? percentageShare});
}

/// @nodoc
class __$$ExpenseShareCreateImplCopyWithImpl<$Res>
    extends _$ExpenseShareCreateCopyWithImpl<$Res, _$ExpenseShareCreateImpl>
    implements _$$ExpenseShareCreateImplCopyWith<$Res> {
  __$$ExpenseShareCreateImplCopyWithImpl(_$ExpenseShareCreateImpl _value,
      $Res Function(_$ExpenseShareCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseShareCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? amountPaid = null,
    Object? amountOwed = null,
    Object? percentageShare = freezed,
  }) {
    return _then(_$ExpenseShareCreateImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      amountPaid: null == amountPaid
          ? _value.amountPaid
          : amountPaid // ignore: cast_nullable_to_non_nullable
              as double,
      amountOwed: null == amountOwed
          ? _value.amountOwed
          : amountOwed // ignore: cast_nullable_to_non_nullable
              as double,
      percentageShare: freezed == percentageShare
          ? _value.percentageShare
          : percentageShare // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseShareCreateImpl implements _ExpenseShareCreate {
  const _$ExpenseShareCreateImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'amount_paid') this.amountPaid = 0.0,
      @JsonKey(name: 'amount_owed') required this.amountOwed,
      @JsonKey(name: 'percentage_share') this.percentageShare});

  factory _$ExpenseShareCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseShareCreateImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'amount_paid')
  final double amountPaid;
  @override
  @JsonKey(name: 'amount_owed')
  final double amountOwed;
  @override
  @JsonKey(name: 'percentage_share')
  final double? percentageShare;

  @override
  String toString() {
    return 'ExpenseShareCreate(userId: $userId, amountPaid: $amountPaid, amountOwed: $amountOwed, percentageShare: $percentageShare)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseShareCreateImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.amountPaid, amountPaid) ||
                other.amountPaid == amountPaid) &&
            (identical(other.amountOwed, amountOwed) ||
                other.amountOwed == amountOwed) &&
            (identical(other.percentageShare, percentageShare) ||
                other.percentageShare == percentageShare));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, amountPaid, amountOwed, percentageShare);

  /// Create a copy of ExpenseShareCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseShareCreateImplCopyWith<_$ExpenseShareCreateImpl> get copyWith =>
      __$$ExpenseShareCreateImplCopyWithImpl<_$ExpenseShareCreateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseShareCreateImplToJson(
      this,
    );
  }
}

abstract class _ExpenseShareCreate implements ExpenseShareCreate {
  const factory _ExpenseShareCreate(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'amount_paid') final double amountPaid,
          @JsonKey(name: 'amount_owed') required final double amountOwed,
          @JsonKey(name: 'percentage_share') final double? percentageShare}) =
      _$ExpenseShareCreateImpl;

  factory _ExpenseShareCreate.fromJson(Map<String, dynamic> json) =
      _$ExpenseShareCreateImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'amount_paid')
  double get amountPaid;
  @override
  @JsonKey(name: 'amount_owed')
  double get amountOwed;
  @override
  @JsonKey(name: 'percentage_share')
  double? get percentageShare;

  /// Create a copy of ExpenseShareCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseShareCreateImplCopyWith<_$ExpenseShareCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ExpenseSplitCreate _$ExpenseSplitCreateFromJson(Map<String, dynamic> json) {
  return _ExpenseSplitCreate.fromJson(json);
}

/// @nodoc
mixin _$ExpenseSplitCreate {
  @JsonKey(name: 'split_type')
  SplitType get splitType => throw _privateConstructorUsedError;
  List<ExpenseShareCreate> get shares => throw _privateConstructorUsedError;

  /// Serializes this ExpenseSplitCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ExpenseSplitCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ExpenseSplitCreateCopyWith<ExpenseSplitCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExpenseSplitCreateCopyWith<$Res> {
  factory $ExpenseSplitCreateCopyWith(
          ExpenseSplitCreate value, $Res Function(ExpenseSplitCreate) then) =
      _$ExpenseSplitCreateCopyWithImpl<$Res, ExpenseSplitCreate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'split_type') SplitType splitType,
      List<ExpenseShareCreate> shares});
}

/// @nodoc
class _$ExpenseSplitCreateCopyWithImpl<$Res, $Val extends ExpenseSplitCreate>
    implements $ExpenseSplitCreateCopyWith<$Res> {
  _$ExpenseSplitCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ExpenseSplitCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitType = null,
    Object? shares = null,
  }) {
    return _then(_value.copyWith(
      splitType: null == splitType
          ? _value.splitType
          : splitType // ignore: cast_nullable_to_non_nullable
              as SplitType,
      shares: null == shares
          ? _value.shares
          : shares // ignore: cast_nullable_to_non_nullable
              as List<ExpenseShareCreate>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExpenseSplitCreateImplCopyWith<$Res>
    implements $ExpenseSplitCreateCopyWith<$Res> {
  factory _$$ExpenseSplitCreateImplCopyWith(_$ExpenseSplitCreateImpl value,
          $Res Function(_$ExpenseSplitCreateImpl) then) =
      __$$ExpenseSplitCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'split_type') SplitType splitType,
      List<ExpenseShareCreate> shares});
}

/// @nodoc
class __$$ExpenseSplitCreateImplCopyWithImpl<$Res>
    extends _$ExpenseSplitCreateCopyWithImpl<$Res, _$ExpenseSplitCreateImpl>
    implements _$$ExpenseSplitCreateImplCopyWith<$Res> {
  __$$ExpenseSplitCreateImplCopyWithImpl(_$ExpenseSplitCreateImpl _value,
      $Res Function(_$ExpenseSplitCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of ExpenseSplitCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? splitType = null,
    Object? shares = null,
  }) {
    return _then(_$ExpenseSplitCreateImpl(
      splitType: null == splitType
          ? _value.splitType
          : splitType // ignore: cast_nullable_to_non_nullable
              as SplitType,
      shares: null == shares
          ? _value._shares
          : shares // ignore: cast_nullable_to_non_nullable
              as List<ExpenseShareCreate>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExpenseSplitCreateImpl implements _ExpenseSplitCreate {
  const _$ExpenseSplitCreateImpl(
      {@JsonKey(name: 'split_type') required this.splitType,
      required final List<ExpenseShareCreate> shares})
      : _shares = shares;

  factory _$ExpenseSplitCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExpenseSplitCreateImplFromJson(json);

  @override
  @JsonKey(name: 'split_type')
  final SplitType splitType;
  final List<ExpenseShareCreate> _shares;
  @override
  List<ExpenseShareCreate> get shares {
    if (_shares is EqualUnmodifiableListView) return _shares;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_shares);
  }

  @override
  String toString() {
    return 'ExpenseSplitCreate(splitType: $splitType, shares: $shares)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExpenseSplitCreateImpl &&
            (identical(other.splitType, splitType) ||
                other.splitType == splitType) &&
            const DeepCollectionEquality().equals(other._shares, _shares));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, splitType, const DeepCollectionEquality().hash(_shares));

  /// Create a copy of ExpenseSplitCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ExpenseSplitCreateImplCopyWith<_$ExpenseSplitCreateImpl> get copyWith =>
      __$$ExpenseSplitCreateImplCopyWithImpl<_$ExpenseSplitCreateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExpenseSplitCreateImplToJson(
      this,
    );
  }
}

abstract class _ExpenseSplitCreate implements ExpenseSplitCreate {
  const factory _ExpenseSplitCreate(
          {@JsonKey(name: 'split_type') required final SplitType splitType,
          required final List<ExpenseShareCreate> shares}) =
      _$ExpenseSplitCreateImpl;

  factory _ExpenseSplitCreate.fromJson(Map<String, dynamic> json) =
      _$ExpenseSplitCreateImpl.fromJson;

  @override
  @JsonKey(name: 'split_type')
  SplitType get splitType;
  @override
  List<ExpenseShareCreate> get shares;

  /// Create a copy of ExpenseSplitCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ExpenseSplitCreateImplCopyWith<_$ExpenseSplitCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserBalance _$UserBalanceFromJson(Map<String, dynamic> json) {
  return _UserBalance.fromJson(json);
}

/// @nodoc
mixin _$UserBalance {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  @JsonKey(name: 'net_balance')
  double get netBalance => throw _privateConstructorUsedError;

  /// Serializes this UserBalance to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserBalanceCopyWith<UserBalance> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserBalanceCopyWith<$Res> {
  factory $UserBalanceCopyWith(
          UserBalance value, $Res Function(UserBalance) then) =
      _$UserBalanceCopyWithImpl<$Res, UserBalance>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'net_balance') double netBalance});
}

/// @nodoc
class _$UserBalanceCopyWithImpl<$Res, $Val extends UserBalance>
    implements $UserBalanceCopyWith<$Res> {
  _$UserBalanceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? netBalance = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      netBalance: null == netBalance
          ? _value.netBalance
          : netBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserBalanceImplCopyWith<$Res>
    implements $UserBalanceCopyWith<$Res> {
  factory _$$UserBalanceImplCopyWith(
          _$UserBalanceImpl value, $Res Function(_$UserBalanceImpl) then) =
      __$$UserBalanceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      @JsonKey(name: 'net_balance') double netBalance});
}

/// @nodoc
class __$$UserBalanceImplCopyWithImpl<$Res>
    extends _$UserBalanceCopyWithImpl<$Res, _$UserBalanceImpl>
    implements _$$UserBalanceImplCopyWith<$Res> {
  __$$UserBalanceImplCopyWithImpl(
      _$UserBalanceImpl _value, $Res Function(_$UserBalanceImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? netBalance = null,
  }) {
    return _then(_$UserBalanceImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      netBalance: null == netBalance
          ? _value.netBalance
          : netBalance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserBalanceImpl implements _UserBalance {
  const _$UserBalanceImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      @JsonKey(name: 'net_balance') required this.netBalance});

  factory _$UserBalanceImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserBalanceImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  @JsonKey(name: 'net_balance')
  final double netBalance;

  @override
  String toString() {
    return 'UserBalance(userId: $userId, netBalance: $netBalance)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserBalanceImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.netBalance, netBalance) ||
                other.netBalance == netBalance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, netBalance);

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      __$$UserBalanceImplCopyWithImpl<_$UserBalanceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserBalanceImplToJson(
      this,
    );
  }
}

abstract class _UserBalance implements UserBalance {
  const factory _UserBalance(
          {@JsonKey(name: 'user_id') required final String userId,
          @JsonKey(name: 'net_balance') required final double netBalance}) =
      _$UserBalanceImpl;

  factory _UserBalance.fromJson(Map<String, dynamic> json) =
      _$UserBalanceImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  @JsonKey(name: 'net_balance')
  double get netBalance;

  /// Create a copy of UserBalance
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserBalanceImplCopyWith<_$UserBalanceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SuggestedSettlementResponse _$SuggestedSettlementResponseFromJson(
    Map<String, dynamic> json) {
  return _SuggestedSettlementResponse.fromJson(json);
}

/// @nodoc
mixin _$SuggestedSettlementResponse {
  @JsonKey(name: 'payer_id')
  String get payerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payee_id')
  String get payeeId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this SuggestedSettlementResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SuggestedSettlementResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SuggestedSettlementResponseCopyWith<SuggestedSettlementResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SuggestedSettlementResponseCopyWith<$Res> {
  factory $SuggestedSettlementResponseCopyWith(
          SuggestedSettlementResponse value,
          $Res Function(SuggestedSettlementResponse) then) =
      _$SuggestedSettlementResponseCopyWithImpl<$Res,
          SuggestedSettlementResponse>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payer_id') String payerId,
      @JsonKey(name: 'payee_id') String payeeId,
      double amount});
}

/// @nodoc
class _$SuggestedSettlementResponseCopyWithImpl<$Res,
        $Val extends SuggestedSettlementResponse>
    implements $SuggestedSettlementResponseCopyWith<$Res> {
  _$SuggestedSettlementResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SuggestedSettlementResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payerId = null,
    Object? payeeId = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as String,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SuggestedSettlementResponseImplCopyWith<$Res>
    implements $SuggestedSettlementResponseCopyWith<$Res> {
  factory _$$SuggestedSettlementResponseImplCopyWith(
          _$SuggestedSettlementResponseImpl value,
          $Res Function(_$SuggestedSettlementResponseImpl) then) =
      __$$SuggestedSettlementResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payer_id') String payerId,
      @JsonKey(name: 'payee_id') String payeeId,
      double amount});
}

/// @nodoc
class __$$SuggestedSettlementResponseImplCopyWithImpl<$Res>
    extends _$SuggestedSettlementResponseCopyWithImpl<$Res,
        _$SuggestedSettlementResponseImpl>
    implements _$$SuggestedSettlementResponseImplCopyWith<$Res> {
  __$$SuggestedSettlementResponseImplCopyWithImpl(
      _$SuggestedSettlementResponseImpl _value,
      $Res Function(_$SuggestedSettlementResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of SuggestedSettlementResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payerId = null,
    Object? payeeId = null,
    Object? amount = null,
  }) {
    return _then(_$SuggestedSettlementResponseImpl(
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as String,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SuggestedSettlementResponseImpl
    implements _SuggestedSettlementResponse {
  const _$SuggestedSettlementResponseImpl(
      {@JsonKey(name: 'payer_id') required this.payerId,
      @JsonKey(name: 'payee_id') required this.payeeId,
      required this.amount});

  factory _$SuggestedSettlementResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$SuggestedSettlementResponseImplFromJson(json);

  @override
  @JsonKey(name: 'payer_id')
  final String payerId;
  @override
  @JsonKey(name: 'payee_id')
  final String payeeId;
  @override
  final double amount;

  @override
  String toString() {
    return 'SuggestedSettlementResponse(payerId: $payerId, payeeId: $payeeId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SuggestedSettlementResponseImpl &&
            (identical(other.payerId, payerId) || other.payerId == payerId) &&
            (identical(other.payeeId, payeeId) || other.payeeId == payeeId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, payerId, payeeId, amount);

  /// Create a copy of SuggestedSettlementResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SuggestedSettlementResponseImplCopyWith<_$SuggestedSettlementResponseImpl>
      get copyWith => __$$SuggestedSettlementResponseImplCopyWithImpl<
          _$SuggestedSettlementResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SuggestedSettlementResponseImplToJson(
      this,
    );
  }
}

abstract class _SuggestedSettlementResponse
    implements SuggestedSettlementResponse {
  const factory _SuggestedSettlementResponse(
      {@JsonKey(name: 'payer_id') required final String payerId,
      @JsonKey(name: 'payee_id') required final String payeeId,
      required final double amount}) = _$SuggestedSettlementResponseImpl;

  factory _SuggestedSettlementResponse.fromJson(Map<String, dynamic> json) =
      _$SuggestedSettlementResponseImpl.fromJson;

  @override
  @JsonKey(name: 'payer_id')
  String get payerId;
  @override
  @JsonKey(name: 'payee_id')
  String get payeeId;
  @override
  double get amount;

  /// Create a copy of SuggestedSettlementResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SuggestedSettlementResponseImplCopyWith<_$SuggestedSettlementResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}

SettlementCreate _$SettlementCreateFromJson(Map<String, dynamic> json) {
  return _SettlementCreate.fromJson(json);
}

/// @nodoc
mixin _$SettlementCreate {
  @JsonKey(name: 'payer_id')
  String get payerId => throw _privateConstructorUsedError;
  @JsonKey(name: 'payee_id')
  String get payeeId => throw _privateConstructorUsedError;
  double get amount => throw _privateConstructorUsedError;

  /// Serializes this SettlementCreate to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SettlementCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SettlementCreateCopyWith<SettlementCreate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SettlementCreateCopyWith<$Res> {
  factory $SettlementCreateCopyWith(
          SettlementCreate value, $Res Function(SettlementCreate) then) =
      _$SettlementCreateCopyWithImpl<$Res, SettlementCreate>;
  @useResult
  $Res call(
      {@JsonKey(name: 'payer_id') String payerId,
      @JsonKey(name: 'payee_id') String payeeId,
      double amount});
}

/// @nodoc
class _$SettlementCreateCopyWithImpl<$Res, $Val extends SettlementCreate>
    implements $SettlementCreateCopyWith<$Res> {
  _$SettlementCreateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SettlementCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payerId = null,
    Object? payeeId = null,
    Object? amount = null,
  }) {
    return _then(_value.copyWith(
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as String,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SettlementCreateImplCopyWith<$Res>
    implements $SettlementCreateCopyWith<$Res> {
  factory _$$SettlementCreateImplCopyWith(_$SettlementCreateImpl value,
          $Res Function(_$SettlementCreateImpl) then) =
      __$$SettlementCreateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'payer_id') String payerId,
      @JsonKey(name: 'payee_id') String payeeId,
      double amount});
}

/// @nodoc
class __$$SettlementCreateImplCopyWithImpl<$Res>
    extends _$SettlementCreateCopyWithImpl<$Res, _$SettlementCreateImpl>
    implements _$$SettlementCreateImplCopyWith<$Res> {
  __$$SettlementCreateImplCopyWithImpl(_$SettlementCreateImpl _value,
      $Res Function(_$SettlementCreateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SettlementCreate
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? payerId = null,
    Object? payeeId = null,
    Object? amount = null,
  }) {
    return _then(_$SettlementCreateImpl(
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as String,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SettlementCreateImpl implements _SettlementCreate {
  const _$SettlementCreateImpl(
      {@JsonKey(name: 'payer_id') required this.payerId,
      @JsonKey(name: 'payee_id') required this.payeeId,
      required this.amount});

  factory _$SettlementCreateImpl.fromJson(Map<String, dynamic> json) =>
      _$$SettlementCreateImplFromJson(json);

  @override
  @JsonKey(name: 'payer_id')
  final String payerId;
  @override
  @JsonKey(name: 'payee_id')
  final String payeeId;
  @override
  final double amount;

  @override
  String toString() {
    return 'SettlementCreate(payerId: $payerId, payeeId: $payeeId, amount: $amount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SettlementCreateImpl &&
            (identical(other.payerId, payerId) || other.payerId == payerId) &&
            (identical(other.payeeId, payeeId) || other.payeeId == payeeId) &&
            (identical(other.amount, amount) || other.amount == amount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, payerId, payeeId, amount);

  /// Create a copy of SettlementCreate
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SettlementCreateImplCopyWith<_$SettlementCreateImpl> get copyWith =>
      __$$SettlementCreateImplCopyWithImpl<_$SettlementCreateImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SettlementCreateImplToJson(
      this,
    );
  }
}

abstract class _SettlementCreate implements SettlementCreate {
  const factory _SettlementCreate(
      {@JsonKey(name: 'payer_id') required final String payerId,
      @JsonKey(name: 'payee_id') required final String payeeId,
      required final double amount}) = _$SettlementCreateImpl;

  factory _SettlementCreate.fromJson(Map<String, dynamic> json) =
      _$SettlementCreateImpl.fromJson;

  @override
  @JsonKey(name: 'payer_id')
  String get payerId;
  @override
  @JsonKey(name: 'payee_id')
  String get payeeId;
  @override
  double get amount;

  /// Create a copy of SettlementCreate
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SettlementCreateImplCopyWith<_$SettlementCreateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LedgerEntry _$LedgerEntryFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'split':
      return LedgerSplitEntry.fromJson(json);
    case 'settlement':
      return LedgerSettlementEntry.fromJson(json);

    default:
      throw CheckedFromJsonException(
          json, 'type', 'LedgerEntry', 'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
mixin _$LedgerEntry {
  String get id => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)
        split,
    required TResult Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)
        settlement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)?
        split,
    TResult? Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)?
        settlement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)?
        split,
    TResult Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)?
        settlement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LedgerSplitEntry value) split,
    required TResult Function(LedgerSettlementEntry value) settlement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LedgerSplitEntry value)? split,
    TResult? Function(LedgerSettlementEntry value)? settlement,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LedgerSplitEntry value)? split,
    TResult Function(LedgerSettlementEntry value)? settlement,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this LedgerEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LedgerEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LedgerEntryCopyWith<LedgerEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerEntryCopyWith<$Res> {
  factory $LedgerEntryCopyWith(
          LedgerEntry value, $Res Function(LedgerEntry) then) =
      _$LedgerEntryCopyWithImpl<$Res, LedgerEntry>;
  @useResult
  $Res call({String id, DateTime timestamp});
}

/// @nodoc
class _$LedgerEntryCopyWithImpl<$Res, $Val extends LedgerEntry>
    implements $LedgerEntryCopyWith<$Res> {
  _$LedgerEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LedgerEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? timestamp = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LedgerSplitEntryImplCopyWith<$Res>
    implements $LedgerEntryCopyWith<$Res> {
  factory _$$LedgerSplitEntryImplCopyWith(_$LedgerSplitEntryImpl value,
          $Res Function(_$LedgerSplitEntryImpl) then) =
      __$$LedgerSplitEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'receipt_id') String receiptId,
      @JsonKey(name: 'total_amount') double totalAmount,
      @JsonKey(name: 'split_type') SplitType splitType,
      DateTime timestamp});
}

/// @nodoc
class __$$LedgerSplitEntryImplCopyWithImpl<$Res>
    extends _$LedgerEntryCopyWithImpl<$Res, _$LedgerSplitEntryImpl>
    implements _$$LedgerSplitEntryImplCopyWith<$Res> {
  __$$LedgerSplitEntryImplCopyWithImpl(_$LedgerSplitEntryImpl _value,
      $Res Function(_$LedgerSplitEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptId = null,
    Object? totalAmount = null,
    Object? splitType = null,
    Object? timestamp = null,
  }) {
    return _then(_$LedgerSplitEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiptId: null == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
      totalAmount: null == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      splitType: null == splitType
          ? _value.splitType
          : splitType // ignore: cast_nullable_to_non_nullable
              as SplitType,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedgerSplitEntryImpl implements LedgerSplitEntry {
  const _$LedgerSplitEntryImpl(
      {required this.id,
      @JsonKey(name: 'receipt_id') required this.receiptId,
      @JsonKey(name: 'total_amount') required this.totalAmount,
      @JsonKey(name: 'split_type') required this.splitType,
      required this.timestamp,
      final String? $type})
      : $type = $type ?? 'split';

  factory _$LedgerSplitEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerSplitEntryImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'receipt_id')
  final String receiptId;
  @override
  @JsonKey(name: 'total_amount')
  final double totalAmount;
  @override
  @JsonKey(name: 'split_type')
  final SplitType splitType;
  @override
  final DateTime timestamp;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LedgerEntry.split(id: $id, receiptId: $receiptId, totalAmount: $totalAmount, splitType: $splitType, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerSplitEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.splitType, splitType) ||
                other.splitType == splitType) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, receiptId, totalAmount, splitType, timestamp);

  /// Create a copy of LedgerEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerSplitEntryImplCopyWith<_$LedgerSplitEntryImpl> get copyWith =>
      __$$LedgerSplitEntryImplCopyWithImpl<_$LedgerSplitEntryImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)
        split,
    required TResult Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)
        settlement,
  }) {
    return split(id, receiptId, totalAmount, splitType, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)?
        split,
    TResult? Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)?
        settlement,
  }) {
    return split?.call(id, receiptId, totalAmount, splitType, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)?
        split,
    TResult Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)?
        settlement,
    required TResult orElse(),
  }) {
    if (split != null) {
      return split(id, receiptId, totalAmount, splitType, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LedgerSplitEntry value) split,
    required TResult Function(LedgerSettlementEntry value) settlement,
  }) {
    return split(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LedgerSplitEntry value)? split,
    TResult? Function(LedgerSettlementEntry value)? settlement,
  }) {
    return split?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LedgerSplitEntry value)? split,
    TResult Function(LedgerSettlementEntry value)? settlement,
    required TResult orElse(),
  }) {
    if (split != null) {
      return split(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LedgerSplitEntryImplToJson(
      this,
    );
  }
}

abstract class LedgerSplitEntry implements LedgerEntry {
  const factory LedgerSplitEntry(
      {required final String id,
      @JsonKey(name: 'receipt_id') required final String receiptId,
      @JsonKey(name: 'total_amount') required final double totalAmount,
      @JsonKey(name: 'split_type') required final SplitType splitType,
      required final DateTime timestamp}) = _$LedgerSplitEntryImpl;

  factory LedgerSplitEntry.fromJson(Map<String, dynamic> json) =
      _$LedgerSplitEntryImpl.fromJson;

  @override
  String get id;
  @JsonKey(name: 'receipt_id')
  String get receiptId;
  @JsonKey(name: 'total_amount')
  double get totalAmount;
  @JsonKey(name: 'split_type')
  SplitType get splitType;
  @override
  DateTime get timestamp;

  /// Create a copy of LedgerEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LedgerSplitEntryImplCopyWith<_$LedgerSplitEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$LedgerSettlementEntryImplCopyWith<$Res>
    implements $LedgerEntryCopyWith<$Res> {
  factory _$$LedgerSettlementEntryImplCopyWith(
          _$LedgerSettlementEntryImpl value,
          $Res Function(_$LedgerSettlementEntryImpl) then) =
      __$$LedgerSettlementEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'payer_id') String payerId,
      @JsonKey(name: 'payee_id') String payeeId,
      double amount,
      DateTime timestamp});
}

/// @nodoc
class __$$LedgerSettlementEntryImplCopyWithImpl<$Res>
    extends _$LedgerEntryCopyWithImpl<$Res, _$LedgerSettlementEntryImpl>
    implements _$$LedgerSettlementEntryImplCopyWith<$Res> {
  __$$LedgerSettlementEntryImplCopyWithImpl(_$LedgerSettlementEntryImpl _value,
      $Res Function(_$LedgerSettlementEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? payerId = null,
    Object? payeeId = null,
    Object? amount = null,
    Object? timestamp = null,
  }) {
    return _then(_$LedgerSettlementEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      payerId: null == payerId
          ? _value.payerId
          : payerId // ignore: cast_nullable_to_non_nullable
              as String,
      payeeId: null == payeeId
          ? _value.payeeId
          : payeeId // ignore: cast_nullable_to_non_nullable
              as String,
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedgerSettlementEntryImpl implements LedgerSettlementEntry {
  const _$LedgerSettlementEntryImpl(
      {required this.id,
      @JsonKey(name: 'payer_id') required this.payerId,
      @JsonKey(name: 'payee_id') required this.payeeId,
      required this.amount,
      required this.timestamp,
      final String? $type})
      : $type = $type ?? 'settlement';

  factory _$LedgerSettlementEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerSettlementEntryImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'payer_id')
  final String payerId;
  @override
  @JsonKey(name: 'payee_id')
  final String payeeId;
  @override
  final double amount;
  @override
  final DateTime timestamp;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'LedgerEntry.settlement(id: $id, payerId: $payerId, payeeId: $payeeId, amount: $amount, timestamp: $timestamp)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerSettlementEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.payerId, payerId) || other.payerId == payerId) &&
            (identical(other.payeeId, payeeId) || other.payeeId == payeeId) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, payerId, payeeId, amount, timestamp);

  /// Create a copy of LedgerEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerSettlementEntryImplCopyWith<_$LedgerSettlementEntryImpl>
      get copyWith => __$$LedgerSettlementEntryImplCopyWithImpl<
          _$LedgerSettlementEntryImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)
        split,
    required TResult Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)
        settlement,
  }) {
    return settlement(id, payerId, payeeId, amount, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)?
        split,
    TResult? Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)?
        settlement,
  }) {
    return settlement?.call(id, payerId, payeeId, amount, timestamp);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            String id,
            @JsonKey(name: 'receipt_id') String receiptId,
            @JsonKey(name: 'total_amount') double totalAmount,
            @JsonKey(name: 'split_type') SplitType splitType,
            DateTime timestamp)?
        split,
    TResult Function(
            String id,
            @JsonKey(name: 'payer_id') String payerId,
            @JsonKey(name: 'payee_id') String payeeId,
            double amount,
            DateTime timestamp)?
        settlement,
    required TResult orElse(),
  }) {
    if (settlement != null) {
      return settlement(id, payerId, payeeId, amount, timestamp);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(LedgerSplitEntry value) split,
    required TResult Function(LedgerSettlementEntry value) settlement,
  }) {
    return settlement(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(LedgerSplitEntry value)? split,
    TResult? Function(LedgerSettlementEntry value)? settlement,
  }) {
    return settlement?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(LedgerSplitEntry value)? split,
    TResult Function(LedgerSettlementEntry value)? settlement,
    required TResult orElse(),
  }) {
    if (settlement != null) {
      return settlement(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$LedgerSettlementEntryImplToJson(
      this,
    );
  }
}

abstract class LedgerSettlementEntry implements LedgerEntry {
  const factory LedgerSettlementEntry(
      {required final String id,
      @JsonKey(name: 'payer_id') required final String payerId,
      @JsonKey(name: 'payee_id') required final String payeeId,
      required final double amount,
      required final DateTime timestamp}) = _$LedgerSettlementEntryImpl;

  factory LedgerSettlementEntry.fromJson(Map<String, dynamic> json) =
      _$LedgerSettlementEntryImpl.fromJson;

  @override
  String get id;
  @JsonKey(name: 'payer_id')
  String get payerId;
  @JsonKey(name: 'payee_id')
  String get payeeId;
  double get amount;
  @override
  DateTime get timestamp;

  /// Create a copy of LedgerEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LedgerSettlementEntryImplCopyWith<_$LedgerSettlementEntryImpl>
      get copyWith => throw _privateConstructorUsedError;
}

LedgerResponse _$LedgerResponseFromJson(Map<String, dynamic> json) {
  return _LedgerResponse.fromJson(json);
}

/// @nodoc
mixin _$LedgerResponse {
  List<LedgerEntry> get entries => throw _privateConstructorUsedError;

  /// Serializes this LedgerResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of LedgerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $LedgerResponseCopyWith<LedgerResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LedgerResponseCopyWith<$Res> {
  factory $LedgerResponseCopyWith(
          LedgerResponse value, $Res Function(LedgerResponse) then) =
      _$LedgerResponseCopyWithImpl<$Res, LedgerResponse>;
  @useResult
  $Res call({List<LedgerEntry> entries});
}

/// @nodoc
class _$LedgerResponseCopyWithImpl<$Res, $Val extends LedgerResponse>
    implements $LedgerResponseCopyWith<$Res> {
  _$LedgerResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of LedgerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
  }) {
    return _then(_value.copyWith(
      entries: null == entries
          ? _value.entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<LedgerEntry>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LedgerResponseImplCopyWith<$Res>
    implements $LedgerResponseCopyWith<$Res> {
  factory _$$LedgerResponseImplCopyWith(_$LedgerResponseImpl value,
          $Res Function(_$LedgerResponseImpl) then) =
      __$$LedgerResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<LedgerEntry> entries});
}

/// @nodoc
class __$$LedgerResponseImplCopyWithImpl<$Res>
    extends _$LedgerResponseCopyWithImpl<$Res, _$LedgerResponseImpl>
    implements _$$LedgerResponseImplCopyWith<$Res> {
  __$$LedgerResponseImplCopyWithImpl(
      _$LedgerResponseImpl _value, $Res Function(_$LedgerResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of LedgerResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? entries = null,
  }) {
    return _then(_$LedgerResponseImpl(
      entries: null == entries
          ? _value._entries
          : entries // ignore: cast_nullable_to_non_nullable
              as List<LedgerEntry>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LedgerResponseImpl implements _LedgerResponse {
  const _$LedgerResponseImpl({required final List<LedgerEntry> entries})
      : _entries = entries;

  factory _$LedgerResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LedgerResponseImplFromJson(json);

  final List<LedgerEntry> _entries;
  @override
  List<LedgerEntry> get entries {
    if (_entries is EqualUnmodifiableListView) return _entries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entries);
  }

  @override
  String toString() {
    return 'LedgerResponse(entries: $entries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LedgerResponseImpl &&
            const DeepCollectionEquality().equals(other._entries, _entries));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_entries));

  /// Create a copy of LedgerResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$LedgerResponseImplCopyWith<_$LedgerResponseImpl> get copyWith =>
      __$$LedgerResponseImplCopyWithImpl<_$LedgerResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LedgerResponseImplToJson(
      this,
    );
  }
}

abstract class _LedgerResponse implements LedgerResponse {
  const factory _LedgerResponse({required final List<LedgerEntry> entries}) =
      _$LedgerResponseImpl;

  factory _LedgerResponse.fromJson(Map<String, dynamic> json) =
      _$LedgerResponseImpl.fromJson;

  @override
  List<LedgerEntry> get entries;

  /// Create a copy of LedgerResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$LedgerResponseImplCopyWith<_$LedgerResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$SplitState {
  ApiState<List<UserBalance>> get balances =>
      throw _privateConstructorUsedError;
  ApiState<List<SuggestedSettlementResponse>> get settlements =>
      throw _privateConstructorUsedError;
  ApiState<LedgerResponse> get ledger => throw _privateConstructorUsedError;
  bool get isCompletingSettlement => throw _privateConstructorUsedError;
  bool get isSplitting => throw _privateConstructorUsedError;

  /// Create a copy of SplitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SplitStateCopyWith<SplitState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SplitStateCopyWith<$Res> {
  factory $SplitStateCopyWith(
          SplitState value, $Res Function(SplitState) then) =
      _$SplitStateCopyWithImpl<$Res, SplitState>;
  @useResult
  $Res call(
      {ApiState<List<UserBalance>> balances,
      ApiState<List<SuggestedSettlementResponse>> settlements,
      ApiState<LedgerResponse> ledger,
      bool isCompletingSettlement,
      bool isSplitting});

  $ApiStateCopyWith<List<UserBalance>, $Res> get balances;
  $ApiStateCopyWith<List<SuggestedSettlementResponse>, $Res> get settlements;
  $ApiStateCopyWith<LedgerResponse, $Res> get ledger;
}

/// @nodoc
class _$SplitStateCopyWithImpl<$Res, $Val extends SplitState>
    implements $SplitStateCopyWith<$Res> {
  _$SplitStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of SplitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balances = null,
    Object? settlements = null,
    Object? ledger = null,
    Object? isCompletingSettlement = null,
    Object? isSplitting = null,
  }) {
    return _then(_value.copyWith(
      balances: null == balances
          ? _value.balances
          : balances // ignore: cast_nullable_to_non_nullable
              as ApiState<List<UserBalance>>,
      settlements: null == settlements
          ? _value.settlements
          : settlements // ignore: cast_nullable_to_non_nullable
              as ApiState<List<SuggestedSettlementResponse>>,
      ledger: null == ledger
          ? _value.ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as ApiState<LedgerResponse>,
      isCompletingSettlement: null == isCompletingSettlement
          ? _value.isCompletingSettlement
          : isCompletingSettlement // ignore: cast_nullable_to_non_nullable
              as bool,
      isSplitting: null == isSplitting
          ? _value.isSplitting
          : isSplitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of SplitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<UserBalance>, $Res> get balances {
    return $ApiStateCopyWith<List<UserBalance>, $Res>(_value.balances, (value) {
      return _then(_value.copyWith(balances: value) as $Val);
    });
  }

  /// Create a copy of SplitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<SuggestedSettlementResponse>, $Res> get settlements {
    return $ApiStateCopyWith<List<SuggestedSettlementResponse>, $Res>(
        _value.settlements, (value) {
      return _then(_value.copyWith(settlements: value) as $Val);
    });
  }

  /// Create a copy of SplitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<LedgerResponse, $Res> get ledger {
    return $ApiStateCopyWith<LedgerResponse, $Res>(_value.ledger, (value) {
      return _then(_value.copyWith(ledger: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$SplitStateImplCopyWith<$Res>
    implements $SplitStateCopyWith<$Res> {
  factory _$$SplitStateImplCopyWith(
          _$SplitStateImpl value, $Res Function(_$SplitStateImpl) then) =
      __$$SplitStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiState<List<UserBalance>> balances,
      ApiState<List<SuggestedSettlementResponse>> settlements,
      ApiState<LedgerResponse> ledger,
      bool isCompletingSettlement,
      bool isSplitting});

  @override
  $ApiStateCopyWith<List<UserBalance>, $Res> get balances;
  @override
  $ApiStateCopyWith<List<SuggestedSettlementResponse>, $Res> get settlements;
  @override
  $ApiStateCopyWith<LedgerResponse, $Res> get ledger;
}

/// @nodoc
class __$$SplitStateImplCopyWithImpl<$Res>
    extends _$SplitStateCopyWithImpl<$Res, _$SplitStateImpl>
    implements _$$SplitStateImplCopyWith<$Res> {
  __$$SplitStateImplCopyWithImpl(
      _$SplitStateImpl _value, $Res Function(_$SplitStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of SplitState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? balances = null,
    Object? settlements = null,
    Object? ledger = null,
    Object? isCompletingSettlement = null,
    Object? isSplitting = null,
  }) {
    return _then(_$SplitStateImpl(
      balances: null == balances
          ? _value.balances
          : balances // ignore: cast_nullable_to_non_nullable
              as ApiState<List<UserBalance>>,
      settlements: null == settlements
          ? _value.settlements
          : settlements // ignore: cast_nullable_to_non_nullable
              as ApiState<List<SuggestedSettlementResponse>>,
      ledger: null == ledger
          ? _value.ledger
          : ledger // ignore: cast_nullable_to_non_nullable
              as ApiState<LedgerResponse>,
      isCompletingSettlement: null == isCompletingSettlement
          ? _value.isCompletingSettlement
          : isCompletingSettlement // ignore: cast_nullable_to_non_nullable
              as bool,
      isSplitting: null == isSplitting
          ? _value.isSplitting
          : isSplitting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$SplitStateImpl implements _SplitState {
  const _$SplitStateImpl(
      {this.balances = const ApiState.initial(),
      this.settlements = const ApiState.initial(),
      this.ledger = const ApiState.initial(),
      this.isCompletingSettlement = false,
      this.isSplitting = false});

  @override
  @JsonKey()
  final ApiState<List<UserBalance>> balances;
  @override
  @JsonKey()
  final ApiState<List<SuggestedSettlementResponse>> settlements;
  @override
  @JsonKey()
  final ApiState<LedgerResponse> ledger;
  @override
  @JsonKey()
  final bool isCompletingSettlement;
  @override
  @JsonKey()
  final bool isSplitting;

  @override
  String toString() {
    return 'SplitState(balances: $balances, settlements: $settlements, ledger: $ledger, isCompletingSettlement: $isCompletingSettlement, isSplitting: $isSplitting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SplitStateImpl &&
            (identical(other.balances, balances) ||
                other.balances == balances) &&
            (identical(other.settlements, settlements) ||
                other.settlements == settlements) &&
            (identical(other.ledger, ledger) || other.ledger == ledger) &&
            (identical(other.isCompletingSettlement, isCompletingSettlement) ||
                other.isCompletingSettlement == isCompletingSettlement) &&
            (identical(other.isSplitting, isSplitting) ||
                other.isSplitting == isSplitting));
  }

  @override
  int get hashCode => Object.hash(runtimeType, balances, settlements, ledger,
      isCompletingSettlement, isSplitting);

  /// Create a copy of SplitState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SplitStateImplCopyWith<_$SplitStateImpl> get copyWith =>
      __$$SplitStateImplCopyWithImpl<_$SplitStateImpl>(this, _$identity);
}

abstract class _SplitState implements SplitState {
  const factory _SplitState(
      {final ApiState<List<UserBalance>> balances,
      final ApiState<List<SuggestedSettlementResponse>> settlements,
      final ApiState<LedgerResponse> ledger,
      final bool isCompletingSettlement,
      final bool isSplitting}) = _$SplitStateImpl;

  @override
  ApiState<List<UserBalance>> get balances;
  @override
  ApiState<List<SuggestedSettlementResponse>> get settlements;
  @override
  ApiState<LedgerResponse> get ledger;
  @override
  bool get isCompletingSettlement;
  @override
  bool get isSplitting;

  /// Create a copy of SplitState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SplitStateImplCopyWith<_$SplitStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'household_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

HouseholdMemberModel _$HouseholdMemberModelFromJson(Map<String, dynamic> json) {
  return _HouseholdMemberModel.fromJson(json);
}

/// @nodoc
mixin _$HouseholdMemberModel {
  @JsonKey(name: 'user_id')
  String get userId => throw _privateConstructorUsedError;
  HouseholdRole get role => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  @JsonKey(name: 'joined_at')
  DateTime get joinedAt => throw _privateConstructorUsedError;

  /// Serializes this HouseholdMemberModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseholdMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseholdMemberModelCopyWith<HouseholdMemberModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdMemberModelCopyWith<$Res> {
  factory $HouseholdMemberModelCopyWith(HouseholdMemberModel value,
          $Res Function(HouseholdMemberModel) then) =
      _$HouseholdMemberModelCopyWithImpl<$Res, HouseholdMemberModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      HouseholdRole role,
      String email,
      @JsonKey(name: 'joined_at') DateTime joinedAt});
}

/// @nodoc
class _$HouseholdMemberModelCopyWithImpl<$Res,
        $Val extends HouseholdMemberModel>
    implements $HouseholdMemberModelCopyWith<$Res> {
  _$HouseholdMemberModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseholdMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? role = null,
    Object? email = null,
    Object? joinedAt = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as HouseholdRole,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdMemberModelImplCopyWith<$Res>
    implements $HouseholdMemberModelCopyWith<$Res> {
  factory _$$HouseholdMemberModelImplCopyWith(_$HouseholdMemberModelImpl value,
          $Res Function(_$HouseholdMemberModelImpl) then) =
      __$$HouseholdMemberModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'user_id') String userId,
      HouseholdRole role,
      String email,
      @JsonKey(name: 'joined_at') DateTime joinedAt});
}

/// @nodoc
class __$$HouseholdMemberModelImplCopyWithImpl<$Res>
    extends _$HouseholdMemberModelCopyWithImpl<$Res, _$HouseholdMemberModelImpl>
    implements _$$HouseholdMemberModelImplCopyWith<$Res> {
  __$$HouseholdMemberModelImplCopyWithImpl(_$HouseholdMemberModelImpl _value,
      $Res Function(_$HouseholdMemberModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseholdMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? role = null,
    Object? email = null,
    Object? joinedAt = null,
  }) {
    return _then(_$HouseholdMemberModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      role: null == role
          ? _value.role
          : role // ignore: cast_nullable_to_non_nullable
              as HouseholdRole,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      joinedAt: null == joinedAt
          ? _value.joinedAt
          : joinedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseholdMemberModelImpl implements _HouseholdMemberModel {
  const _$HouseholdMemberModelImpl(
      {@JsonKey(name: 'user_id') required this.userId,
      required this.role,
      required this.email,
      @JsonKey(name: 'joined_at') required this.joinedAt});

  factory _$HouseholdMemberModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdMemberModelImplFromJson(json);

  @override
  @JsonKey(name: 'user_id')
  final String userId;
  @override
  final HouseholdRole role;
  @override
  final String email;
  @override
  @JsonKey(name: 'joined_at')
  final DateTime joinedAt;

  @override
  String toString() {
    return 'HouseholdMemberModel(userId: $userId, role: $role, email: $email, joinedAt: $joinedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdMemberModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.role, role) || other.role == role) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.joinedAt, joinedAt) ||
                other.joinedAt == joinedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, role, email, joinedAt);

  /// Create a copy of HouseholdMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdMemberModelImplCopyWith<_$HouseholdMemberModelImpl>
      get copyWith =>
          __$$HouseholdMemberModelImplCopyWithImpl<_$HouseholdMemberModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdMemberModelImplToJson(
      this,
    );
  }
}

abstract class _HouseholdMemberModel implements HouseholdMemberModel {
  const factory _HouseholdMemberModel(
          {@JsonKey(name: 'user_id') required final String userId,
          required final HouseholdRole role,
          required final String email,
          @JsonKey(name: 'joined_at') required final DateTime joinedAt}) =
      _$HouseholdMemberModelImpl;

  factory _HouseholdMemberModel.fromJson(Map<String, dynamic> json) =
      _$HouseholdMemberModelImpl.fromJson;

  @override
  @JsonKey(name: 'user_id')
  String get userId;
  @override
  HouseholdRole get role;
  @override
  String get email;
  @override
  @JsonKey(name: 'joined_at')
  DateTime get joinedAt;

  /// Create a copy of HouseholdMemberModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseholdMemberModelImplCopyWith<_$HouseholdMemberModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

HouseholdModel _$HouseholdModelFromJson(Map<String, dynamic> json) {
  return _HouseholdModel.fromJson(json);
}

/// @nodoc
mixin _$HouseholdModel {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  @JsonKey(name: 'created_at')
  DateTime get createdAt => throw _privateConstructorUsedError;
  List<HouseholdMemberModel> get members => throw _privateConstructorUsedError;

  /// Serializes this HouseholdModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of HouseholdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseholdModelCopyWith<HouseholdModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdModelCopyWith<$Res> {
  factory $HouseholdModelCopyWith(
          HouseholdModel value, $Res Function(HouseholdModel) then) =
      _$HouseholdModelCopyWithImpl<$Res, HouseholdModel>;
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<HouseholdMemberModel> members});
}

/// @nodoc
class _$HouseholdModelCopyWithImpl<$Res, $Val extends HouseholdModel>
    implements $HouseholdModelCopyWith<$Res> {
  _$HouseholdModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseholdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? members = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _value.members
          : members // ignore: cast_nullable_to_non_nullable
              as List<HouseholdMemberModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$HouseholdModelImplCopyWith<$Res>
    implements $HouseholdModelCopyWith<$Res> {
  factory _$$HouseholdModelImplCopyWith(_$HouseholdModelImpl value,
          $Res Function(_$HouseholdModelImpl) then) =
      __$$HouseholdModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      @JsonKey(name: 'created_at') DateTime createdAt,
      List<HouseholdMemberModel> members});
}

/// @nodoc
class __$$HouseholdModelImplCopyWithImpl<$Res>
    extends _$HouseholdModelCopyWithImpl<$Res, _$HouseholdModelImpl>
    implements _$$HouseholdModelImplCopyWith<$Res> {
  __$$HouseholdModelImplCopyWithImpl(
      _$HouseholdModelImpl _value, $Res Function(_$HouseholdModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseholdModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? createdAt = null,
    Object? members = null,
  }) {
    return _then(_$HouseholdModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      members: null == members
          ? _value._members
          : members // ignore: cast_nullable_to_non_nullable
              as List<HouseholdMemberModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$HouseholdModelImpl implements _HouseholdModel {
  const _$HouseholdModelImpl(
      {required this.id,
      required this.name,
      @JsonKey(name: 'created_at') required this.createdAt,
      final List<HouseholdMemberModel> members = const []})
      : _members = members;

  factory _$HouseholdModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$HouseholdModelImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  @JsonKey(name: 'created_at')
  final DateTime createdAt;
  final List<HouseholdMemberModel> _members;
  @override
  @JsonKey()
  List<HouseholdMemberModel> get members {
    if (_members is EqualUnmodifiableListView) return _members;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_members);
  }

  @override
  String toString() {
    return 'HouseholdModel(id: $id, name: $name, createdAt: $createdAt, members: $members)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._members, _members));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, createdAt,
      const DeepCollectionEquality().hash(_members));

  /// Create a copy of HouseholdModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdModelImplCopyWith<_$HouseholdModelImpl> get copyWith =>
      __$$HouseholdModelImplCopyWithImpl<_$HouseholdModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$HouseholdModelImplToJson(
      this,
    );
  }
}

abstract class _HouseholdModel implements HouseholdModel {
  const factory _HouseholdModel(
      {required final String id,
      required final String name,
      @JsonKey(name: 'created_at') required final DateTime createdAt,
      final List<HouseholdMemberModel> members}) = _$HouseholdModelImpl;

  factory _HouseholdModel.fromJson(Map<String, dynamic> json) =
      _$HouseholdModelImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  @JsonKey(name: 'created_at')
  DateTime get createdAt;
  @override
  List<HouseholdMemberModel> get members;

  /// Create a copy of HouseholdModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseholdModelImplCopyWith<_$HouseholdModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Workspace _$WorkspaceFromJson(Map<String, dynamic> json) {
  return _Workspace.fromJson(json);
}

/// @nodoc
mixin _$Workspace {
  WorkspaceType get type => throw _privateConstructorUsedError;
  String? get householdId => throw _privateConstructorUsedError;
  String? get householdName => throw _privateConstructorUsedError;

  /// Serializes this Workspace to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WorkspaceCopyWith<Workspace> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WorkspaceCopyWith<$Res> {
  factory $WorkspaceCopyWith(Workspace value, $Res Function(Workspace) then) =
      _$WorkspaceCopyWithImpl<$Res, Workspace>;
  @useResult
  $Res call({WorkspaceType type, String? householdId, String? householdName});
}

/// @nodoc
class _$WorkspaceCopyWithImpl<$Res, $Val extends Workspace>
    implements $WorkspaceCopyWith<$Res> {
  _$WorkspaceCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? householdId = freezed,
    Object? householdName = freezed,
  }) {
    return _then(_value.copyWith(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkspaceType,
      householdId: freezed == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String?,
      householdName: freezed == householdName
          ? _value.householdName
          : householdName // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WorkspaceImplCopyWith<$Res>
    implements $WorkspaceCopyWith<$Res> {
  factory _$$WorkspaceImplCopyWith(
          _$WorkspaceImpl value, $Res Function(_$WorkspaceImpl) then) =
      __$$WorkspaceImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({WorkspaceType type, String? householdId, String? householdName});
}

/// @nodoc
class __$$WorkspaceImplCopyWithImpl<$Res>
    extends _$WorkspaceCopyWithImpl<$Res, _$WorkspaceImpl>
    implements _$$WorkspaceImplCopyWith<$Res> {
  __$$WorkspaceImplCopyWithImpl(
      _$WorkspaceImpl _value, $Res Function(_$WorkspaceImpl) _then)
      : super(_value, _then);

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? type = null,
    Object? householdId = freezed,
    Object? householdName = freezed,
  }) {
    return _then(_$WorkspaceImpl(
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as WorkspaceType,
      householdId: freezed == householdId
          ? _value.householdId
          : householdId // ignore: cast_nullable_to_non_nullable
              as String?,
      householdName: freezed == householdName
          ? _value.householdName
          : householdName // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WorkspaceImpl implements _Workspace {
  const _$WorkspaceImpl(
      {this.type = WorkspaceType.personal,
      this.householdId,
      this.householdName});

  factory _$WorkspaceImpl.fromJson(Map<String, dynamic> json) =>
      _$$WorkspaceImplFromJson(json);

  @override
  @JsonKey()
  final WorkspaceType type;
  @override
  final String? householdId;
  @override
  final String? householdName;

  @override
  String toString() {
    return 'Workspace(type: $type, householdId: $householdId, householdName: $householdName)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WorkspaceImpl &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.householdId, householdId) ||
                other.householdId == householdId) &&
            (identical(other.householdName, householdName) ||
                other.householdName == householdName));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, type, householdId, householdName);

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WorkspaceImplCopyWith<_$WorkspaceImpl> get copyWith =>
      __$$WorkspaceImplCopyWithImpl<_$WorkspaceImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WorkspaceImplToJson(
      this,
    );
  }
}

abstract class _Workspace implements Workspace {
  const factory _Workspace(
      {final WorkspaceType type,
      final String? householdId,
      final String? householdName}) = _$WorkspaceImpl;

  factory _Workspace.fromJson(Map<String, dynamic> json) =
      _$WorkspaceImpl.fromJson;

  @override
  WorkspaceType get type;
  @override
  String? get householdId;
  @override
  String? get householdName;

  /// Create a copy of Workspace
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WorkspaceImplCopyWith<_$WorkspaceImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$HouseholdState {
  ApiState<List<HouseholdModel>> get households =>
      throw _privateConstructorUsedError;
  Workspace get activeWorkspace => throw _privateConstructorUsedError;
  bool get isCreating => throw _privateConstructorUsedError;
  bool get isInviting => throw _privateConstructorUsedError;

  /// Create a copy of HouseholdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $HouseholdStateCopyWith<HouseholdState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $HouseholdStateCopyWith<$Res> {
  factory $HouseholdStateCopyWith(
          HouseholdState value, $Res Function(HouseholdState) then) =
      _$HouseholdStateCopyWithImpl<$Res, HouseholdState>;
  @useResult
  $Res call(
      {ApiState<List<HouseholdModel>> households,
      Workspace activeWorkspace,
      bool isCreating,
      bool isInviting});

  $ApiStateCopyWith<List<HouseholdModel>, $Res> get households;
  $WorkspaceCopyWith<$Res> get activeWorkspace;
}

/// @nodoc
class _$HouseholdStateCopyWithImpl<$Res, $Val extends HouseholdState>
    implements $HouseholdStateCopyWith<$Res> {
  _$HouseholdStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of HouseholdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? households = null,
    Object? activeWorkspace = null,
    Object? isCreating = null,
    Object? isInviting = null,
  }) {
    return _then(_value.copyWith(
      households: null == households
          ? _value.households
          : households // ignore: cast_nullable_to_non_nullable
              as ApiState<List<HouseholdModel>>,
      activeWorkspace: null == activeWorkspace
          ? _value.activeWorkspace
          : activeWorkspace // ignore: cast_nullable_to_non_nullable
              as Workspace,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isInviting: null == isInviting
          ? _value.isInviting
          : isInviting // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }

  /// Create a copy of HouseholdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ApiStateCopyWith<List<HouseholdModel>, $Res> get households {
    return $ApiStateCopyWith<List<HouseholdModel>, $Res>(_value.households,
        (value) {
      return _then(_value.copyWith(households: value) as $Val);
    });
  }

  /// Create a copy of HouseholdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $WorkspaceCopyWith<$Res> get activeWorkspace {
    return $WorkspaceCopyWith<$Res>(_value.activeWorkspace, (value) {
      return _then(_value.copyWith(activeWorkspace: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$HouseholdStateImplCopyWith<$Res>
    implements $HouseholdStateCopyWith<$Res> {
  factory _$$HouseholdStateImplCopyWith(_$HouseholdStateImpl value,
          $Res Function(_$HouseholdStateImpl) then) =
      __$$HouseholdStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ApiState<List<HouseholdModel>> households,
      Workspace activeWorkspace,
      bool isCreating,
      bool isInviting});

  @override
  $ApiStateCopyWith<List<HouseholdModel>, $Res> get households;
  @override
  $WorkspaceCopyWith<$Res> get activeWorkspace;
}

/// @nodoc
class __$$HouseholdStateImplCopyWithImpl<$Res>
    extends _$HouseholdStateCopyWithImpl<$Res, _$HouseholdStateImpl>
    implements _$$HouseholdStateImplCopyWith<$Res> {
  __$$HouseholdStateImplCopyWithImpl(
      _$HouseholdStateImpl _value, $Res Function(_$HouseholdStateImpl) _then)
      : super(_value, _then);

  /// Create a copy of HouseholdState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? households = null,
    Object? activeWorkspace = null,
    Object? isCreating = null,
    Object? isInviting = null,
  }) {
    return _then(_$HouseholdStateImpl(
      households: null == households
          ? _value.households
          : households // ignore: cast_nullable_to_non_nullable
              as ApiState<List<HouseholdModel>>,
      activeWorkspace: null == activeWorkspace
          ? _value.activeWorkspace
          : activeWorkspace // ignore: cast_nullable_to_non_nullable
              as Workspace,
      isCreating: null == isCreating
          ? _value.isCreating
          : isCreating // ignore: cast_nullable_to_non_nullable
              as bool,
      isInviting: null == isInviting
          ? _value.isInviting
          : isInviting // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$HouseholdStateImpl implements _HouseholdState {
  const _$HouseholdStateImpl(
      {this.households = const ApiState.initial(),
      this.activeWorkspace = const Workspace(),
      this.isCreating = false,
      this.isInviting = false});

  @override
  @JsonKey()
  final ApiState<List<HouseholdModel>> households;
  @override
  @JsonKey()
  final Workspace activeWorkspace;
  @override
  @JsonKey()
  final bool isCreating;
  @override
  @JsonKey()
  final bool isInviting;

  @override
  String toString() {
    return 'HouseholdState(households: $households, activeWorkspace: $activeWorkspace, isCreating: $isCreating, isInviting: $isInviting)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$HouseholdStateImpl &&
            (identical(other.households, households) ||
                other.households == households) &&
            (identical(other.activeWorkspace, activeWorkspace) ||
                other.activeWorkspace == activeWorkspace) &&
            (identical(other.isCreating, isCreating) ||
                other.isCreating == isCreating) &&
            (identical(other.isInviting, isInviting) ||
                other.isInviting == isInviting));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, households, activeWorkspace, isCreating, isInviting);

  /// Create a copy of HouseholdState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$HouseholdStateImplCopyWith<_$HouseholdStateImpl> get copyWith =>
      __$$HouseholdStateImplCopyWithImpl<_$HouseholdStateImpl>(
          this, _$identity);
}

abstract class _HouseholdState implements HouseholdState {
  const factory _HouseholdState(
      {final ApiState<List<HouseholdModel>> households,
      final Workspace activeWorkspace,
      final bool isCreating,
      final bool isInviting}) = _$HouseholdStateImpl;

  @override
  ApiState<List<HouseholdModel>> get households;
  @override
  Workspace get activeWorkspace;
  @override
  bool get isCreating;
  @override
  bool get isInviting;

  /// Create a copy of HouseholdState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$HouseholdStateImplCopyWith<_$HouseholdStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

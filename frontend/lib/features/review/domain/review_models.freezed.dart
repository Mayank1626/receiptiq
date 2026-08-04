// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'review_models.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AuditEntry _$AuditEntryFromJson(Map<String, dynamic> json) {
  return _AuditEntry.fromJson(json);
}

/// @nodoc
mixin _$AuditEntry {
  String get id => throw _privateConstructorUsedError;
  @JsonKey(name: 'receipt_id')
  String get receiptId => throw _privateConstructorUsedError;
  String get action => throw _privateConstructorUsedError;
  @JsonKey(name: 'field_name')
  String? get fieldName => throw _privateConstructorUsedError;
  @JsonKey(name: 'old_value')
  String? get oldValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'new_value')
  String? get newValue => throw _privateConstructorUsedError;
  @JsonKey(name: 'edited_at')
  DateTime get editedAt => throw _privateConstructorUsedError;

  /// Serializes this AuditEntry to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of AuditEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $AuditEntryCopyWith<AuditEntry> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuditEntryCopyWith<$Res> {
  factory $AuditEntryCopyWith(
          AuditEntry value, $Res Function(AuditEntry) then) =
      _$AuditEntryCopyWithImpl<$Res, AuditEntry>;
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'receipt_id') String receiptId,
      String action,
      @JsonKey(name: 'field_name') String? fieldName,
      @JsonKey(name: 'old_value') String? oldValue,
      @JsonKey(name: 'new_value') String? newValue,
      @JsonKey(name: 'edited_at') DateTime editedAt});
}

/// @nodoc
class _$AuditEntryCopyWithImpl<$Res, $Val extends AuditEntry>
    implements $AuditEntryCopyWith<$Res> {
  _$AuditEntryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AuditEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptId = null,
    Object? action = null,
    Object? fieldName = freezed,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? editedAt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiptId: null == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName: freezed == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String?,
      oldValue: freezed == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as String?,
      newValue: freezed == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String?,
      editedAt: null == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AuditEntryImplCopyWith<$Res>
    implements $AuditEntryCopyWith<$Res> {
  factory _$$AuditEntryImplCopyWith(
          _$AuditEntryImpl value, $Res Function(_$AuditEntryImpl) then) =
      __$$AuditEntryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      @JsonKey(name: 'receipt_id') String receiptId,
      String action,
      @JsonKey(name: 'field_name') String? fieldName,
      @JsonKey(name: 'old_value') String? oldValue,
      @JsonKey(name: 'new_value') String? newValue,
      @JsonKey(name: 'edited_at') DateTime editedAt});
}

/// @nodoc
class __$$AuditEntryImplCopyWithImpl<$Res>
    extends _$AuditEntryCopyWithImpl<$Res, _$AuditEntryImpl>
    implements _$$AuditEntryImplCopyWith<$Res> {
  __$$AuditEntryImplCopyWithImpl(
      _$AuditEntryImpl _value, $Res Function(_$AuditEntryImpl) _then)
      : super(_value, _then);

  /// Create a copy of AuditEntry
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptId = null,
    Object? action = null,
    Object? fieldName = freezed,
    Object? oldValue = freezed,
    Object? newValue = freezed,
    Object? editedAt = null,
  }) {
    return _then(_$AuditEntryImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiptId: null == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
      action: null == action
          ? _value.action
          : action // ignore: cast_nullable_to_non_nullable
              as String,
      fieldName: freezed == fieldName
          ? _value.fieldName
          : fieldName // ignore: cast_nullable_to_non_nullable
              as String?,
      oldValue: freezed == oldValue
          ? _value.oldValue
          : oldValue // ignore: cast_nullable_to_non_nullable
              as String?,
      newValue: freezed == newValue
          ? _value.newValue
          : newValue // ignore: cast_nullable_to_non_nullable
              as String?,
      editedAt: null == editedAt
          ? _value.editedAt
          : editedAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AuditEntryImpl implements _AuditEntry {
  const _$AuditEntryImpl(
      {required this.id,
      @JsonKey(name: 'receipt_id') required this.receiptId,
      required this.action,
      @JsonKey(name: 'field_name') this.fieldName,
      @JsonKey(name: 'old_value') this.oldValue,
      @JsonKey(name: 'new_value') this.newValue,
      @JsonKey(name: 'edited_at') required this.editedAt});

  factory _$AuditEntryImpl.fromJson(Map<String, dynamic> json) =>
      _$$AuditEntryImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey(name: 'receipt_id')
  final String receiptId;
  @override
  final String action;
  @override
  @JsonKey(name: 'field_name')
  final String? fieldName;
  @override
  @JsonKey(name: 'old_value')
  final String? oldValue;
  @override
  @JsonKey(name: 'new_value')
  final String? newValue;
  @override
  @JsonKey(name: 'edited_at')
  final DateTime editedAt;

  @override
  String toString() {
    return 'AuditEntry(id: $id, receiptId: $receiptId, action: $action, fieldName: $fieldName, oldValue: $oldValue, newValue: $newValue, editedAt: $editedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AuditEntryImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId) &&
            (identical(other.action, action) || other.action == action) &&
            (identical(other.fieldName, fieldName) ||
                other.fieldName == fieldName) &&
            (identical(other.oldValue, oldValue) ||
                other.oldValue == oldValue) &&
            (identical(other.newValue, newValue) ||
                other.newValue == newValue) &&
            (identical(other.editedAt, editedAt) ||
                other.editedAt == editedAt));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, receiptId, action, fieldName,
      oldValue, newValue, editedAt);

  /// Create a copy of AuditEntry
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AuditEntryImplCopyWith<_$AuditEntryImpl> get copyWith =>
      __$$AuditEntryImplCopyWithImpl<_$AuditEntryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AuditEntryImplToJson(
      this,
    );
  }
}

abstract class _AuditEntry implements AuditEntry {
  const factory _AuditEntry(
          {required final String id,
          @JsonKey(name: 'receipt_id') required final String receiptId,
          required final String action,
          @JsonKey(name: 'field_name') final String? fieldName,
          @JsonKey(name: 'old_value') final String? oldValue,
          @JsonKey(name: 'new_value') final String? newValue,
          @JsonKey(name: 'edited_at') required final DateTime editedAt}) =
      _$AuditEntryImpl;

  factory _AuditEntry.fromJson(Map<String, dynamic> json) =
      _$AuditEntryImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(name: 'receipt_id')
  String get receiptId;
  @override
  String get action;
  @override
  @JsonKey(name: 'field_name')
  String? get fieldName;
  @override
  @JsonKey(name: 'old_value')
  String? get oldValue;
  @override
  @JsonKey(name: 'new_value')
  String? get newValue;
  @override
  @JsonKey(name: 'edited_at')
  DateTime get editedAt;

  /// Create a copy of AuditEntry
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AuditEntryImplCopyWith<_$AuditEntryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ReviewStateData {
  ReceiptModel get originalReceipt => throw _privateConstructorUsedError;
  ReceiptModel get editedReceipt => throw _privateConstructorUsedError;
  bool get hasUnsavedChanges => throw _privateConstructorUsedError;
  bool get isSaving => throw _privateConstructorUsedError;
  bool get isConfirming => throw _privateConstructorUsedError;
  double? get aiConfidence => throw _privateConstructorUsedError;
  List<AuditEntry> get auditHistory => throw _privateConstructorUsedError;

  /// Create a copy of ReviewStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReviewStateDataCopyWith<ReviewStateData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReviewStateDataCopyWith<$Res> {
  factory $ReviewStateDataCopyWith(
          ReviewStateData value, $Res Function(ReviewStateData) then) =
      _$ReviewStateDataCopyWithImpl<$Res, ReviewStateData>;
  @useResult
  $Res call(
      {ReceiptModel originalReceipt,
      ReceiptModel editedReceipt,
      bool hasUnsavedChanges,
      bool isSaving,
      bool isConfirming,
      double? aiConfidence,
      List<AuditEntry> auditHistory});

  $ReceiptModelCopyWith<$Res> get originalReceipt;
  $ReceiptModelCopyWith<$Res> get editedReceipt;
}

/// @nodoc
class _$ReviewStateDataCopyWithImpl<$Res, $Val extends ReviewStateData>
    implements $ReviewStateDataCopyWith<$Res> {
  _$ReviewStateDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReviewStateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalReceipt = null,
    Object? editedReceipt = null,
    Object? hasUnsavedChanges = null,
    Object? isSaving = null,
    Object? isConfirming = null,
    Object? aiConfidence = freezed,
    Object? auditHistory = null,
  }) {
    return _then(_value.copyWith(
      originalReceipt: null == originalReceipt
          ? _value.originalReceipt
          : originalReceipt // ignore: cast_nullable_to_non_nullable
              as ReceiptModel,
      editedReceipt: null == editedReceipt
          ? _value.editedReceipt
          : editedReceipt // ignore: cast_nullable_to_non_nullable
              as ReceiptModel,
      hasUnsavedChanges: null == hasUnsavedChanges
          ? _value.hasUnsavedChanges
          : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirming: null == isConfirming
          ? _value.isConfirming
          : isConfirming // ignore: cast_nullable_to_non_nullable
              as bool,
      aiConfidence: freezed == aiConfidence
          ? _value.aiConfidence
          : aiConfidence // ignore: cast_nullable_to_non_nullable
              as double?,
      auditHistory: null == auditHistory
          ? _value.auditHistory
          : auditHistory // ignore: cast_nullable_to_non_nullable
              as List<AuditEntry>,
    ) as $Val);
  }

  /// Create a copy of ReviewStateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceiptModelCopyWith<$Res> get originalReceipt {
    return $ReceiptModelCopyWith<$Res>(_value.originalReceipt, (value) {
      return _then(_value.copyWith(originalReceipt: value) as $Val);
    });
  }

  /// Create a copy of ReviewStateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReceiptModelCopyWith<$Res> get editedReceipt {
    return $ReceiptModelCopyWith<$Res>(_value.editedReceipt, (value) {
      return _then(_value.copyWith(editedReceipt: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$ReviewStateDataImplCopyWith<$Res>
    implements $ReviewStateDataCopyWith<$Res> {
  factory _$$ReviewStateDataImplCopyWith(_$ReviewStateDataImpl value,
          $Res Function(_$ReviewStateDataImpl) then) =
      __$$ReviewStateDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {ReceiptModel originalReceipt,
      ReceiptModel editedReceipt,
      bool hasUnsavedChanges,
      bool isSaving,
      bool isConfirming,
      double? aiConfidence,
      List<AuditEntry> auditHistory});

  @override
  $ReceiptModelCopyWith<$Res> get originalReceipt;
  @override
  $ReceiptModelCopyWith<$Res> get editedReceipt;
}

/// @nodoc
class __$$ReviewStateDataImplCopyWithImpl<$Res>
    extends _$ReviewStateDataCopyWithImpl<$Res, _$ReviewStateDataImpl>
    implements _$$ReviewStateDataImplCopyWith<$Res> {
  __$$ReviewStateDataImplCopyWithImpl(
      _$ReviewStateDataImpl _value, $Res Function(_$ReviewStateDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReviewStateData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? originalReceipt = null,
    Object? editedReceipt = null,
    Object? hasUnsavedChanges = null,
    Object? isSaving = null,
    Object? isConfirming = null,
    Object? aiConfidence = freezed,
    Object? auditHistory = null,
  }) {
    return _then(_$ReviewStateDataImpl(
      originalReceipt: null == originalReceipt
          ? _value.originalReceipt
          : originalReceipt // ignore: cast_nullable_to_non_nullable
              as ReceiptModel,
      editedReceipt: null == editedReceipt
          ? _value.editedReceipt
          : editedReceipt // ignore: cast_nullable_to_non_nullable
              as ReceiptModel,
      hasUnsavedChanges: null == hasUnsavedChanges
          ? _value.hasUnsavedChanges
          : hasUnsavedChanges // ignore: cast_nullable_to_non_nullable
              as bool,
      isSaving: null == isSaving
          ? _value.isSaving
          : isSaving // ignore: cast_nullable_to_non_nullable
              as bool,
      isConfirming: null == isConfirming
          ? _value.isConfirming
          : isConfirming // ignore: cast_nullable_to_non_nullable
              as bool,
      aiConfidence: freezed == aiConfidence
          ? _value.aiConfidence
          : aiConfidence // ignore: cast_nullable_to_non_nullable
              as double?,
      auditHistory: null == auditHistory
          ? _value._auditHistory
          : auditHistory // ignore: cast_nullable_to_non_nullable
              as List<AuditEntry>,
    ));
  }
}

/// @nodoc

class _$ReviewStateDataImpl implements _ReviewStateData {
  const _$ReviewStateDataImpl(
      {required this.originalReceipt,
      required this.editedReceipt,
      this.hasUnsavedChanges = false,
      this.isSaving = false,
      this.isConfirming = false,
      this.aiConfidence,
      final List<AuditEntry> auditHistory = const []})
      : _auditHistory = auditHistory;

  @override
  final ReceiptModel originalReceipt;
  @override
  final ReceiptModel editedReceipt;
  @override
  @JsonKey()
  final bool hasUnsavedChanges;
  @override
  @JsonKey()
  final bool isSaving;
  @override
  @JsonKey()
  final bool isConfirming;
  @override
  final double? aiConfidence;
  final List<AuditEntry> _auditHistory;
  @override
  @JsonKey()
  List<AuditEntry> get auditHistory {
    if (_auditHistory is EqualUnmodifiableListView) return _auditHistory;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_auditHistory);
  }

  @override
  String toString() {
    return 'ReviewStateData(originalReceipt: $originalReceipt, editedReceipt: $editedReceipt, hasUnsavedChanges: $hasUnsavedChanges, isSaving: $isSaving, isConfirming: $isConfirming, aiConfidence: $aiConfidence, auditHistory: $auditHistory)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReviewStateDataImpl &&
            (identical(other.originalReceipt, originalReceipt) ||
                other.originalReceipt == originalReceipt) &&
            (identical(other.editedReceipt, editedReceipt) ||
                other.editedReceipt == editedReceipt) &&
            (identical(other.hasUnsavedChanges, hasUnsavedChanges) ||
                other.hasUnsavedChanges == hasUnsavedChanges) &&
            (identical(other.isSaving, isSaving) ||
                other.isSaving == isSaving) &&
            (identical(other.isConfirming, isConfirming) ||
                other.isConfirming == isConfirming) &&
            (identical(other.aiConfidence, aiConfidence) ||
                other.aiConfidence == aiConfidence) &&
            const DeepCollectionEquality()
                .equals(other._auditHistory, _auditHistory));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      originalReceipt,
      editedReceipt,
      hasUnsavedChanges,
      isSaving,
      isConfirming,
      aiConfidence,
      const DeepCollectionEquality().hash(_auditHistory));

  /// Create a copy of ReviewStateData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReviewStateDataImplCopyWith<_$ReviewStateDataImpl> get copyWith =>
      __$$ReviewStateDataImplCopyWithImpl<_$ReviewStateDataImpl>(
          this, _$identity);
}

abstract class _ReviewStateData implements ReviewStateData {
  const factory _ReviewStateData(
      {required final ReceiptModel originalReceipt,
      required final ReceiptModel editedReceipt,
      final bool hasUnsavedChanges,
      final bool isSaving,
      final bool isConfirming,
      final double? aiConfidence,
      final List<AuditEntry> auditHistory}) = _$ReviewStateDataImpl;

  @override
  ReceiptModel get originalReceipt;
  @override
  ReceiptModel get editedReceipt;
  @override
  bool get hasUnsavedChanges;
  @override
  bool get isSaving;
  @override
  bool get isConfirming;
  @override
  double? get aiConfidence;
  @override
  List<AuditEntry> get auditHistory;

  /// Create a copy of ReviewStateData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReviewStateDataImplCopyWith<_$ReviewStateDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) {
  return _ReceiptModel.fromJson(json);
}

/// @nodoc
mixin _$ReceiptModel {
  String get id => throw _privateConstructorUsedError;
  String get status => throw _privateConstructorUsedError;
  String get source => throw _privateConstructorUsedError;
  String? get storeType => throw _privateConstructorUsedError;
  String? get storeName => throw _privateConstructorUsedError;
  double? get totalAmount => throw _privateConstructorUsedError;
  double? get subtotal => throw _privateConstructorUsedError;
  double? get tax => throw _privateConstructorUsedError;
  double? get deliveryCharge => throw _privateConstructorUsedError;
  double? get discount => throw _privateConstructorUsedError;
  DateTime? get date => throw _privateConstructorUsedError;
  String get storageProvider => throw _privateConstructorUsedError;
  String get filePath => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get updatedAt => throw _privateConstructorUsedError;
  String? get uploadedFileId => throw _privateConstructorUsedError;
  String? get ocrResultId => throw _privateConstructorUsedError;
  String? get aiExtractionResultId => throw _privateConstructorUsedError;
  List<ReceiptItemModel> get items => throw _privateConstructorUsedError;

  /// Serializes this ReceiptModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptModelCopyWith<ReceiptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptModelCopyWith<$Res> {
  factory $ReceiptModelCopyWith(
          ReceiptModel value, $Res Function(ReceiptModel) then) =
      _$ReceiptModelCopyWithImpl<$Res, ReceiptModel>;
  @useResult
  $Res call(
      {String id,
      String status,
      String source,
      String? storeType,
      String? storeName,
      double? totalAmount,
      double? subtotal,
      double? tax,
      double? deliveryCharge,
      double? discount,
      DateTime? date,
      String storageProvider,
      String filePath,
      DateTime createdAt,
      DateTime updatedAt,
      String? uploadedFileId,
      String? ocrResultId,
      String? aiExtractionResultId,
      List<ReceiptItemModel> items});
}

/// @nodoc
class _$ReceiptModelCopyWithImpl<$Res, $Val extends ReceiptModel>
    implements $ReceiptModelCopyWith<$Res> {
  _$ReceiptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? source = null,
    Object? storeType = freezed,
    Object? storeName = freezed,
    Object? totalAmount = freezed,
    Object? subtotal = freezed,
    Object? tax = freezed,
    Object? deliveryCharge = freezed,
    Object? discount = freezed,
    Object? date = freezed,
    Object? storageProvider = null,
    Object? filePath = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? uploadedFileId = freezed,
    Object? ocrResultId = freezed,
    Object? aiExtractionResultId = freezed,
    Object? items = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: freezed == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storageProvider: null == storageProvider
          ? _value.storageProvider
          : storageProvider // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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
      items: null == items
          ? _value.items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReceiptItemModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptModelImplCopyWith<$Res>
    implements $ReceiptModelCopyWith<$Res> {
  factory _$$ReceiptModelImplCopyWith(
          _$ReceiptModelImpl value, $Res Function(_$ReceiptModelImpl) then) =
      __$$ReceiptModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String status,
      String source,
      String? storeType,
      String? storeName,
      double? totalAmount,
      double? subtotal,
      double? tax,
      double? deliveryCharge,
      double? discount,
      DateTime? date,
      String storageProvider,
      String filePath,
      DateTime createdAt,
      DateTime updatedAt,
      String? uploadedFileId,
      String? ocrResultId,
      String? aiExtractionResultId,
      List<ReceiptItemModel> items});
}

/// @nodoc
class __$$ReceiptModelImplCopyWithImpl<$Res>
    extends _$ReceiptModelCopyWithImpl<$Res, _$ReceiptModelImpl>
    implements _$$ReceiptModelImplCopyWith<$Res> {
  __$$ReceiptModelImplCopyWithImpl(
      _$ReceiptModelImpl _value, $Res Function(_$ReceiptModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? status = null,
    Object? source = null,
    Object? storeType = freezed,
    Object? storeName = freezed,
    Object? totalAmount = freezed,
    Object? subtotal = freezed,
    Object? tax = freezed,
    Object? deliveryCharge = freezed,
    Object? discount = freezed,
    Object? date = freezed,
    Object? storageProvider = null,
    Object? filePath = null,
    Object? createdAt = null,
    Object? updatedAt = null,
    Object? uploadedFileId = freezed,
    Object? ocrResultId = freezed,
    Object? aiExtractionResultId = freezed,
    Object? items = null,
  }) {
    return _then(_$ReceiptModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as String,
      source: null == source
          ? _value.source
          : source // ignore: cast_nullable_to_non_nullable
              as String,
      storeType: freezed == storeType
          ? _value.storeType
          : storeType // ignore: cast_nullable_to_non_nullable
              as String?,
      storeName: freezed == storeName
          ? _value.storeName
          : storeName // ignore: cast_nullable_to_non_nullable
              as String?,
      totalAmount: freezed == totalAmount
          ? _value.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double?,
      subtotal: freezed == subtotal
          ? _value.subtotal
          : subtotal // ignore: cast_nullable_to_non_nullable
              as double?,
      tax: freezed == tax
          ? _value.tax
          : tax // ignore: cast_nullable_to_non_nullable
              as double?,
      deliveryCharge: freezed == deliveryCharge
          ? _value.deliveryCharge
          : deliveryCharge // ignore: cast_nullable_to_non_nullable
              as double?,
      discount: freezed == discount
          ? _value.discount
          : discount // ignore: cast_nullable_to_non_nullable
              as double?,
      date: freezed == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      storageProvider: null == storageProvider
          ? _value.storageProvider
          : storageProvider // ignore: cast_nullable_to_non_nullable
              as String,
      filePath: null == filePath
          ? _value.filePath
          : filePath // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
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
      items: null == items
          ? _value._items
          : items // ignore: cast_nullable_to_non_nullable
              as List<ReceiptItemModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptModelImpl implements _ReceiptModel {
  const _$ReceiptModelImpl(
      {required this.id,
      this.status = 'DRAFT',
      this.source = 'UPLOAD',
      this.storeType,
      this.storeName,
      this.totalAmount,
      this.subtotal,
      this.tax,
      this.deliveryCharge,
      this.discount,
      this.date,
      this.storageProvider = 'LOCAL',
      required this.filePath,
      required this.createdAt,
      required this.updatedAt,
      this.uploadedFileId,
      this.ocrResultId,
      this.aiExtractionResultId,
      final List<ReceiptItemModel> items = const []})
      : _items = items;

  factory _$ReceiptModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptModelImplFromJson(json);

  @override
  final String id;
  @override
  @JsonKey()
  final String status;
  @override
  @JsonKey()
  final String source;
  @override
  final String? storeType;
  @override
  final String? storeName;
  @override
  final double? totalAmount;
  @override
  final double? subtotal;
  @override
  final double? tax;
  @override
  final double? deliveryCharge;
  @override
  final double? discount;
  @override
  final DateTime? date;
  @override
  @JsonKey()
  final String storageProvider;
  @override
  final String filePath;
  @override
  final DateTime createdAt;
  @override
  final DateTime updatedAt;
  @override
  final String? uploadedFileId;
  @override
  final String? ocrResultId;
  @override
  final String? aiExtractionResultId;
  final List<ReceiptItemModel> _items;
  @override
  @JsonKey()
  List<ReceiptItemModel> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ReceiptModel(id: $id, status: $status, source: $source, storeType: $storeType, storeName: $storeName, totalAmount: $totalAmount, subtotal: $subtotal, tax: $tax, deliveryCharge: $deliveryCharge, discount: $discount, date: $date, storageProvider: $storageProvider, filePath: $filePath, createdAt: $createdAt, updatedAt: $updatedAt, uploadedFileId: $uploadedFileId, ocrResultId: $ocrResultId, aiExtractionResultId: $aiExtractionResultId, items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.source, source) || other.source == source) &&
            (identical(other.storeType, storeType) ||
                other.storeType == storeType) &&
            (identical(other.storeName, storeName) ||
                other.storeName == storeName) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.subtotal, subtotal) ||
                other.subtotal == subtotal) &&
            (identical(other.tax, tax) || other.tax == tax) &&
            (identical(other.deliveryCharge, deliveryCharge) ||
                other.deliveryCharge == deliveryCharge) &&
            (identical(other.discount, discount) ||
                other.discount == discount) &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.storageProvider, storageProvider) ||
                other.storageProvider == storageProvider) &&
            (identical(other.filePath, filePath) ||
                other.filePath == filePath) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.uploadedFileId, uploadedFileId) ||
                other.uploadedFileId == uploadedFileId) &&
            (identical(other.ocrResultId, ocrResultId) ||
                other.ocrResultId == ocrResultId) &&
            (identical(other.aiExtractionResultId, aiExtractionResultId) ||
                other.aiExtractionResultId == aiExtractionResultId) &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        status,
        source,
        storeType,
        storeName,
        totalAmount,
        subtotal,
        tax,
        deliveryCharge,
        discount,
        date,
        storageProvider,
        filePath,
        createdAt,
        updatedAt,
        uploadedFileId,
        ocrResultId,
        aiExtractionResultId,
        const DeepCollectionEquality().hash(_items)
      ]);

  /// Create a copy of ReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptModelImplCopyWith<_$ReceiptModelImpl> get copyWith =>
      __$$ReceiptModelImplCopyWithImpl<_$ReceiptModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptModelImplToJson(
      this,
    );
  }
}

abstract class _ReceiptModel implements ReceiptModel {
  const factory _ReceiptModel(
      {required final String id,
      final String status,
      final String source,
      final String? storeType,
      final String? storeName,
      final double? totalAmount,
      final double? subtotal,
      final double? tax,
      final double? deliveryCharge,
      final double? discount,
      final DateTime? date,
      final String storageProvider,
      required final String filePath,
      required final DateTime createdAt,
      required final DateTime updatedAt,
      final String? uploadedFileId,
      final String? ocrResultId,
      final String? aiExtractionResultId,
      final List<ReceiptItemModel> items}) = _$ReceiptModelImpl;

  factory _ReceiptModel.fromJson(Map<String, dynamic> json) =
      _$ReceiptModelImpl.fromJson;

  @override
  String get id;
  @override
  String get status;
  @override
  String get source;
  @override
  String? get storeType;
  @override
  String? get storeName;
  @override
  double? get totalAmount;
  @override
  double? get subtotal;
  @override
  double? get tax;
  @override
  double? get deliveryCharge;
  @override
  double? get discount;
  @override
  DateTime? get date;
  @override
  String get storageProvider;
  @override
  String get filePath;
  @override
  DateTime get createdAt;
  @override
  DateTime get updatedAt;
  @override
  String? get uploadedFileId;
  @override
  String? get ocrResultId;
  @override
  String? get aiExtractionResultId;
  @override
  List<ReceiptItemModel> get items;

  /// Create a copy of ReceiptModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptModelImplCopyWith<_$ReceiptModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ReceiptItemModel _$ReceiptItemModelFromJson(Map<String, dynamic> json) {
  return _ReceiptItemModel.fromJson(json);
}

/// @nodoc
mixin _$ReceiptItemModel {
  String get id => throw _privateConstructorUsedError;
  String get receiptId => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  double get quantity => throw _privateConstructorUsedError;
  double? get itemPrice => throw _privateConstructorUsedError;
  double? get totalPrice => throw _privateConstructorUsedError;
  String? get category => throw _privateConstructorUsedError;

  /// Serializes this ReceiptItemModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ReceiptItemModelCopyWith<ReceiptItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptItemModelCopyWith<$Res> {
  factory $ReceiptItemModelCopyWith(
          ReceiptItemModel value, $Res Function(ReceiptItemModel) then) =
      _$ReceiptItemModelCopyWithImpl<$Res, ReceiptItemModel>;
  @useResult
  $Res call(
      {String id,
      String receiptId,
      String name,
      double quantity,
      double? itemPrice,
      double? totalPrice,
      String? category});
}

/// @nodoc
class _$ReceiptItemModelCopyWithImpl<$Res, $Val extends ReceiptItemModel>
    implements $ReceiptItemModelCopyWith<$Res> {
  _$ReceiptItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptId = null,
    Object? name = null,
    Object? quantity = null,
    Object? itemPrice = freezed,
    Object? totalPrice = freezed,
    Object? category = freezed,
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
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      itemPrice: freezed == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ReceiptItemModelImplCopyWith<$Res>
    implements $ReceiptItemModelCopyWith<$Res> {
  factory _$$ReceiptItemModelImplCopyWith(_$ReceiptItemModelImpl value,
          $Res Function(_$ReceiptItemModelImpl) then) =
      __$$ReceiptItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String receiptId,
      String name,
      double quantity,
      double? itemPrice,
      double? totalPrice,
      String? category});
}

/// @nodoc
class __$$ReceiptItemModelImplCopyWithImpl<$Res>
    extends _$ReceiptItemModelCopyWithImpl<$Res, _$ReceiptItemModelImpl>
    implements _$$ReceiptItemModelImplCopyWith<$Res> {
  __$$ReceiptItemModelImplCopyWithImpl(_$ReceiptItemModelImpl _value,
      $Res Function(_$ReceiptItemModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? receiptId = null,
    Object? name = null,
    Object? quantity = null,
    Object? itemPrice = freezed,
    Object? totalPrice = freezed,
    Object? category = freezed,
  }) {
    return _then(_$ReceiptItemModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      receiptId: null == receiptId
          ? _value.receiptId
          : receiptId // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      quantity: null == quantity
          ? _value.quantity
          : quantity // ignore: cast_nullable_to_non_nullable
              as double,
      itemPrice: freezed == itemPrice
          ? _value.itemPrice
          : itemPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      totalPrice: freezed == totalPrice
          ? _value.totalPrice
          : totalPrice // ignore: cast_nullable_to_non_nullable
              as double?,
      category: freezed == category
          ? _value.category
          : category // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ReceiptItemModelImpl implements _ReceiptItemModel {
  const _$ReceiptItemModelImpl(
      {required this.id,
      required this.receiptId,
      required this.name,
      this.quantity = 1.0,
      this.itemPrice,
      this.totalPrice,
      this.category});

  factory _$ReceiptItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ReceiptItemModelImplFromJson(json);

  @override
  final String id;
  @override
  final String receiptId;
  @override
  final String name;
  @override
  @JsonKey()
  final double quantity;
  @override
  final double? itemPrice;
  @override
  final double? totalPrice;
  @override
  final String? category;

  @override
  String toString() {
    return 'ReceiptItemModel(id: $id, receiptId: $receiptId, name: $name, quantity: $quantity, itemPrice: $itemPrice, totalPrice: $totalPrice, category: $category)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ReceiptItemModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.receiptId, receiptId) ||
                other.receiptId == receiptId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.quantity, quantity) ||
                other.quantity == quantity) &&
            (identical(other.itemPrice, itemPrice) ||
                other.itemPrice == itemPrice) &&
            (identical(other.totalPrice, totalPrice) ||
                other.totalPrice == totalPrice) &&
            (identical(other.category, category) ||
                other.category == category));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, receiptId, name, quantity,
      itemPrice, totalPrice, category);

  /// Create a copy of ReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ReceiptItemModelImplCopyWith<_$ReceiptItemModelImpl> get copyWith =>
      __$$ReceiptItemModelImplCopyWithImpl<_$ReceiptItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ReceiptItemModelImplToJson(
      this,
    );
  }
}

abstract class _ReceiptItemModel implements ReceiptItemModel {
  const factory _ReceiptItemModel(
      {required final String id,
      required final String receiptId,
      required final String name,
      final double quantity,
      final double? itemPrice,
      final double? totalPrice,
      final String? category}) = _$ReceiptItemModelImpl;

  factory _ReceiptItemModel.fromJson(Map<String, dynamic> json) =
      _$ReceiptItemModelImpl.fromJson;

  @override
  String get id;
  @override
  String get receiptId;
  @override
  String get name;
  @override
  double get quantity;
  @override
  double? get itemPrice;
  @override
  double? get totalPrice;
  @override
  String? get category;

  /// Create a copy of ReceiptItemModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ReceiptItemModelImplCopyWith<_$ReceiptItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

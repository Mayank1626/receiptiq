// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceiptModelImpl _$$ReceiptModelImplFromJson(Map<String, dynamic> json) =>
    _$ReceiptModelImpl(
      id: json['id'] as String,
      status: json['status'] as String? ?? 'DRAFT',
      source: json['source'] as String? ?? 'UPLOAD',
      storeType: json['storeType'] as String?,
      storeName: json['storeName'] as String?,
      totalAmount: (json['totalAmount'] as num?)?.toDouble(),
      subtotal: (json['subtotal'] as num?)?.toDouble(),
      tax: (json['tax'] as num?)?.toDouble(),
      deliveryCharge: (json['deliveryCharge'] as num?)?.toDouble(),
      discount: (json['discount'] as num?)?.toDouble(),
      date:
          json['date'] == null ? null : DateTime.parse(json['date'] as String),
      storageProvider: json['storageProvider'] as String? ?? 'LOCAL',
      filePath: json['filePath'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      uploadedFileId: json['uploadedFileId'] as String?,
      ocrResultId: json['ocrResultId'] as String?,
      aiExtractionResultId: json['aiExtractionResultId'] as String?,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => ReceiptItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ReceiptModelImplToJson(_$ReceiptModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'status': instance.status,
      'source': instance.source,
      'storeType': instance.storeType,
      'storeName': instance.storeName,
      'totalAmount': instance.totalAmount,
      'subtotal': instance.subtotal,
      'tax': instance.tax,
      'deliveryCharge': instance.deliveryCharge,
      'discount': instance.discount,
      'date': instance.date?.toIso8601String(),
      'storageProvider': instance.storageProvider,
      'filePath': instance.filePath,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'uploadedFileId': instance.uploadedFileId,
      'ocrResultId': instance.ocrResultId,
      'aiExtractionResultId': instance.aiExtractionResultId,
      'items': instance.items,
    };

_$ReceiptItemModelImpl _$$ReceiptItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceiptItemModelImpl(
      id: json['id'] as String,
      receiptId: json['receiptId'] as String,
      name: json['name'] as String,
      quantity: (json['quantity'] as num?)?.toDouble() ?? 1.0,
      itemPrice: (json['itemPrice'] as num?)?.toDouble(),
      totalPrice: (json['totalPrice'] as num?)?.toDouble(),
      category: json['category'] as String?,
    );

Map<String, dynamic> _$$ReceiptItemModelImplToJson(
        _$ReceiptItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'receiptId': instance.receiptId,
      'name': instance.name,
      'quantity': instance.quantity,
      'itemPrice': instance.itemPrice,
      'totalPrice': instance.totalPrice,
      'category': instance.category,
    };

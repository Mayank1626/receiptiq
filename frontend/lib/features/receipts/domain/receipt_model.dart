import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_model.freezed.dart';
part 'receipt_model.g.dart';

@freezed
class ReceiptModel with _$ReceiptModel {
  const factory ReceiptModel({
    required String id,
    @Default('DRAFT') String status,
    @Default('UPLOAD') String source,
    String? storeType,
    String? storeName,
    double? totalAmount,
    double? subtotal,
    double? tax,
    double? deliveryCharge,
    double? discount,
    DateTime? date,
    @Default('LOCAL') String storageProvider,
    required String filePath,
    required DateTime createdAt,
    required DateTime updatedAt,
    String? uploadedFileId,
    String? ocrResultId,
    String? aiExtractionResultId,
    @Default([]) List<ReceiptItemModel> items,
  }) = _ReceiptModel;

  factory ReceiptModel.fromJson(Map<String, dynamic> json) => _$ReceiptModelFromJson(json);
}

@freezed
class ReceiptItemModel with _$ReceiptItemModel {
  const factory ReceiptItemModel({
    required String id,
    required String receiptId,
    required String name,
    @Default(1.0) double quantity,
    double? itemPrice,
    double? totalPrice,
    String? category,
  }) = _ReceiptItemModel;

  factory ReceiptItemModel.fromJson(Map<String, dynamic> json) => _$ReceiptItemModelFromJson(json);
}

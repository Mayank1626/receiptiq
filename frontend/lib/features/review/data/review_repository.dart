import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/result.dart';
import '../../../../core/network/failure.dart';
import '../../receipts/domain/receipt_model.dart';
import '../domain/review_models.dart';

class ReviewRepository {
  final ApiClient _apiClient;

  ReviewRepository(this._apiClient);

  Future<Result<ReceiptModel>> getReceipt(String id) async {
    try {
      final response = await _apiClient.dio.get('/receipts/$id');
      return Result.success(ReceiptModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<ReceiptModel>> updateReceipt(String id, Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.dio.patch('/receipts/$id', data: data);
      return Result.success(ReceiptModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<ReceiptModel>> addItem(String receiptId, Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.dio.post('/receipts/$receiptId/items', data: data);
      return Result.success(ReceiptModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<ReceiptModel>> updateItem(String receiptId, String itemId, Map<String, dynamic> data) async {
    try {
      final response = await _apiClient.dio.patch('/receipts/$receiptId/items/$itemId', data: data);
      return Result.success(ReceiptModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<ReceiptModel>> deleteItem(String receiptId, String itemId) async {
    try {
      final response = await _apiClient.dio.delete('/receipts/$receiptId/items/$itemId');
      return Result.success(ReceiptModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<ReceiptModel>> confirmReceipt(String id) async {
    try {
      final response = await _apiClient.dio.post('/receipts/$id/confirm');
      return Result.success(ReceiptModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<List<AuditEntry>>> getAuditHistory(String id) async {
    try {
      final response = await _apiClient.dio.get('/receipts/$id/audits');
      final List<dynamic> data = response.data;
      final audits = data.map((json) => AuditEntry.fromJson(json)).toList();
      return Result.success(audits);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }
}

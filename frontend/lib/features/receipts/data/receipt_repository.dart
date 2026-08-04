import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/result.dart';
import '../../../../core/network/failure.dart';
import '../domain/receipt_model.dart';

class ReceiptRepository {
  final ApiClient _apiClient;

  ReceiptRepository(this._apiClient);

  Future<Result<List<ReceiptModel>>> getReceipts({
    int skip = 0,
    int limit = 100,
    String? status,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'skip': skip,
        'limit': limit,
      };
      
      if (status != null) {
        queryParams['status'] = status;
      }

      final response = await _apiClient.dio.get(
        '/receipts/', // Ensure this matches backend trailing slash requirements if any
        queryParameters: queryParams,
      );
      
      final receipts = (response.data as List)
          .map((json) => ReceiptModel.fromJson(json))
          .toList();
          
      return Result.success(receipts);
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Result.failure(Failure.unauthorized('Unauthorized'));
      }
      return Result.failure(Failure.network(e.message ?? 'Failed to fetch receipts'));
    } catch (e) {
      return Result.failure(Failure.unknown('An unexpected error occurred.', e));
    }
  }
}

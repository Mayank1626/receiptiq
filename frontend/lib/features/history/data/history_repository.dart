import 'package:dio/dio.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/core/network/failure.dart';
import 'package:receiptiq_mobile/core/network/result.dart';
import 'package:receiptiq_mobile/features/receipts/domain/receipt_model.dart';
import '../domain/history_models.dart';

class HistoryRepository {
  final ApiClient _apiClient;

  HistoryRepository(this._apiClient);

  Future<Result<List<ReceiptModel>>> getReceipts({
    required int skip,
    required int limit,
    required ReceiptFilter filter,
  }) async {
    try {
      final queryParams = <String, dynamic>{
        'skip': skip,
        'limit': limit,
      };

      if (filter.status != null) {
        queryParams['status'] = filter.status!.name.toUpperCase();
      }
      
      if (filter.searchQuery.isNotEmpty) {
        queryParams['store_name'] = filter.searchQuery;
      }

      if (filter.dateRange != null) {
        if (filter.dateRange!.startDate != null) {
          queryParams['start_date'] = filter.dateRange!.startDate!.toIso8601String();
        }
        if (filter.dateRange!.endDate != null) {
          queryParams['end_date'] = filter.dateRange!.endDate!.toIso8601String();
        }
      }

      if (filter.minAmount != null) queryParams['min_total'] = filter.minAmount;
      if (filter.maxAmount != null) queryParams['max_total'] = filter.maxAmount;

      final response = await _apiClient.dio.get('/receipts/', queryParameters: queryParams);
      
      final list = (response.data as List).map((e) => ReceiptModel.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }
}

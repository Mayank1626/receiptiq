import 'package:dio/dio.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/core/network/failure.dart';
import 'package:receiptiq_mobile/core/network/result.dart';
import '../domain/analytics_models.dart';

class AnalyticsRepository {
  final ApiClient _apiClient;

  AnalyticsRepository(this._apiClient);

  Future<Result<DashboardMetrics>> getDashboard({String? startDate, String? endDate}) async {
    try {
      final queryParams = _buildQueryParams(startDate, endDate);
      final response = await _apiClient.dio.get('/analytics/dashboard', queryParameters: queryParams);
      return Result.success(DashboardMetrics.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<List<MonthlySpend>>> getMonthlySpend({String? startDate, String? endDate}) async {
    try {
      final queryParams = _buildQueryParams(startDate, endDate);
      final response = await _apiClient.dio.get('/analytics/monthly', queryParameters: queryParams);
      final list = (response.data as List).map((e) => MonthlySpend.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<List<DailyTimeline>>> getTimeline({String? startDate, String? endDate}) async {
    try {
      final queryParams = _buildQueryParams(startDate, endDate);
      final response = await _apiClient.dio.get('/analytics/timeline', queryParameters: queryParams);
      final list = (response.data as List).map((e) => DailyTimeline.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<List<StoreAnalytics>>> getStores({String? startDate, String? endDate, int limit = 10}) async {
    try {
      final queryParams = _buildQueryParams(startDate, endDate);
      queryParams['limit'] = limit.toString();
      final response = await _apiClient.dio.get('/analytics/stores', queryParameters: queryParams);
      final list = (response.data as List).map((e) => StoreAnalytics.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<List<ProductAnalytics>>> getProducts({String? startDate, String? endDate, int limit = 10}) async {
    try {
      final queryParams = _buildQueryParams(startDate, endDate);
      queryParams['limit'] = limit.toString();
      final response = await _apiClient.dio.get('/analytics/products', queryParameters: queryParams);
      final list = (response.data as List).map((e) => ProductAnalytics.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<List<CategoryAnalytics>>> getCategories({String? startDate, String? endDate}) async {
    try {
      final queryParams = _buildQueryParams(startDate, endDate);
      final response = await _apiClient.dio.get('/analytics/categories', queryParameters: queryParams);
      final list = (response.data as List).map((e) => CategoryAnalytics.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<PriceHistory>> getProductPriceHistory(String productName) async {
    try {
      final response = await _apiClient.dio.get('/analytics/product/${Uri.encodeComponent(productName)}');
      return Result.success(PriceHistory.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Map<String, String> _buildQueryParams(String? startDate, String? endDate) {
    final params = <String, String>{};
    if (startDate != null) params['start_date'] = startDate;
    if (endDate != null) params['end_date'] = endDate;
    return params;
  }
}

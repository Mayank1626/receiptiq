import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/result.dart';
import '../../../../core/network/failure.dart';
import '../domain/dashboard_metrics.dart';

class DashboardRepository {
  final ApiClient _apiClient;

  DashboardRepository(this._apiClient);

  Future<Result<DashboardMetrics>> getMetrics() async {
    try {
      final response = await _apiClient.dio.get('/analytics/dashboard');
      
      return Result.success(DashboardMetrics.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Result.failure(Failure.unauthorized('Unauthorized'));
      }
      return Result.failure(Failure.network(e.message ?? 'Failed to fetch dashboard metrics'));
    } catch (e) {
      return Result.failure(Failure.unknown('An unexpected error occurred.', e));
    }
  }
}

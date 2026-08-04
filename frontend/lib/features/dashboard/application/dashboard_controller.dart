import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_state.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/result.dart';
import '../../../../core/network/failure.dart';
import '../../../../core/storage/storage_service.dart';
import '../../../auth/application/auth_controller.dart';
import '../domain/dashboard_data.dart';
import '../domain/dashboard_metrics.dart';
import '../../receipts/domain/receipt_model.dart';
import '../data/dashboard_repository.dart';
import '../../receipts/data/receipt_repository.dart';

// Providers for dependencies
final dashboardRepositoryProvider = Provider<DashboardRepository>((ref) {
  return DashboardRepository(ref.watch(apiClientProvider));
});

final receiptRepositoryProvider = Provider<ReceiptRepository>((ref) {
  return ReceiptRepository(ref.watch(apiClientProvider));
});

final dashboardControllerProvider = NotifierProvider<DashboardController, ApiState<DashboardData>>(() {
  return DashboardController();
});

class DashboardController extends Notifier<ApiState<DashboardData>> {
  late DashboardRepository _dashboardRepo;
  late ReceiptRepository _receiptRepo;
  late StorageService _storageService;

  @override
  ApiState<DashboardData> build() {
    _dashboardRepo = ref.watch(dashboardRepositoryProvider);
    _receiptRepo = ref.watch(receiptRepositoryProvider);
    _storageService = ref.watch(storageServiceProvider);
    
    Future.microtask(() => fetchData(useCache: true));
    return const ApiState.loading();
  }

  Future<void> fetchData({bool useCache = false}) async {
    if (useCache) {
      final cachedJson = _storageService.getCachedDashboard();
      if (cachedJson != null) {
        try {
          final data = DashboardData.fromJson(jsonDecode(cachedJson));
          state = ApiState.refreshing(data);
        } catch (_) {}
      } else {
        state = const ApiState.loading();
      }
    } else {
      state.maybeWhen(
        success: (data) => state = ApiState.refreshing(data),
        orElse: () => state = const ApiState.loading(),
      );
    }
    
    final results = await Future.wait([
      _dashboardRepo.getMetrics(),
      _receiptRepo.getReceipts(limit: 5), // Recent 5
      _receiptRepo.getReceipts(status: 'REVIEW_REQUIRED', limit: 10), // Pending reviews
    ]);

    final metricsResult = results[0] as Result<DashboardMetrics>;
    final recentResult = results[1] as Result<List<ReceiptModel>>;
    final pendingResult = results[2] as Result<List<ReceiptModel>>;

    bool hasFailure = false;
    Failure? firstFailure;

    for (final result in results) {
      result.maybeWhen(
        failure: (f) {
          hasFailure = true;
          firstFailure ??= f;
        },
        orElse: () {},
      );
    }

    if (hasFailure) {
      state = ApiState.failure(firstFailure!);
    } else {
      final metrics = metricsResult.maybeWhen(success: (d) => d, orElse: () => throw Exception());
      final recent = recentResult.maybeWhen(success: (d) => d, orElse: () => throw Exception());
      final pending = pendingResult.maybeWhen(success: (d) => d, orElse: () => throw Exception());

      final data = DashboardData(
        metrics: metrics,
        recentReceipts: recent,
        pendingReviews: pending,
      );

      await _storageService.saveCachedDashboard(jsonEncode(data.toJson()));
      state = ApiState.success(data);
    }
  }
}

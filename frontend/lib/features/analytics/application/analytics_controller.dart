import 'dart:convert';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/core/network/api_state.dart';
import 'package:receiptiq_mobile/core/storage/storage_service.dart';
import '../domain/analytics_models.dart';
import '../data/analytics_repository.dart';

final analyticsRepositoryProvider = Provider<AnalyticsRepository>((ref) {
  return AnalyticsRepository(ref.watch(apiClientProvider));
});

final analyticsControllerProvider = NotifierProvider.autoDispose<AnalyticsController, AnalyticsState>(() {
  return AnalyticsController();
});

class AnalyticsController extends AutoDisposeNotifier<AnalyticsState> {
  late AnalyticsRepository _repository;
  late StorageService _storage;
  static const _cacheKey = 'analytics_dashboard_cache';
  static const _dateRangeKey = 'analytics_date_range_pref';

  @override
  AnalyticsState build() {
    _repository = ref.watch(analyticsRepositoryProvider);
    _storage = ref.watch(storageServiceProvider);

    final savedLabel = _storage.getString(_dateRangeKey) ?? 'This Month';
    final initialRange = DateRange.fromLabel(savedLabel);

    _initLoad(initialRange);

    return AnalyticsState(
      data: const ApiState.loading(),
      selectedRange: initialRange,
    );
  }

  Future<void> _initLoad(DateRange range) async {
    // 1. Try Cache
    final cached = _storage.getString(_cacheKey);
    if (cached != null) {
      try {
        final data = AnalyticsDashboardData.fromJson(jsonDecode(cached));
        state = state.copyWith(data: ApiState.success(data));
      } catch (_) {}
    }

    // 2. Load fresh
    await _fetchData(range);
  }

  Future<void> refresh() async {
    state = state.copyWith(isRefreshing: true);
    await _fetchData(state.selectedRange);
    state = state.copyWith(isRefreshing: false);
  }

  Future<void> changeDateRange(DateRange newRange) async {
    if (state.selectedRange == newRange) return;
    
    state = state.copyWith(selectedRange: newRange, data: const ApiState.loading());
    _storage.saveString(_dateRangeKey, newRange.label); // Fire & forget
    
    await _fetchData(newRange);
  }

  Future<void> _fetchData(DateRange range) async {
    final start = range.startDate?.toIso8601String().split('T')[0];
    final end = range.endDate?.toIso8601String().split('T')[0];

    final results = await Future.wait([
      _repository.getDashboard(startDate: start, endDate: end),
      _repository.getMonthlySpend(startDate: start, endDate: end),
      _repository.getTimeline(startDate: start, endDate: end),
      _repository.getCategories(startDate: start, endDate: end),
      _repository.getStores(startDate: start, endDate: end),
      _repository.getProducts(startDate: start, endDate: end),
    ]);

    // Check if any failed
    if (results.any((r) => r.isFailure)) {
      final failedResult = results.firstWhere((r) => r.isFailure);
      final failure = failedResult.maybeWhen(failure: (f) => f, orElse: () => null)!;
      state = state.copyWith(data: ApiState.failure(failure));
      return;
    }

    final dashboard = results[0].maybeWhen(success: (d) => d as DashboardMetrics, orElse: () => null)!;
    final monthly = results[1].maybeWhen(success: (d) => d as List<MonthlySpend>, orElse: () => null)!;
    final timeline = results[2].maybeWhen(success: (d) => d as List<DailyTimeline>, orElse: () => null)!;
    final categories = results[3].maybeWhen(success: (d) => d as List<CategoryAnalytics>, orElse: () => null)!;
    final stores = results[4].maybeWhen(success: (d) => d as List<StoreAnalytics>, orElse: () => null)!;
    final products = results[5].maybeWhen(success: (d) => d as List<ProductAnalytics>, orElse: () => null)!;

    final data = AnalyticsDashboardData(
      metrics: dashboard,
      monthly: monthly,
      timeline: timeline,
      categories: categories,
      stores: stores,
      products: products,
    );

    _storage.saveString(_cacheKey, jsonEncode(data.toJson())); // Fire & forget cache
    state = state.copyWith(data: ApiState.success(data));
  }

  Future<PriceHistory?> loadProductHistory(String productName) async {
    final result = await _repository.getProductPriceHistory(productName);
    return result.maybeWhen(success: (data) => data, orElse: () => null);
  }
}

import 'package:freezed_annotation/freezed_annotation.dart';

part 'analytics_models.freezed.dart';
part 'analytics_models.g.dart';

@freezed
class StatusCounts with _$StatusCounts {
  const factory StatusCounts({
    @Default(0) int draft,
    @JsonKey(name: 'review_required') @Default(0) int reviewRequired,
    @Default(0) int confirmed,
    @Default(0) int failed,
  }) = _StatusCounts;

  factory StatusCounts.fromJson(Map<String, dynamic> json) => _$StatusCountsFromJson(json);
}

@freezed
class DashboardMetrics with _$DashboardMetrics {
  const factory DashboardMetrics({
    @JsonKey(name: 'total_receipts') required int totalReceipts,
    @JsonKey(name: 'total_spend') required double totalSpend,
    @JsonKey(name: 'average_receipt') required double averageReceipt,
    @JsonKey(name: 'largest_receipt') required double largestReceipt,
    @JsonKey(name: 'smallest_receipt') required double smallestReceipt,
    @JsonKey(name: 'status_counts') required StatusCounts statusCounts,
  }) = _DashboardMetrics;

  factory DashboardMetrics.fromJson(Map<String, dynamic> json) => _$DashboardMetricsFromJson(json);
}

@freezed
class MonthlySpend with _$MonthlySpend {
  const factory MonthlySpend({
    required String month,
    @JsonKey(name: 'total_spend') required double totalSpend,
    @JsonKey(name: 'receipt_count') required int receiptCount,
  }) = _MonthlySpend;

  factory MonthlySpend.fromJson(Map<String, dynamic> json) => _$MonthlySpendFromJson(json);
}

@freezed
class StoreAnalytics with _$StoreAnalytics {
  const factory StoreAnalytics({
    @JsonKey(name: 'store_name') required String storeName,
    @JsonKey(name: 'total_spend') required double totalSpend,
    @JsonKey(name: 'visit_count') required int visitCount,
    @JsonKey(name: 'average_spend') required double averageSpend,
    @JsonKey(name: 'last_visit') DateTime? lastVisit,
  }) = _StoreAnalytics;

  factory StoreAnalytics.fromJson(Map<String, dynamic> json) => _$StoreAnalyticsFromJson(json);
}

@freezed
class ProductAnalytics with _$ProductAnalytics {
  const factory ProductAnalytics({
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'total_quantity_purchased') required double totalQuantityPurchased,
    @JsonKey(name: 'total_spend') required double totalSpend,
    @JsonKey(name: 'average_price') required double averagePrice,
    @JsonKey(name: 'percentage_price_trend') double? percentagePriceTrend,
  }) = _ProductAnalytics;

  factory ProductAnalytics.fromJson(Map<String, dynamic> json) => _$ProductAnalyticsFromJson(json);
}

@freezed
class PriceHistory with _$PriceHistory {
  const factory PriceHistory({
    @JsonKey(name: 'item_name') required String itemName,
    @JsonKey(name: 'average_price') required double averagePrice,
    @JsonKey(name: 'min_price') required double minPrice,
    @JsonKey(name: 'max_price') required double maxPrice,
    required String trend,
    @JsonKey(name: 'percentage_change') double? percentageChange,
  }) = _PriceHistory;

  factory PriceHistory.fromJson(Map<String, dynamic> json) => _$PriceHistoryFromJson(json);
}

@freezed
class CategoryAnalytics with _$CategoryAnalytics {
  const factory CategoryAnalytics({
    @JsonKey(name: 'category_name') required String categoryName,
    @JsonKey(name: 'total_spend') required double totalSpend,
    @JsonKey(name: 'item_count') required int itemCount,
    @JsonKey(name: 'receipt_count') required int receiptCount,
  }) = _CategoryAnalytics;

  factory CategoryAnalytics.fromJson(Map<String, dynamic> json) => _$CategoryAnalyticsFromJson(json);
}

@freezed
class DailyTimeline with _$DailyTimeline {
  const factory DailyTimeline({
    required DateTime date,
    @JsonKey(name: 'total_spend') required double totalSpend,
    @JsonKey(name: 'receipt_count') required int receiptCount,
  }) = _DailyTimeline;

  factory DailyTimeline.fromJson(Map<String, dynamic> json) => _$DailyTimelineFromJson(json);
}

@freezed
class AnalyticsDashboardData with _$AnalyticsDashboardData {
  const factory AnalyticsDashboardData({
    required DashboardMetrics metrics,
    required List<MonthlySpend> monthly,
    required List<DailyTimeline> timeline,
    required List<CategoryAnalytics> categories,
    required List<StoreAnalytics> stores,
    required List<ProductAnalytics> products,
  }) = _AnalyticsDashboardData;

  factory AnalyticsDashboardData.fromJson(Map<String, dynamic> json) => _$AnalyticsDashboardDataFromJson(json);
}

class DateRange {
  final DateTime? startDate;
  final DateTime? endDate;
  final String label;

  const DateRange({this.startDate, this.endDate, required this.label});

  factory DateRange.thisMonth() {
    final now = DateTime.now();
    return DateRange(
      startDate: DateTime(now.year, now.month, 1),
      endDate: now,
      label: 'This Month',
    );
  }

  factory DateRange.last3Months() {
    final now = DateTime.now();
    return DateRange(
      startDate: DateTime(now.year, now.month - 2, 1),
      endDate: now,
      label: 'Last 3 Months',
    );
  }

  factory DateRange.last6Months() {
    final now = DateTime.now();
    return DateRange(
      startDate: DateTime(now.year, now.month - 5, 1),
      endDate: now,
      label: 'Last 6 Months',
    );
  }

  factory DateRange.thisYear() {
    final now = DateTime.now();
    return DateRange(
      startDate: DateTime(now.year, 1, 1),
      endDate: now,
      label: 'This Year',
    );
  }

  factory DateRange.fromLabel(String label) {
    switch (label) {
      case 'Last 3 Months': return DateRange.last3Months();
      case 'Last 6 Months': return DateRange.last6Months();
      case 'This Year': return DateRange.thisYear();
      default: return DateRange.thisMonth();
    }
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DateRange &&
          runtimeType == other.runtimeType &&
          startDate == other.startDate &&
          endDate == other.endDate &&
          label == other.label;

  @override
  int get hashCode => startDate.hashCode ^ endDate.hashCode ^ label.hashCode;
}

@freezed
class AnalyticsState with _$AnalyticsState {
  const factory AnalyticsState({
    @Default(ApiState.initial()) ApiState<AnalyticsDashboardData> data,
    required DateRange selectedRange,
    @Default(false) bool isRefreshing,
  }) = _AnalyticsState;
}

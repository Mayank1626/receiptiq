import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_metrics.freezed.dart';
part 'dashboard_metrics.g.dart';

@freezed
class DashboardMetrics with _$DashboardMetrics {
  const factory DashboardMetrics({
    @Default(0) int totalReceipts,
    @Default(0.0) double totalSpend,
    @Default(0.0) double averageReceipt,
    @Default(0.0) double largestReceipt,
    @Default(0.0) double smallestReceipt,
    required StatusCounts statusCounts,
  }) = _DashboardMetrics;

  factory DashboardMetrics.fromJson(Map<String, dynamic> json) => _$DashboardMetricsFromJson(json);
}

@freezed
class StatusCounts with _$StatusCounts {
  const factory StatusCounts({
    @Default(0) int draft,
    @Default(0) int reviewRequired,
    @Default(0) int confirmed,
    @Default(0) int failed,
  }) = _StatusCounts;

  factory StatusCounts.fromJson(Map<String, dynamic> json) => _$StatusCountsFromJson(json);
}

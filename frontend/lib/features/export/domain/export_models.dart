import 'package:freezed_annotation/freezed_annotation.dart';
import '../../receipts/domain/receipt_model.dart';
import '../../analytics/domain/analytics_models.dart';
import '../../households/domain/household_models.dart';
import '../../splits/domain/split_models.dart';

part 'export_models.freezed.dart';
part 'export_models.g.dart';

enum ExportFormat {
  pdf,
  csv,
  excel,
}

enum ReportPeriod {
  today,
  thisWeek,
  thisMonth,
  lastMonth,
  last6Months,
  thisYear,
  custom,
}

enum ExportJobStatus {
  idle,
  preparing,
  collecting,
  building,
  generating,
  saving,
  completed,
  failed,
}

@freezed
class ExportJob with _$ExportJob {
  const factory ExportJob({
    @Default(ExportJobStatus.idle) ExportJobStatus status,
    String? generatedFilePath,
    String? errorMessage,
    double? progress,
  }) = _ExportJob;
}

@freezed
class ExportRequest with _$ExportRequest {
  const factory ExportRequest({
    @Default(ExportFormat.pdf) ExportFormat format,
    @Default(ReportPeriod.thisMonth) ReportPeriod period,
    DateTime? startDate,
    DateTime? endDate,
    @Default(true) bool includeSummary,
    @Default(true) bool includeReceipts,
    @Default(true) bool includeCategories,
    @Default(true) bool includeStores,
    @Default(false) bool includeHousehold,
  }) = _ExportRequest;
}

@freezed
class ExportHistoryItem with _$ExportHistoryItem {
  const factory ExportHistoryItem({
    required String id,
    required ExportFormat format,
    required DateTime date,
    required String periodDescription,
    required String fileName,
    required String filePath,
  }) = _ExportHistoryItem;

  factory ExportHistoryItem.fromJson(Map<String, dynamic> json) => _$ExportHistoryItemFromJson(json);
}

class ReportData {
  final ExportRequest request;
  final List<ReceiptModel> receipts;
  final AnalyticsSummary? analytics;
  final HouseholdBalance? householdBalances;
  final List<ExpenseSplit>? splits;

  ReportData({
    required this.request,
    required this.receipts,
    this.analytics,
    this.householdBalances,
    this.splits,
  });
}

import 'package:freezed_annotation/freezed_annotation.dart';
import 'dashboard_metrics.dart';
import '../../receipts/domain/receipt_model.dart';

part 'dashboard_data.freezed.dart';
part 'dashboard_data.g.dart';

@freezed
class DashboardData with _$DashboardData {
  const factory DashboardData({
    required DashboardMetrics metrics,
    required List<ReceiptModel> recentReceipts,
    required List<ReceiptModel> pendingReviews,
  }) = _DashboardData;

  factory DashboardData.fromJson(Map<String, dynamic> json) => _$DashboardDataFromJson(json);
}

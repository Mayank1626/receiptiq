import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receiptiq_mobile/features/receipts/domain/receipt_model.dart';
import 'package:receiptiq_mobile/core/network/failure.dart';
import 'package:receiptiq_mobile/features/analytics/domain/analytics_models.dart';

part 'history_models.freezed.dart';

@freezed
class ReceiptFilter with _$ReceiptFilter {
  const factory ReceiptFilter({
    ReceiptStatus? status,
    DateRange? dateRange,
    double? minAmount,
    double? maxAmount,
    @Default('') String searchQuery,
  }) = _ReceiptFilter;
}

@freezed
class HistoryState with _$HistoryState {
  const factory HistoryState({
    @Default([]) List<ReceiptModel> items,
    @Default(ReceiptFilter()) ReceiptFilter filter,
    @Default(true) bool isFirstLoad,
    @Default(false) bool isLoadingMore,
    @Default(false) bool hasReachedEnd,
    Failure? error,
  }) = _HistoryState;
}

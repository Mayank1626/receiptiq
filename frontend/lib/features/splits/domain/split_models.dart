import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:receiptiq_mobile/core/network/api_state.dart';

part 'split_models.freezed.dart';
part 'split_models.g.dart';

enum SplitType { equal, percentage, fixed }

@freezed
class ExpenseShareBase with _$ExpenseShareBase {
  const factory ExpenseShareBase({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'amount_paid') @Default(0.0) double amountPaid,
    @JsonKey(name: 'amount_owed') required double amountOwed,
    @JsonKey(name: 'percentage_share') double? percentageShare,
  }) = _ExpenseShareBase;

  factory ExpenseShareBase.fromJson(Map<String, dynamic> json) => _$ExpenseShareBaseFromJson(json);
}

@freezed
class ExpenseShareCreate with _$ExpenseShareCreate {
  const factory ExpenseShareCreate({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'amount_paid') @Default(0.0) double amountPaid,
    @JsonKey(name: 'amount_owed') required double amountOwed,
    @JsonKey(name: 'percentage_share') double? percentageShare,
  }) = _ExpenseShareCreate;

  factory ExpenseShareCreate.fromJson(Map<String, dynamic> json) => _$ExpenseShareCreateFromJson(json);
}

@freezed
class ExpenseSplitCreate with _$ExpenseSplitCreate {
  const factory ExpenseSplitCreate({
    @JsonKey(name: 'split_type') required SplitType splitType,
    required List<ExpenseShareCreate> shares,
  }) = _ExpenseSplitCreate;

  factory ExpenseSplitCreate.fromJson(Map<String, dynamic> json) => _$ExpenseSplitCreateFromJson(json);
}

@freezed
class UserBalance with _$UserBalance {
  const factory UserBalance({
    @JsonKey(name: 'user_id') required String userId,
    @JsonKey(name: 'net_balance') required double netBalance,
  }) = _UserBalance;

  factory UserBalance.fromJson(Map<String, dynamic> json) => _$UserBalanceFromJson(json);
}

@freezed
class SuggestedSettlementResponse with _$SuggestedSettlementResponse {
  const factory SuggestedSettlementResponse({
    @JsonKey(name: 'payer_id') required String payerId,
    @JsonKey(name: 'payee_id') required String payeeId,
    required double amount,
  }) = _SuggestedSettlementResponse;

  factory SuggestedSettlementResponse.fromJson(Map<String, dynamic> json) => _$SuggestedSettlementResponseFromJson(json);
}

@freezed
class SettlementCreate with _$SettlementCreate {
  const factory SettlementCreate({
    @JsonKey(name: 'payer_id') required String payerId,
    @JsonKey(name: 'payee_id') required String payeeId,
    required double amount,
  }) = _SettlementCreate;

  factory SettlementCreate.fromJson(Map<String, dynamic> json) => _$SettlementCreateFromJson(json);
}

// Ledger Entries
@Freezed(unionKey: 'type')
class LedgerEntry with _$LedgerEntry {
  const factory LedgerEntry.split({
    required String id,
    @JsonKey(name: 'receipt_id') required String receiptId,
    @JsonKey(name: 'total_amount') required double totalAmount,
    @JsonKey(name: 'split_type') required SplitType splitType,
    required DateTime timestamp,
  }) = LedgerSplitEntry;

  const factory LedgerEntry.settlement({
    required String id,
    @JsonKey(name: 'payer_id') required String payerId,
    @JsonKey(name: 'payee_id') required String payeeId,
    required double amount,
    required DateTime timestamp,
  }) = LedgerSettlementEntry;

  factory LedgerEntry.fromJson(Map<String, dynamic> json) => _$LedgerEntryFromJson(json);
}

@freezed
class LedgerResponse with _$LedgerResponse {
  const factory LedgerResponse({
    required List<LedgerEntry> entries,
  }) = _LedgerResponse;

  factory LedgerResponse.fromJson(Map<String, dynamic> json) => _$LedgerResponseFromJson(json);
}

@freezed
class SplitState with _$SplitState {
  const factory SplitState({
    @Default(ApiState.initial()) ApiState<List<UserBalance>> balances,
    @Default(ApiState.initial()) ApiState<List<SuggestedSettlementResponse>> settlements,
    @Default(ApiState.initial()) ApiState<LedgerResponse> ledger,
    @Default(false) bool isCompletingSettlement,
    @Default(false) bool isSplitting,
  }) = _SplitState;
}

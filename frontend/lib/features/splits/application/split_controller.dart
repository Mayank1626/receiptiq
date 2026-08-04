import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/core/network/api_state.dart';
import '../domain/split_models.dart';
import '../data/split_repository.dart';

final splitRepositoryProvider = Provider<SplitRepository>((ref) {
  return SplitRepository(ref.watch(apiClientProvider));
});

final splitControllerProvider = NotifierProvider.autoDispose<SplitController, SplitState>(() {
  return SplitController();
});

class SplitController extends AutoDisposeNotifier<SplitState> {
  late SplitRepository _repository;

  @override
  SplitState build() {
    _repository = ref.watch(splitRepositoryProvider);
    return const SplitState();
  }

  Future<void> loadHouseholdData(String householdId) async {
    state = state.copyWith(
      balances: const ApiState.loading(),
      settlements: const ApiState.loading(),
      ledger: const ApiState.loading(),
    );

    final results = await Future.wait([
      _repository.getBalances(householdId),
      _repository.getSuggestedSettlements(householdId),
      _repository.getLedger(householdId),
    ]);

    final balancesResult = results[0] as Result<List<UserBalance>>;
    final settlementsResult = results[1] as Result<List<SuggestedSettlementResponse>>;
    final ledgerResult = results[2] as Result<LedgerResponse>;

    state = state.copyWith(
      balances: balancesResult.isSuccess ? ApiState.loaded(balancesResult.getSuccess()!) : ApiState.error(balancesResult.getFailure()!),
      settlements: settlementsResult.isSuccess ? ApiState.loaded(settlementsResult.getSuccess()!) : ApiState.error(settlementsResult.getFailure()!),
      ledger: ledgerResult.isSuccess ? ApiState.loaded(ledgerResult.getSuccess()!) : ApiState.error(ledgerResult.getFailure()!),
    );
  }

  Future<bool> createSplit(String receiptId, ExpenseSplitCreate splitIn, double receiptTotal) async {
    // Client-side validation
    if (splitIn.splitType == SplitType.percentage) {
      final totalPercent = splitIn.shares.fold<double>(0.0, (sum, share) => sum + (share.percentageShare ?? 0));
      if ((totalPercent - 100.0).abs() > 0.01) return false;
    } else if (splitIn.splitType == SplitType.fixed) {
      final totalFixed = splitIn.shares.fold<double>(0.0, (sum, share) => sum + share.amountOwed);
      if ((totalFixed - receiptTotal).abs() > 0.01) return false;
    }

    state = state.copyWith(isSplitting: true);
    final result = await _repository.createSplit(receiptId, splitIn);
    state = state.copyWith(isSplitting: false);

    return result.isSuccess;
  }

  Future<bool> completeSettlement(String householdId, String payerId, String payeeId, double amount) async {
    state = state.copyWith(isCompletingSettlement: true);
    final result = await _repository.completeSettlement(householdId, payerId, payeeId, amount);
    state = state.copyWith(isCompletingSettlement: false);

    if (result.isSuccess) {
      await loadHouseholdData(householdId);
    }
    
    return result.isSuccess;
  }
}

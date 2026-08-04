import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:receiptiq_mobile/core/network/api_state.dart';
import 'package:receiptiq_mobile/features/households/application/household_controller.dart';
import '../../domain/split_models.dart';
import '../../application/split_controller.dart';
import 'package:receiptiq_mobile/features/households/domain/household_models.dart';

class HouseholdBalancesScreen extends ConsumerStatefulWidget {
  const HouseholdBalancesScreen({super.key});

  @override
  ConsumerState<HouseholdBalancesScreen> createState() => _HouseholdBalancesScreenState();
}

class _HouseholdBalancesScreenState extends ConsumerState<HouseholdBalancesScreen> {
  final currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
  
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final householdState = ref.read(householdControllerProvider);
      if (householdState.activeWorkspace.type == WorkspaceType.household) {
        ref.read(splitControllerProvider.notifier).loadHouseholdData(householdState.activeWorkspace.householdId!);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final splitState = ref.watch(splitControllerProvider);
    final householdState = ref.watch(householdControllerProvider);
    
    if (householdState.activeWorkspace.type != WorkspaceType.household || householdState.activeWorkspace.householdId == null) {
      return const Scaffold(
        body: Center(child: Text('Join or Create a Household to see balances.')),
      );
    }

    final householdId = householdState.activeWorkspace.householdId!;
    
    final members = householdState.households.maybeWhen(
      loaded: (list) => list.where((h) => h.id == householdId).firstOrNull?.members ?? [],
      orElse: () => <HouseholdMemberModel>[],
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Household Ledger'),
      ),
      body: splitState.isCompletingSettlement
          ? const Center(child: CircularProgressIndicator())
          : RefreshIndicator(
              onRefresh: () => ref.read(splitControllerProvider.notifier).loadHouseholdData(householdId),
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildBalancesSection(splitState.balances, members),
                    const SizedBox(height: 32),
                    _buildSuggestionsSection(splitState.settlements, members, householdId),
                    const SizedBox(height: 32),
                    _buildLedgerSection(splitState.ledger, members),
                  ],
                ),
              ),
            ),
    );
  }

  Widget _buildBalancesSection(ApiState<List<UserBalance>> state, List<HouseholdMemberModel> members) {
    return state.when(
      initial: () => const Center(child: CircularProgressIndicator()),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (f) => Text('Error loading balances: ${f.message}'),
      loaded: (balances) {
        if (balances.isEmpty) {
          return const Center(child: Text('Everyone is settled 🎉'));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Balances', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ...balances.map((b) {
              final memberName = members.firstWhere((m) => m.userId == b.userId, orElse: () => HouseholdMemberModel(userId: b.userId, email: 'Unknown', role: 'MEMBER')).email.split('@').first;
              final isPositive = b.netBalance > 0;
              final isNegative = b.netBalance < 0;
              final color = isPositive ? Colors.green : (isNegative ? Colors.red : Colors.grey);
              final text = isPositive ? 'Receive ${currencyFormat.format(b.netBalance)}' : (isNegative ? 'Pay ${currencyFormat.format(b.netBalance.abs())}' : 'Settled');

              return Card(
                elevation: 0,
                color: Theme.of(context).colorScheme.surfaceContainerHighest,
                margin: const EdgeInsets.only(bottom: 8),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primaryContainer,
                    child: Text(memberName.substring(0, 1).toUpperCase()),
                  ),
                  title: Text(memberName, style: const TextStyle(fontWeight: FontWeight.bold)),
                  trailing: Text(
                    text,
                    style: TextStyle(
                      color: color,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildSuggestionsSection(ApiState<List<SuggestedSettlementResponse>> state, List<HouseholdMemberModel> members, String householdId) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
      error: (f) => const SizedBox.shrink(),
      loaded: (suggestions) {
        if (suggestions.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Suggested Settlements', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ...suggestions.map((s) {
              final payerName = members.firstWhere((m) => m.userId == s.payerId, orElse: () => HouseholdMemberModel(userId: s.payerId, email: 'Unknown', role: 'MEMBER')).email.split('@').first;
              final payeeName = members.firstWhere((m) => m.userId == s.payeeId, orElse: () => HouseholdMemberModel(userId: s.payeeId, email: 'Unknown', role: 'MEMBER')).email.split('@').first;
              
              return Card(
                elevation: 1,
                margin: const EdgeInsets.only(bottom: 8),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(payerName, style: const TextStyle(fontWeight: FontWeight.bold)),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(Icons.arrow_forward, size: 16, color: Colors.grey),
                                ),
                                Text(payeeName, style: const TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 4),
                            Text(
                              currencyFormat.format(s.amount),
                              style: const TextStyle(fontSize: 18, color: Colors.blue, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                      FilledButton.tonal(
                        onPressed: () => _completeSettlement(householdId, s),
                        child: const Text('Complete'),
                      ),
                    ],
                  ),
                ),
              );
            }),
          ],
        );
      },
    );
  }

  Future<void> _completeSettlement(String householdId, SuggestedSettlementResponse settlement) async {
    final controller = ref.read(splitControllerProvider.notifier);
    final success = await controller.completeSettlement(householdId, settlement.payerId, settlement.payeeId, settlement.amount);
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Row(
          children: [
            Icon(Icons.check_circle, color: Colors.green),
            SizedBox(width: 8),
            Text('Settlement recorded!'),
          ],
        ),
      ));
    }
  }

  Widget _buildLedgerSection(ApiState<LedgerResponse> state, List<HouseholdMemberModel> members) {
    return state.when(
      initial: () => const SizedBox.shrink(),
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (f) => const SizedBox.shrink(),
      loaded: (ledger) {
        if (ledger.entries.isEmpty) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Ledger', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            ...ledger.entries.map((entry) {
              return entry.map(
                split: (s) {
                  return ListTile(
                    leading: const CircleAvatar(child: Icon(Icons.receipt_long, size: 16)),
                    title: const Text('🧾 Split Expense'),
                    subtitle: Text(DateFormat.yMMMd().format(s.timestamp)),
                    trailing: Text(
                      currencyFormat.format(s.totalAmount),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  );
                },
                settlement: (s) {
                  final payerName = members.firstWhere((m) => m.userId == s.payerId, orElse: () => HouseholdMemberModel(userId: s.payerId, email: 'Unknown', role: 'MEMBER')).email.split('@').first;
                  final payeeName = members.firstWhere((m) => m.userId == s.payeeId, orElse: () => HouseholdMemberModel(userId: s.payeeId, email: 'Unknown', role: 'MEMBER')).email.split('@').first;
                  
                  return ListTile(
                    leading: const CircleAvatar(backgroundColor: Colors.green, child: Icon(Icons.payment, size: 16, color: Colors.white)),
                    title: Text('💸 $payerName → $payeeName'),
                    subtitle: Text(DateFormat.yMMMd().format(s.timestamp)),
                    trailing: Text(
                      currencyFormat.format(s.amount),
                      style: const TextStyle(color: Colors.green, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              );
            }),
          ],
        );
      },
    );
  }
}

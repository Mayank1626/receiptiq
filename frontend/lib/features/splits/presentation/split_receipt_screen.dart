import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:go_router/go_router.dart';
import 'package:receiptiq_mobile/features/receipts/domain/receipt_model.dart';
import 'package:receiptiq_mobile/features/households/application/household_controller.dart';
import 'package:receiptiq_mobile/features/households/domain/household_models.dart';
import '../../domain/split_models.dart';
import '../../application/split_controller.dart';

class SplitReceiptScreen extends ConsumerStatefulWidget {
  final String receiptId;
  final double receiptTotal;

  const SplitReceiptScreen({super.key, required this.receiptId, required this.receiptTotal});

  @override
  ConsumerState<SplitReceiptScreen> createState() => _SplitReceiptScreenState();
}

class _SplitReceiptScreenState extends ConsumerState<SplitReceiptScreen> {
  SplitType _splitType = SplitType.equal;
  String? _whoPaidId;
  Map<String, double> _customValues = {};

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final householdState = ref.read(householdControllerProvider);
      final activeWorkspace = householdState.activeWorkspace;
      
      if (activeWorkspace.type == WorkspaceType.household) {
        final household = householdState.households.maybeWhen(
          loaded: (list) => list.where((h) => h.id == activeWorkspace.householdId).firstOrNull,
          orElse: () => null,
        );
        
        if (household != null && household.members.isNotEmpty) {
          // Default whoPaidId to the first member (or could be current user if we had their ID easily)
          setState(() {
            _whoPaidId = household.members.first.userId;
            // Initialize custom values evenly for equal split, or 0
            _calculateEqualSplit(household.members);
          });
        }
      }
    });
  }

  void _calculateEqualSplit(List<HouseholdMemberModel> members) {
    if (members.isEmpty) return;
    final share = widget.receiptTotal / members.length;
    final newValues = <String, double>{};
    for (var m in members) {
      newValues[m.userId] = share;
    }
    setState(() {
      _customValues = newValues;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
    final splitState = ref.watch(splitControllerProvider);
    final householdState = ref.watch(householdControllerProvider);
    
    final household = householdState.households.maybeWhen(
      loaded: (list) => list.where((h) => h.id == householdState.activeWorkspace.householdId).firstOrNull,
      orElse: () => null,
    );

    if (household == null) {
      return Scaffold(
        appBar: AppBar(title: const Text('Split Expense')),
        body: const Center(child: Text('No active household found.')),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Split Expense'),
      ),
      body: splitState.isSplitting
          ? const Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text('Receipt Total', style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.grey)),
                  Text(currencyFormat.format(widget.receiptTotal), style: Theme.of(context).textTheme.headlineMedium),
                  const SizedBox(height: 24),
                  
                  SegmentedButton<SplitType>(
                    segments: const [
                      ButtonSegment(value: SplitType.equal, label: Text('Equal')),
                      ButtonSegment(value: SplitType.percentage, label: Text('Percentage')),
                      ButtonSegment(value: SplitType.fixed, label: Text('Fixed')),
                    ],
                    selected: {_splitType},
                    onSelectionChanged: (set) {
                      setState(() {
                        _splitType = set.first;
                        if (_splitType == SplitType.equal) {
                          _calculateEqualSplit(household.members);
                        } else {
                          // Reset custom values for percentage or fixed
                          _customValues.clear();
                          for (var m in household.members) {
                            _customValues[m.userId] = 0;
                          }
                        }
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  
                  DropdownButtonFormField<String>(
                    decoration: const InputDecoration(labelText: 'Who Paid?'),
                    value: _whoPaidId,
                    items: household.members.map((m) => DropdownMenuItem(
                      value: m.userId,
                      child: Text(m.email.split('@').first),
                    )).toList(),
                    onChanged: (val) {
                      setState(() {
                        _whoPaidId = val;
                      });
                    },
                  ),
                  const SizedBox(height: 24),
                  
                  if (_splitType == SplitType.fixed)
                    _buildFixedValidator(context, currencyFormat),
                  if (_splitType == SplitType.percentage)
                    _buildPercentageValidator(context),

                  const SizedBox(height: 16),
                  Text('Shares', style: Theme.of(context).textTheme.titleMedium),
                  const SizedBox(height: 8),
                  
                  ...household.members.map((m) => _buildMemberShare(m, currencyFormat)),
                  
                  const SizedBox(height: 24),
                  _buildLivePreview(household.members, currencyFormat),
                  const SizedBox(height: 24),
                  
                  FilledButton.icon(
                    onPressed: () => _submitSplit(household.members),
                    icon: const Icon(Icons.check),
                    label: const Text('Create Split'),
                  ),
                ],
              ),
            ),
    );
  }

  Widget _buildFixedValidator(BuildContext context, NumberFormat currencyFormat) {
    final currentSum = _customValues.values.fold(0.0, (a, b) => a + b);
    final remaining = widget.receiptTotal - currentSum;
    final isZero = remaining.abs() < 0.01;
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: isZero ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Remaining: ${currencyFormat.format(remaining)}',
        style: TextStyle(
          color: isZero ? Colors.green : Colors.orange[800],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildPercentageValidator(BuildContext context) {
    final currentSum = _customValues.values.fold(0.0, (a, b) => a + b);
    final is100 = (currentSum - 100).abs() < 0.01;
    
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: is100 ? Colors.green.withValues(alpha: 0.1) : Colors.orange.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        'Total: ${currentSum.toStringAsFixed(0)}% (Must be 100%)',
        style: TextStyle(
          color: is100 ? Colors.green : Colors.orange[800],
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildMemberShare(HouseholdMemberModel member, NumberFormat currencyFormat) {
    return Card(
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.secondaryContainer,
                  child: Text(member.email.substring(0, 1).toUpperCase()),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    member.email.split('@').first,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                if (_splitType == SplitType.equal)
                  Text(
                    currencyFormat.format(_customValues[member.userId] ?? 0),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
              ],
            ),
            if (_splitType == SplitType.percentage) ...[
              const SizedBox(height: 8),
              Row(
                children: [
                  Expanded(
                    child: Slider(
                      value: _customValues[member.userId] ?? 0,
                      min: 0,
                      max: 100,
                      divisions: 100,
                      label: '${(_customValues[member.userId] ?? 0).toStringAsFixed(0)}%',
                      onChanged: (val) {
                        setState(() {
                          _customValues[member.userId] = val;
                        });
                      },
                    ),
                  ),
                  Text('${(_customValues[member.userId] ?? 0).toStringAsFixed(0)}%'),
                ],
              ),
            ],
            if (_splitType == SplitType.fixed) ...[
              const SizedBox(height: 8),
              TextFormField(
                initialValue: (_customValues[member.userId] ?? 0).toString(),
                keyboardType: const TextInputType.numberWithOptions(decimal: true),
                decoration: InputDecoration(
                  prefixText: '₹ ',
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                ),
                onChanged: (val) {
                  setState(() {
                    _customValues[member.userId] = double.tryParse(val) ?? 0.0;
                  });
                },
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildLivePreview(List<HouseholdMemberModel> members, NumberFormat currencyFormat) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Icon(Icons.preview, size: 16),
              const SizedBox(width: 8),
              Text('Live Preview', style: Theme.of(context).textTheme.titleSmall),
            ],
          ),
          const Divider(),
          ...members.map((m) {
            double amountPaid = m.userId == _whoPaidId ? widget.receiptTotal : 0.0;
            double amountOwed = 0;
            
            if (_splitType == SplitType.equal || _splitType == SplitType.fixed) {
              amountOwed = _customValues[m.userId] ?? 0;
            } else {
              amountOwed = widget.receiptTotal * ((_customValues[m.userId] ?? 0) / 100);
            }
            
            double net = amountPaid - amountOwed;
            
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Row(
                children: [
                  Expanded(flex: 2, child: Text(m.email.split('@').first, style: const TextStyle(fontWeight: FontWeight.bold))),
                  Expanded(flex: 3, child: Text('Owes ${currencyFormat.format(amountOwed)}', style: const TextStyle(color: Colors.grey))),
                  Expanded(flex: 3, child: Text(
                    net > 0 ? 'Gets ${currencyFormat.format(net)}' : net < 0 ? 'Pays ${currencyFormat.format(net.abs())}' : 'Settled',
                    style: TextStyle(
                      color: net > 0 ? Colors.green : net < 0 ? Colors.red : Colors.grey,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.right,
                  )),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }

  Future<void> _submitSplit(List<HouseholdMemberModel> members) async {
    final controller = ref.read(splitControllerProvider.notifier);
    
    // Create shares
    final shares = members.map((m) {
      double amountPaid = m.userId == _whoPaidId ? widget.receiptTotal : 0.0;
      double amountOwed = 0;
      double? percentageShare;
      
      if (_splitType == SplitType.equal || _splitType == SplitType.fixed) {
        amountOwed = _customValues[m.userId] ?? 0;
      } else {
        percentageShare = _customValues[m.userId] ?? 0;
        amountOwed = widget.receiptTotal * (percentageShare / 100);
      }
      
      return ExpenseShareCreate(
        userId: m.userId,
        amountPaid: amountPaid,
        amountOwed: amountOwed,
        percentageShare: percentageShare,
      );
    }).toList();
    
    final splitIn = ExpenseSplitCreate(
      splitType: _splitType,
      shares: shares,
    );

    final success = await controller.createSplit(widget.receiptId, splitIn, widget.receiptTotal);
    
    if (success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Receipt Split Successfully!')));
      
      // Navigate back to history or dashboard
      context.pop();
    } else if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Validation failed or network error.')));
    }
  }
}

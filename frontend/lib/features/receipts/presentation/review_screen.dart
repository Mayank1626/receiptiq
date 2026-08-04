import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/network/api_state.dart';
import '../../../../core/widgets/api_state_widget.dart';
import '../application/review_controller.dart';
import '../domain/review_models.dart';
import 'widgets/receipt_header_card.dart';
import 'widgets/store_info_card.dart';
import 'widgets/financial_summary_card.dart';
import 'widgets/receipt_items_list.dart';
import 'widgets/audit_history_sheet.dart';
import 'package:receiptiq_mobile/features/households/application/household_controller.dart';
import 'package:receiptiq_mobile/features/households/domain/household_models.dart';

class ReviewScreen extends ConsumerWidget {
  final String receiptId;

  const ReviewScreen({super.key, required this.receiptId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reviewControllerProvider(receiptId));
    final controller = ref.read(reviewControllerProvider(receiptId).notifier);

    return WillPopScope(
      onWillPop: () async {
        if (state is AsyncData && (state).value.hasUnsavedChanges) {
          final confirm = await showDialog<bool>(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('Discard changes?'),
              content: const Text('You have unsaved changes. Are you sure you want to discard them?'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context, false),
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () => Navigator.pop(context, true),
                  child: const Text('Discard', style: TextStyle(color: Colors.red)),
                ),
              ],
            ),
          );
          return confirm ?? false;
        }
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Review Receipt'),
          leading: IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              context.pop(); // Handled by WillPopScope if unsaved changes exist
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.history),
              onPressed: () {
                controller.refreshAudits();
                showModalBottomSheet(
                  context: context,
                  builder: (_) => AuditHistorySheet(receiptId: receiptId),
                );
              },
            ),
          ],
        ),
        body: ApiStateWidget<ReviewStateData>(
          state: state,
          onRetry: () => controller.build(receiptId),
          successBuilder: (data) => _buildContent(context, ref, data, controller),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context, WidgetRef ref, ReviewStateData data, ReviewController controller) {
    return Column(
      children: [
        if (data.hasUnsavedChanges)
          Container(
            color: Theme.of(context).colorScheme.tertiaryContainer,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Row(
              children: [
                const Icon(Icons.info_outline, size: 20),
                const SizedBox(width: 8),
                const Expanded(child: Text('You have unsaved changes')),
                if (data.isSaving)
                  const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                else
                  TextButton(
                    onPressed: () async {
                      try {
                        await controller.saveChanges();
                      } catch (e) {
                        if (context.mounted) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Failed to save changes. Reverted locally.')),
                          );
                        }
                      }
                    },
                    child: const Text('Save Changes'),
                  ),
              ],
            ),
          ),
        Expanded(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              ReceiptHeaderCard(receipt: data.editedReceipt, aiConfidence: data.aiConfidence),
              const SizedBox(height: 16),
              StoreInfoCard(
                receipt: data.editedReceipt,
                onUpdate: (storeName, date) => controller.updateField(storeName: storeName, date: date),
              ),
              const SizedBox(height: 16),
              FinancialSummaryCard(
                receipt: data.editedReceipt,
                onUpdate: (subtotal, tax, discount, delivery, total) => controller.updateField(
                  subtotal: subtotal,
                  tax: tax,
                  discount: discount,
                  deliveryCharge: delivery,
                  totalAmount: total,
                ),
              ),
              const SizedBox(height: 16),
              ReceiptItemsList(
                items: data.editedReceipt.items,
                onAdd: (item) => controller.addItem(item),
                onEdit: (item) => controller.updateItem(item),
                onDelete: (itemId) => controller.deleteItem(itemId),
                onUndo: (item) => controller.restoreItem(item),
              ),
              const SizedBox(height: 80), // Padding for bottom button
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: double.infinity,
            child: FilledButton(
              onPressed: data.hasUnsavedChanges || data.isConfirming || data.isSaving
                  ? null
                  : () async {
                      final success = await controller.confirmReceipt();
                      if (success && context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('Receipt Confirmed!')),
                        );
                        final activeWorkspace = ref.read(householdControllerProvider).activeWorkspace;
                        if (activeWorkspace.type == WorkspaceType.household) {
                          // Show split expense option
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (_) => AlertDialog(
                              title: const Text('Split Expense?'),
                              content: const Text('Would you like to split this receipt with your household now?'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    context.pop();
                                    context.go('/dashboard');
                                  },
                                  child: const Text('Skip'),
                                ),
                                FilledButton(
                                  onPressed: () {
                                    context.pop(); // close dialog
                                    context.push('/receipts/$receiptId/split', extra: data.editedReceipt.totalAmount?.toDouble() ?? 0.0);
                                  },
                                  child: const Text('Split Expense'),
                                ),
                              ],
                            ),
                          );
                        } else {
                          context.go('/dashboard');
                        }
                      }
                    },
              child: data.isConfirming
                  ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                  : const Text('Confirm Receipt'),
            ),
          ),
        ),
      ],
    );
  }
}

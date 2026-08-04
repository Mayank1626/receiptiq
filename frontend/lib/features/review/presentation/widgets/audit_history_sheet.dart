import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_state.dart';
import 'package:receiptiq_mobile/features/review/application/review_controller.dart';
import 'package:receiptiq_mobile/features/review/domain/review_models.dart';
import 'package:intl/intl.dart';

class AuditHistorySheet extends ConsumerWidget {
  final String receiptId;

  const AuditHistorySheet({super.key, required this.receiptId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(reviewControllerProvider(receiptId));

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Audit History', style: Theme.of(context).textTheme.titleLarge),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () => Navigator.pop(context),
              )
            ],
          ),
          const Divider(),
          Expanded(
            child: state.maybeWhen(
              success: (data) {
                if (data.auditHistory.isEmpty) {
                  return const Center(child: Text('No edit history found.', style: TextStyle(color: Colors.grey)));
                }

                // Group by date or just show list
                return ListView.builder(
                  itemCount: data.auditHistory.length,
                  itemBuilder: (context, index) {
                    final audit = data.auditHistory[index];
                    return ListTile(
                      leading: _getAuditIcon(audit.action, context),
                      title: Text(_getAuditTitle(audit)),
                      subtitle: Text(DateFormat.yMMMd().add_jm().format(audit.editedAt)),
                    );
                  },
                );
              },
              orElse: () => const Center(child: CircularProgressIndicator()),
            ),
          )
        ],
      ),
    );
  }

  Widget _getAuditIcon(String action, BuildContext context) {
    IconData icon;
    Color color;

    switch (action.toLowerCase()) {
      case 'created':
        icon = Icons.add_circle;
        color = Colors.green;
        break;
      case 'updated':
        icon = Icons.edit;
        color = Colors.blue;
        break;
      case 'deleted':
        icon = Icons.remove_circle;
        color = Colors.red;
        break;
      case 'ai_processed':
        icon = Icons.auto_awesome;
        color = Colors.purple;
        break;
      default:
        icon = Icons.history;
        color = Colors.grey;
    }

    return CircleAvatar(
      backgroundColor: color.withValues(alpha: 0.1),
      child: Icon(icon, color: color, size: 20),
    );
  }

  String _getAuditTitle(AuditEntry audit) {
    if (audit.action.toLowerCase() == 'updated' && audit.fieldName != null) {
      return 'Changed ${audit.fieldName} from "${audit.oldValue ?? 'empty'}" to "${audit.newValue ?? 'empty'}"';
    }
    return 'Receipt ${audit.action.toLowerCase()}';
  }
}

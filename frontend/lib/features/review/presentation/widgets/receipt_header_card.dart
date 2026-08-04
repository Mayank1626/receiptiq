import 'package:flutter/material.dart';
import 'package:receiptiq_mobile/features/receipts/domain/receipt_model.dart';
import 'package:intl/intl.dart';

class ReceiptHeaderCard extends StatelessWidget {
  final ReceiptModel receipt;
  final double? aiConfidence;

  const ReceiptHeaderCard({
    super.key,
    required this.receipt,
    this.aiConfidence,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: Theme.of(context).colorScheme.primaryContainer,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundColor: Theme.of(context).colorScheme.primary,
                  child: Icon(Icons.store, color: Theme.of(context).colorScheme.onPrimary),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        receipt.storeName ?? 'Unknown Store',
                        style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        receipt.date != null ? DateFormat.yMMMd().format(receipt.date!) : 'Unknown Date',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    receipt.status,
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                )
              ],
            ),
            if (aiConfidence != null) ...[
              const SizedBox(height: 16),
              Row(
                children: [
                  Icon(Icons.auto_awesome, size: 16, color: Theme.of(context).colorScheme.secondary),
                  const SizedBox(width: 8),
                  Text(
                    'AI Confidence: ${(aiConfidence! * 100).toStringAsFixed(1)}%',
                    style: TextStyle(color: Theme.of(context).colorScheme.secondary, fontSize: 12),
                  ),
                ],
              )
            ]
          ],
        ),
      ),
    );
  }
}

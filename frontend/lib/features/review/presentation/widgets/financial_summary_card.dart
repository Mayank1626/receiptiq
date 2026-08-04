import 'package:flutter/material.dart';
import 'package:receiptiq_mobile/features/receipts/domain/receipt_model.dart';
import 'package:intl/intl.dart';

class FinancialSummaryCard extends StatelessWidget {
  final ReceiptModel receipt;
  final void Function(double? subtotal, double? tax, double? discount, double? delivery, double? total) onUpdate;

  const FinancialSummaryCard({
    super.key,
    required this.receipt,
    required this.onUpdate,
  });

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency(name: 'INR'); // Or dynamic

    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Financial Summary', style: Theme.of(context).textTheme.titleMedium),
                IconButton(
                  icon: const Icon(Icons.edit, size: 20),
                  onPressed: () => _showEditDialog(context),
                )
              ],
            ),
            const Divider(),
            _buildRow('Subtotal', receipt.subtotal ?? 0, currency),
            const SizedBox(height: 4),
            _buildRow('Tax', receipt.tax ?? 0, currency),
            const SizedBox(height: 4),
            _buildRow('Discount', receipt.discount ?? 0, currency, color: Colors.green, isNegative: true),
            const SizedBox(height: 4),
            _buildRow('Delivery', receipt.deliveryCharge ?? 0, currency),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Text('Total', style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey[700])),
                    const SizedBox(width: 8),
                    _buildBadge(),
                  ],
                ),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
                  child: Text(
                    currency.format(receipt.totalAmount ?? 0),
                    key: ValueKey<double>(receipt.totalAmount ?? 0),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRow(String label, double value, NumberFormat currency, {bool isBold = false, Color? color, bool isNegative = false}) {
    final displayValue = isNegative ? '-${currency.format(value)}' : currency.format(value);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(label, style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.normal, color: Colors.grey[700])),
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (child, animation) => ScaleTransition(scale: animation, child: child),
          child: Text(
            displayValue, 
            key: ValueKey<double>(value),
            style: TextStyle(fontWeight: isBold ? FontWeight.bold : FontWeight.w500, color: color),
          ),
        ),
      ],
    );
  }

  Widget _buildBadge() {
    final expected = (receipt.subtotal ?? 0) + (receipt.tax ?? 0) + (receipt.deliveryCharge ?? 0) - (receipt.discount ?? 0);
    final actual = receipt.totalAmount ?? 0;
    
    if (actual < 0) {
      return const _Badge(text: 'Invalid', color: Colors.red);
    } else if ((actual - expected).abs() > 0.01) {
      return const _Badge(text: 'Edited', color: Colors.orange);
    } else {
      return const _Badge(text: 'Calculated', color: Colors.green);
    }
  }

  void _showEditDialog(BuildContext context) {
    final subtotalCtrl = TextEditingController(text: receipt.subtotal?.toString() ?? '0');
    final taxCtrl = TextEditingController(text: receipt.tax?.toString() ?? '0');
    final discountCtrl = TextEditingController(text: receipt.discount?.toString() ?? '0');
    final deliveryCtrl = TextEditingController(text: receipt.deliveryCharge?.toString() ?? '0');
    final totalCtrl = TextEditingController(text: receipt.totalAmount?.toString() ?? '0');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Edit Financials'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                _buildNumberField('Subtotal', subtotalCtrl),
                _buildNumberField('Tax', taxCtrl),
                _buildNumberField('Discount', discountCtrl),
                _buildNumberField('Delivery', deliveryCtrl),
                const Divider(),
                _buildNumberField('Total Amount', totalCtrl),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            FilledButton(
              onPressed: () {
                onUpdate(
                  double.tryParse(subtotalCtrl.text),
                  double.tryParse(taxCtrl.text),
                  double.tryParse(discountCtrl.text),
                  double.tryParse(deliveryCtrl.text),
                  double.tryParse(totalCtrl.text),
                );
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  Widget _buildNumberField(String label, TextEditingController controller) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0),
      child: TextField(
        controller: controller,
        keyboardType: const TextInputType.numberWithOptions(decimal: true),
        decoration: InputDecoration(
          labelText: label,
          prefixText: '₹ ',
        ),
      ),
    );
  }
}

class _Badge extends StatelessWidget {
  final String text;
  final Color color;
  const _Badge({required this.text, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.1),
        border: Border.all(color: color.withValues(alpha: 0.5)),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.circle, size: 8, color: color),
          const SizedBox(width: 4),
          Text(text, style: TextStyle(fontSize: 10, color: color, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}

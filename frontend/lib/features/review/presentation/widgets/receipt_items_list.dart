import 'package:flutter/material.dart';
import 'package:receiptiq_mobile/features/receipts/domain/receipt_model.dart';
import 'package:intl/intl.dart';

class ReceiptItemsList extends StatelessWidget {
  final List<ReceiptItemModel> items;
  final void Function(ReceiptItemModel) onAdd;
  final void Function(ReceiptItemModel) onEdit;
  final ReceiptItemModel? Function(String) onDelete;
  final void Function(ReceiptItemModel)? onUndo;

  const ReceiptItemsList({
    super.key,
    required this.items,
    required this.onAdd,
    required this.onEdit,
    required this.onDelete,
    this.onUndo,
  });

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency(name: 'INR');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Items', style: Theme.of(context).textTheme.titleLarge),
            TextButton.icon(
              icon: const Icon(Icons.add),
              label: const Text('Add Item'),
              onPressed: () => _showItemDialog(context, null),
            )
          ],
        ),
        const SizedBox(height: 8),
        if (items.isEmpty)
          const Center(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Text('No items detected.', style: TextStyle(color: Colors.grey)),
            ),
          )
        else
          ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: items.length,
            itemBuilder: (context, index) {
              final item = items[index];
              return Dismissible(
                key: Key(item.id),
                direction: DismissDirection.endToStart,
                background: Container(
                  color: Colors.red,
                  alignment: Alignment.centerRight,
                  padding: const EdgeInsets.only(right: 16),
                  child: const Icon(Icons.delete, color: Colors.white),
                ),
                onDismissed: (_) {
                  final deletedItem = onDelete(item.id);
                  if (deletedItem != null) {
                    ScaffoldMessenger.of(context).clearSnackBars();
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${item.name} deleted'),
                        duration: const Duration(seconds: 5),
                        action: onUndo != null ? SnackBarAction(
                          label: 'UNDO',
                          onPressed: () => onUndo!(deletedItem),
                        ) : null,
                      ),
                    );
                  }
                },
                child: Card(
                  margin: const EdgeInsets.only(bottom: 8),
                  child: ListTile(
                    title: Text(item.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                    subtitle: Text('${item.quantity} x ${currency.format(item.itemPrice ?? 0)}'),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(currency.format(item.totalPrice ?? ((item.itemPrice ?? 0) * item.quantity)), style: const TextStyle(fontWeight: FontWeight.bold)),
                        IconButton(
                          icon: const Icon(Icons.edit, size: 20, color: Colors.grey),
                          onPressed: () => _showItemDialog(context, item),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }

  void _showItemDialog(BuildContext context, ReceiptItemModel? item) {
    final isEditing = item != null;
    final nameCtrl = TextEditingController(text: item?.name ?? '');
    final qtyCtrl = TextEditingController(text: item?.quantity.toString() ?? '1');
    final priceCtrl = TextEditingController(text: item?.itemPrice?.toString() ?? '0');
    final totalCtrl = TextEditingController(text: item?.totalPrice?.toString() ?? '0');

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text(isEditing ? 'Edit Item' : 'Add Item'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameCtrl,
                  decoration: const InputDecoration(labelText: 'Item Name'),
                ),
                const SizedBox(height: 12),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: qtyCtrl,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(labelText: 'Quantity'),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: TextField(
                        controller: priceCtrl,
                        keyboardType: const TextInputType.numberWithOptions(decimal: true),
                        decoration: const InputDecoration(labelText: 'Unit Price'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),
                TextField(
                  controller: totalCtrl,
                  keyboardType: const TextInputType.numberWithOptions(decimal: true),
                  decoration: const InputDecoration(labelText: 'Total Price'),
                ),
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
                final newItem = ReceiptItemModel(
                  id: item?.id ?? '', // Will be assigned in controller if new
                  receiptId: item?.receiptId ?? '',
                  name: nameCtrl.text.trim(),
                  quantity: double.tryParse(qtyCtrl.text) ?? 1.0,
                  itemPrice: double.tryParse(priceCtrl.text),
                  totalPrice: double.tryParse(totalCtrl.text),
                );
                
                if (isEditing) {
                  onEdit(newItem);
                } else {
                  onAdd(newItem);
                }
                Navigator.pop(context);
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}

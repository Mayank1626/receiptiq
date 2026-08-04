import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/analytics_models.dart';
import 'price_history_sheet.dart';

class ProductsSection extends StatelessWidget {
  final List<ProductAnalytics> products;

  const ProductsSection({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    if (products.isEmpty) return const SizedBox.shrink();

    final currency = NumberFormat.simpleCurrency(name: 'INR');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Products', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.withValues(alpha: 0.2))),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: products.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final product = products[index];
              return ListTile(
                title: Text(product.itemName, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${product.totalQuantityPurchased.toInt()} items • ${currency.format(product.averagePrice)} avg'),
                trailing: Text(currency.format(product.totalSpend), style: const TextStyle(fontWeight: FontWeight.bold)),
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
                    builder: (_) => PriceHistorySheet(productName: product.itemName),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}

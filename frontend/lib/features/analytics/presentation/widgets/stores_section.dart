import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/analytics_models.dart';

class StoresSection extends StatelessWidget {
  final List<StoreAnalytics> stores;

  const StoresSection({super.key, required this.stores});

  @override
  Widget build(BuildContext context) {
    if (stores.isEmpty) return const SizedBox.shrink();

    final currency = NumberFormat.simpleCurrency(name: 'INR');
    final maxSpend = stores.fold(0.0, (max, e) => e.totalSpend > max ? e.totalSpend : max);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Top Stores', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.withValues(alpha: 0.2))),
          child: ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: stores.length,
            separatorBuilder: (_, __) => const Divider(height: 1),
            itemBuilder: (context, index) {
              final store = stores[index];
              return ListTile(
                title: Text(store.storeName, style: const TextStyle(fontWeight: FontWeight.bold)),
                subtitle: Text('${store.visitCount} visits • ${currency.format(store.averageSpend)} avg'),
                trailing: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(currency.format(store.totalSpend), style: const TextStyle(fontWeight: FontWeight.bold)),
                    const SizedBox(height: 4),
                    SizedBox(
                      width: 60,
                      child: LinearProgressIndicator(
                        value: maxSpend > 0 ? store.totalSpend / maxSpend : 0,
                        backgroundColor: Colors.grey.withValues(alpha: 0.2),
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

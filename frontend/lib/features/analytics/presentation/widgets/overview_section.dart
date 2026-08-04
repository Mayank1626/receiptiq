import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../domain/analytics_models.dart';

class OverviewSection extends StatelessWidget {
  final DashboardMetrics metrics;

  const OverviewSection({super.key, required this.metrics});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency(name: 'INR');

    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: 12,
      mainAxisSpacing: 12,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      childAspectRatio: 1.5,
      children: [
        _buildMetricCard(context, 'Total Spend', metrics.totalSpend, isCurrency: true, currency: currency),
        _buildMetricCard(context, 'Avg Receipt', metrics.averageReceipt, isCurrency: true, currency: currency),
        _buildMetricCard(context, 'Largest Receipt', metrics.largestReceipt, isCurrency: true, currency: currency),
        _buildMetricCard(context, 'Total Receipts', metrics.totalReceipts.toDouble(), isCurrency: false),
        _buildMetricCard(context, 'Pending Reviews', metrics.statusCounts.reviewRequired.toDouble(), isCurrency: false, color: Colors.orange),
      ],
    );
  }

  Widget _buildMetricCard(BuildContext context, String title, double value, {required bool isCurrency, NumberFormat? currency, Color? color}) {
    return Card(
      elevation: 0,
      color: color?.withValues(alpha: 0.1) ?? Theme.of(context).colorScheme.surfaceContainerHighest,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(title, style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: color ?? Colors.grey[700])),
            const SizedBox(height: 8),
            TweenAnimationBuilder<double>(
              tween: Tween<double>(begin: 0, end: value),
              duration: const Duration(milliseconds: 800),
              curve: Curves.easeOutCubic,
              builder: (context, animValue, child) {
                final display = isCurrency ? currency!.format(animValue) : animValue.toInt().toString();
                return Text(
                  display,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold, color: color),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../application/analytics_controller.dart';
import '../../domain/analytics_models.dart';

class PriceHistorySheet extends ConsumerStatefulWidget {
  final String productName;

  const PriceHistorySheet({super.key, required this.productName});

  @override
  ConsumerState<PriceHistorySheet> createState() => _PriceHistorySheetState();
}

class _PriceHistorySheetState extends ConsumerState<PriceHistorySheet> {
  PriceHistory? data;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    final result = await ref.read(analyticsControllerProvider.notifier).loadProductHistory(widget.productName);
    if (mounted) {
      setState(() {
        data = result;
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: MediaQuery.of(context).padding.bottom + 16, left: 16, right: 16, top: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(width: 40, height: 4, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(2))),
          ),
          const SizedBox(height: 16),
          Text(widget.productName, style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold)),
          const Divider(),
          if (isLoading)
            const Padding(padding: EdgeInsets.all(32.0), child: Center(child: CircularProgressIndicator()))
          else if (data == null)
            const Padding(padding: EdgeInsets.all(32.0), child: Center(child: Text('Failed to load history')))
          else
            _buildContent(context, data!),
        ],
      ),
    );
  }

  Widget _buildContent(BuildContext context, PriceHistory history) {
    final currency = NumberFormat.simpleCurrency(name: 'INR');
    
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            _buildStat('Average Price', currency.format(history.averagePrice)),
            _buildStat('Min', currency.format(history.minPrice)),
            _buildStat('Max', currency.format(history.maxPrice)),
            _buildStat('Trend', history.trend == 'UP' ? '📈 Up' : history.trend == 'DOWN' ? '📉 Down' : '➖ Flat'),
          ],
        ),
        const SizedBox(height: 24),
        SizedBox(
          height: 150,
          child: LineChart(
            LineChartData(
              gridData: const FlGridData(show: false),
              titlesData: const FlTitlesData(show: false),
              borderData: FlBorderData(show: false),
              minY: history.minPrice.toDouble() * 0.9,
              maxY: history.maxPrice.toDouble() * 1.1,
              lineBarsData: [
                LineChartBarData(
                  // A mock sparkline for now since the API only gives min/max/avg/trend.
                  // If the API provided actual points, we'd plot them here.
                  spots: [
                    FlSpot(0, history.trend == 'UP' ? history.minPrice.toDouble() : history.maxPrice.toDouble()),
                    FlSpot(1, history.averagePrice.toDouble()),
                    FlSpot(2, history.trend == 'UP' ? history.maxPrice.toDouble() : history.minPrice.toDouble()),
                  ],
                  isCurved: true,
                  color: Theme.of(context).colorScheme.primary,
                  barWidth: 3,
                  isStrokeCapRound: true,
                  dotData: const FlDotData(show: true),
                ),
              ],
            ),
            swapAnimationDuration: const Duration(milliseconds: 1000),
            swapAnimationCurve: Curves.easeOutCubic,
          ),
        ),
      ],
    );
  }

  Widget _buildStat(String label, String value) {
    return Column(
      children: [
        Text(label, style: const TextStyle(color: Colors.grey, fontSize: 12)),
        const SizedBox(height: 4),
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
      ],
    );
  }
}

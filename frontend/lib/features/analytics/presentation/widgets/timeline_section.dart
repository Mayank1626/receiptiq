import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../domain/analytics_models.dart';
import 'package:collection/collection.dart';

class TimelineSection extends StatelessWidget {
  final List<DailyTimeline> timeline;

  const TimelineSection({super.key, required this.timeline});

  @override
  Widget build(BuildContext context) {
    if (timeline.isEmpty) return const SizedBox.shrink();

    final currency = NumberFormat.simpleCurrency(name: 'INR');
    final maxSpend = timeline.map((e) => e.totalSpend).max;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Daily Timeline', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.withValues(alpha: 0.2))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 200,
              child: LineChart(
                LineChartData(
                  gridData: const FlGridData(show: false),
                  titlesData: const FlTitlesData(show: false),
                  borderData: FlBorderData(show: false),
                  minX: 0,
                  maxX: (timeline.length - 1).toDouble(),
                  minY: 0,
                  maxY: maxSpend * 1.2,
                  lineBarsData: [
                    LineChartBarData(
                      spots: timeline.asMap().entries.map((e) => FlSpot(e.key.toDouble(), e.value.totalSpend)).toList(),
                      isCurved: true,
                      color: Theme.of(context).colorScheme.primary,
                      barWidth: 4,
                      isStrokeCapRound: true,
                      dotData: const FlDotData(show: false),
                      belowBarData: BarAreaData(
                        show: true,
                        color: Theme.of(context).colorScheme.primary.withValues(alpha: 0.1),
                      ),
                    ),
                  ],
                  lineTouchData: LineTouchData(
                    touchTooltipData: LineTouchTooltipData(
                      getTooltipColor: (_) => Colors.blueGrey,
                      getTooltipItems: (touchedSpots) {
                        return touchedSpots.map((spot) {
                          final date = timeline[spot.x.toInt()].date;
                          final dateStr = DateFormat('MMM d').format(date);
                          return LineTooltipItem(
                            '$dateStr\n${currency.format(spot.y)}',
                            const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                          );
                        }).toList();
                      },
                    ),
                  ),
                ),
                swapAnimationDuration: const Duration(milliseconds: 1200),
                swapAnimationCurve: Curves.easeOutCubic,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../domain/analytics_models.dart';
import 'package:collection/collection.dart';

class MonthlyChartSection extends StatefulWidget {
  final List<MonthlySpend> monthly;

  const MonthlyChartSection({super.key, required this.monthly});

  @override
  State<MonthlyChartSection> createState() => _MonthlyChartSectionState();
}

class _MonthlyChartSectionState extends State<MonthlyChartSection> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.monthly.isEmpty) return const SizedBox.shrink();

    final currency = NumberFormat.simpleCurrency(name: 'INR');
    final maxSpend = widget.monthly.map((e) => e.totalSpend).max;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Monthly Spend', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.withValues(alpha: 0.2))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: SizedBox(
              height: 200,
              child: BarChart(
                BarChartData(
                  alignment: BarChartAlignment.spaceAround,
                  maxY: maxSpend * 1.2,
                  barTouchData: BarTouchData(
                    touchTooltipData: BarTouchTooltipData(
                      getTooltipColor: (_) => Colors.blueGrey,
                      getTooltipItem: (group, groupIndex, rod, rodIndex) {
                        return BarTooltipItem(
                          '${widget.monthly[groupIndex].month}\n${currency.format(rod.toY)}',
                          const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                        );
                      },
                    ),
                    touchCallback: (FlTouchEvent event, barTouchResponse) {
                      setState(() {
                        if (!event.isInterestedForInteractions || barTouchResponse == null || barTouchResponse.spot == null) {
                          touchedIndex = -1;
                          return;
                        }
                        touchedIndex = barTouchResponse.spot!.touchedBarGroupIndex;
                      });
                    },
                  ),
                  titlesData: FlTitlesData(
                    show: true,
                    bottomTitles: AxisTitles(
                      sideTitles: SideTitles(
                        showTitles: true,
                        getTitlesWidget: (double value, TitleMeta meta) {
                          final style = TextStyle(color: Colors.grey[600], fontWeight: FontWeight.bold, fontSize: 12);
                          String text = '';
                          if (value.toInt() >= 0 && value.toInt() < widget.monthly.length) {
                            final parts = widget.monthly[value.toInt()].month.split('-');
                            if (parts.length > 1) {
                              text = '${_getMonthName(int.parse(parts[1]))}\n${parts[0]}';
                            }
                          }
                          return SideTitleWidget(
                            meta: meta,
                            child: Text(text, style: style, textAlign: TextAlign.center),
                          );
                        },
                        reservedSize: 42,
                      ),
                    ),
                    leftTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    topTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles: const AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                  gridData: const FlGridData(show: false),
                  borderData: FlBorderData(show: false),
                  barGroups: List.generate(
                    widget.monthly.length,
                    (i) {
                      final isTouched = i == touchedIndex;
                      return BarChartGroupData(
                        x: i,
                        barRods: [
                          BarChartRodData(
                            toY: widget.monthly[i].totalSpend,
                            color: isTouched ? Theme.of(context).colorScheme.primary : Theme.of(context).colorScheme.primary.withValues(alpha: 0.5),
                            width: 22,
                            borderRadius: BorderRadius.circular(4),
                            backDrawRodData: BackgroundBarChartRodData(
                              show: true,
                              toY: maxSpend * 1.2,
                              color: Colors.grey.withValues(alpha: 0.1),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
                swapAnimationDuration: const Duration(milliseconds: 800),
                swapAnimationCurve: Curves.easeOutCubic,
              ),
            ),
          ),
        ),
      ],
    );
  }

  String _getMonthName(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun', 'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }
}

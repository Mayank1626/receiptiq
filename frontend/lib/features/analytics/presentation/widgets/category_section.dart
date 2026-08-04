import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';
import '../../domain/analytics_models.dart';

class CategorySection extends StatefulWidget {
  final List<CategoryAnalytics> categories;

  const CategorySection({super.key, required this.categories});

  @override
  State<CategorySection> createState() => _CategorySectionState();
}

class _CategorySectionState extends State<CategorySection> {
  int? touchedIndex;

  @override
  Widget build(BuildContext context) {
    if (widget.categories.isEmpty) return const SizedBox.shrink();

    final currency = NumberFormat.simpleCurrency(name: 'INR');
    
    // Sort by spend
    final sorted = List<CategoryAnalytics>.from(widget.categories)..sort((a, b) => b.totalSpend.compareTo(a.totalSpend));
    final totalSum = sorted.fold(0.0, (sum, e) => sum + e.totalSpend);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Categories', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16), side: BorderSide(color: Colors.grey.withValues(alpha: 0.2))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Expanded(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: PieChart(
                      PieChartData(
                        pieTouchData: PieTouchData(
                          touchCallback: (FlTouchEvent event, pieTouchResponse) {
                            setState(() {
                              if (!event.isInterestedForInteractions || pieTouchResponse == null || pieTouchResponse.touchedSection == null) {
                                touchedIndex = -1;
                                return;
                              }
                              touchedIndex = pieTouchResponse.touchedSection!.touchedSectionIndex;
                            });
                          },
                        ),
                        borderData: FlBorderData(show: false),
                        sectionsSpace: 2,
                        centerSpaceRadius: 40,
                        sections: List.generate(sorted.length, (i) {
                          final isTouched = i == touchedIndex;
                          final fontSize = isTouched ? 16.0 : 0.0;
                          final radius = isTouched ? 60.0 : 50.0;
                          final percent = sorted[i].totalSpend / totalSum * 100;
                          return PieChartSectionData(
                            color: _getCategoryColor(i),
                            value: sorted[i].totalSpend,
                            title: '${percent.toStringAsFixed(0)}%',
                            radius: radius,
                            titleStyle: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: Colors.white),
                          );
                        }),
                      ),
                      swapAnimationDuration: const Duration(milliseconds: 800),
                      swapAnimationCurve: Curves.easeOutBack,
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: sorted.asMap().entries.map((e) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0),
                        child: Row(
                          children: [
                            Text(_getCategoryIcon(e.value.categoryName), style: const TextStyle(fontSize: 16)),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                e.value.categoryName,
                                style: TextStyle(
                                  fontWeight: e.key == touchedIndex ? FontWeight.bold : FontWeight.normal,
                                  fontSize: 14,
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      );
                    }).toList(),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  Color _getCategoryColor(int index) {
    final colors = [
      Colors.blue,
      Colors.green,
      Colors.orange,
      Colors.red,
      Colors.purple,
      Colors.teal,
      Colors.amber,
      Colors.indigo,
    ];
    return colors[index % colors.length];
  }

  String _getCategoryIcon(String category) {
    final lower = category.toLowerCase();
    if (lower.contains('grocer')) return '🍎';
    if (lower.contains('din') || lower.contains('food') || lower.contains('restaurant')) return '🍔';
    if (lower.contains('fuel') || lower.contains('gas')) return '⛽';
    if (lower.contains('med') || lower.contains('health')) return '💊';
    if (lower.contains('entert') || lower.contains('game')) return '🎮';
    if (lower.contains('elect') || lower.contains('tech')) return '💻';
    if (lower.contains('trans') || lower.contains('travel') || lower.contains('cab')) return '🚗';
    if (lower.contains('shop') || lower.contains('cloth')) return '🛍️';
    return '🛒';
  }
}

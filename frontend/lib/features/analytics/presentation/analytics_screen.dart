import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:receiptiq_mobile/core/widgets/api_state_widget.dart';
import '../../domain/analytics_models.dart';
import '../../application/analytics_controller.dart';
import 'widgets/overview_section.dart';
import 'widgets/monthly_chart_section.dart';
import 'widgets/timeline_section.dart';
import 'widgets/category_section.dart';
import 'widgets/stores_section.dart';
import 'widgets/products_section.dart';
import 'package:receiptiq_mobile/features/households/presentation/widgets/workspace_appbar_title.dart';

class AnalyticsScreen extends ConsumerWidget {
  const AnalyticsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(analyticsControllerProvider);
    final controller = ref.read(analyticsControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const WorkspaceAppBarTitle(fallbackTitle: 'Analytics'),
        actions: [
          IconButton(
            icon: const Icon(Icons.file_download),
            onPressed: () => context.push('/export'),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: controller.refresh,
        child: Column(
          children: [
            _buildFilters(context, state.selectedRange, controller),
            Expanded(
              child: ApiStateWidget<AnalyticsDashboardData>(
                state: state.data,
                onRetry: controller.refresh,
                successBuilder: (data) {
                  if (data.metrics.totalReceipts == 0) {
                    return _buildEmptyState(context);
                  }
                  
                  return SingleChildScrollView(
                    physics: const AlwaysScrollableScrollPhysics(),
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        OverviewSection(metrics: data.metrics),
                        const SizedBox(height: 24),
                        MonthlyChartSection(monthly: data.monthly),
                        const SizedBox(height: 24),
                        TimelineSection(timeline: data.timeline),
                        const SizedBox(height: 24),
                        CategorySection(categories: data.categories),
                        const SizedBox(height: 24),
                        StoresSection(stores: data.stores),
                        const SizedBox(height: 24),
                        ProductsSection(products: data.products),
                        const SizedBox(height: 40),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilters(BuildContext context, DateRange selected, AnalyticsController controller) {
    final labels = ['This Month', 'Last 3 Months', 'Last 6 Months', 'This Year'];
    
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: labels.map((label) {
          final isSelected = selected.label == label;
          return Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: FilterChip(
              label: Text(label),
              selected: isSelected,
              onSelected: (val) {
                if (val) controller.changeDateRange(DateRange.fromLabel(label));
              },
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    return ListView(
      physics: const AlwaysScrollableScrollPhysics(),
      children: [
        SizedBox(height: MediaQuery.of(context).size.height * 0.2),
        const Text(
          '📈',
          style: TextStyle(fontSize: 64),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 16),
        Text(
          'No analytics yet',
          style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 8),
        Text(
          'Upload your first receipt\nto start seeing insights.',
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.grey[600]),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 24),
        Center(
          child: FilledButton.icon(
            onPressed: () => context.go('/upload'),
            icon: const Icon(Icons.upload_file),
            label: const Text('Upload Receipt'),
          ),
        ),
      ],
    );
  }
}

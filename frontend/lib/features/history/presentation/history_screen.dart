import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:receiptiq_mobile/features/receipts/domain/receipt_model.dart';
import 'package:receiptiq_mobile/core/widgets/empty_state.dart';
import '../../domain/history_models.dart';
import '../../application/history_controller.dart';
import 'widgets/receipt_card.dart';
import 'package:receiptiq_mobile/features/households/presentation/widgets/workspace_appbar_title.dart';

class HistoryScreen extends ConsumerWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(historyControllerProvider);
    final controller = ref.read(historyControllerProvider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const WorkspaceAppBarTitle(fallbackTitle: 'Receipt History'),
      ),
      body: Column(
        children: [
          _buildStickyHeader(context, state, controller),
          const Divider(height: 1),
          Expanded(
            child: _buildBody(context, state, controller),
          ),
        ],
      ),
    );
  }

  Widget _buildStickyHeader(BuildContext context, HistoryState state, HistoryController controller) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: SearchBar(
              hintText: 'Search store or receipt ID',
              leading: const Icon(Icons.search),
              elevation: const WidgetStatePropertyAll(0),
              backgroundColor: WidgetStatePropertyAll(Theme.of(context).colorScheme.surfaceContainerHighest),
              padding: const WidgetStatePropertyAll(EdgeInsets.symmetric(horizontal: 16.0)),
              onChanged: (val) {
                controller.updateFilter(state.filter.copyWith(searchQuery: val));
              },
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
            child: Row(
              children: [
                _buildFilterChip('All', null, state, controller),
                const SizedBox(width: 8),
                _buildFilterChip('Confirmed', ReceiptStatus.confirmed, state, controller),
                const SizedBox(width: 8),
                _buildFilterChip('Review', ReceiptStatus.review_required, state, controller),
                const SizedBox(width: 8),
                _buildFilterChip('Draft', ReceiptStatus.draft, state, controller),
              ],
            ),
          ),
          const SizedBox(height: 4),
        ],
      ),
    );
  }

  Widget _buildFilterChip(String label, ReceiptStatus? status, HistoryState state, HistoryController controller) {
    final isSelected = state.filter.status == status;
    return FilterChip(
      label: Text(label),
      selected: isSelected,
      onSelected: (val) {
        if (val) {
          controller.updateFilter(state.filter.copyWith(status: status));
        }
      },
    );
  }

  Widget _buildBody(BuildContext context, HistoryState state, HistoryController controller) {
    if (state.error != null && state.items.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Failed to load receipts', style: Theme.of(context).textTheme.titleLarge),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: controller.refresh,
              child: const Text('Retry'),
            ),
          ],
        ),
      );
    }

    if (state.isFirstLoad) {
      return ListView.builder(
        itemCount: 5,
        padding: const EdgeInsets.only(top: 8.0),
        itemBuilder: (context, index) => _buildShimmerCard(context),
      );
    }

    if (state.items.isEmpty) {
      return EmptyState(
        icon: Icons.receipt_long,
        title: 'No receipts found',
        message: 'Upload your first receipt or adjust your filters.',
        buttonLabel: 'Upload Receipt',
        onButtonPressed: () => context.push('/upload'),
      );
    }

    return RefreshIndicator(
      onRefresh: controller.refresh,
      child: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          if (!state.isLoadingMore && !state.hasReachedEnd && scrollInfo.metrics.pixels >= scrollInfo.metrics.maxScrollExtent - 200) {
            controller.loadNextPage();
          }
          return false;
        },
        child: ListView.builder(
          key: const PageStorageKey('history_list'), // Preserves scroll position!
          padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
          itemCount: state.items.length + (state.isLoadingMore ? 3 : 0),
          itemBuilder: (context, index) {
            if (index >= state.items.length) {
              return _buildShimmerCard(context);
            }
            final receipt = state.items[index];
            return ReceiptCard(
              receipt: receipt,
              onTap: () => context.push('/review/${receipt.id}'),
            );
          },
        ),
      ),
    );
  }

  Widget _buildShimmerCard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0, left: 16.0, right: 16.0),
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
        side: BorderSide(color: Colors.grey.withValues(alpha: 0.2)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            Container(width: 48, height: 48, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(12))),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(width: double.infinity, height: 16, color: Colors.grey[300]),
                  const SizedBox(height: 8),
                  Container(width: 100, height: 12, color: Colors.grey[300]),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

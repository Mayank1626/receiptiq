import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/widgets/api_state_widget.dart';
import '../../../../core/widgets/empty_state.dart';
import '../../../auth/application/auth_controller.dart';
import '../application/dashboard_controller.dart';
import '../domain/dashboard_data.dart';
import '../../receipts/domain/receipt_model.dart';
import 'widgets/receipt_status_chip.dart';
import 'widgets/animated_number.dart';
import 'widgets/fade_slide_wrapper.dart';
import 'widgets/dashboard_processing_card.dart';
import 'package:receiptiq_mobile/core/background/notification_controller.dart';

class DashboardScreen extends ConsumerWidget {
  const DashboardScreen({super.key});

  String _getGreeting() {
    final hour = DateTime.now().hour;
    if (hour < 12) return 'Good Morning';
    if (hour < 17) return 'Good Afternoon';
    if (hour < 21) return 'Good Evening';
    return 'Good Night';
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final dashboardState = ref.watch(dashboardControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const WorkspaceAppBarTitle(fallbackTitle: 'ReceiptIQ'),
        actions: [
          if (ref.watch(householdControllerProvider).activeWorkspace.type == WorkspaceType.household)
            IconButton(
              icon: const Icon(Icons.account_balance_wallet),
              onPressed: () => context.push('/households/balances'),
            ),
          IconButton(
            icon: const Icon(Icons.group),
            onPressed: () => context.push('/households'),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              IconButton(
                icon: const Icon(Icons.notifications),
                onPressed: () => context.push('/notifications'),
              ),
              if (ref.watch(notificationControllerProvider.notifier).unreadCount > 0)
                Positioned(
                  right: 8,
                  top: 8,
                  child: Container(
                    padding: const EdgeInsets.all(4),
                    decoration: const BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      '${ref.watch(notificationControllerProvider.notifier).unreadCount}',
                      style: const TextStyle(color: Colors.white, fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
            ],
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () => context.push('/settings/notifications'),
          ),
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => ref.read(authControllerProvider.notifier).logout(),
          )
        ],
      ),
      body: ApiStateWidget<DashboardData>(
        state: dashboardState,
        onRefresh: () => ref.read(dashboardControllerProvider.notifier).fetchData(),
        onRetry: () => ref.read(dashboardControllerProvider.notifier).fetchData(),
        isEmpty: (data) => data.recentReceipts.isEmpty && data.pendingReviews.isEmpty && data.metrics.totalReceipts == 0,
        emptyBuilder: () => EmptyState(
          icon: Icons.camera_alt_outlined,
          title: 'No receipts yet',
          message: 'Upload your first receipt to get started.',
          buttonLabel: 'Upload',
          onButtonPressed: () => context.push('/upload'),
        ),
        successBuilder: (data) => _buildDashboard(context, data),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => context.push('/upload'),
        icon: const Icon(Icons.add_a_photo),
        label: const Text('Add Receipt'),
      ),
    );
  }

  Widget _buildDashboard(BuildContext context, DashboardData data) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        const DashboardProcessingCard(),
        _buildSummaryCards(context, data),
        const SizedBox(height: 16),
        FilledButton.tonalIcon(
          onPressed: () => context.push('/analytics'),
          icon: const Icon(Icons.analytics),
          label: const Text('View Full Analytics'),
        ),
        const SizedBox(height: 24),
        if (data.pendingReviews.isNotEmpty) ...[
          FadeSlideWrapper(
            delay: const Duration(milliseconds: 100),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Pending Reviews', style: Theme.of(context).textTheme.titleMedium),
                const SizedBox(height: 8),
                ...data.pendingReviews.map((r) => _buildReceiptTile(context, r, isPending: true)),
                const SizedBox(height: 24),
              ],
            ),
          ),
        ],
        FadeSlideWrapper(
          delay: const Duration(milliseconds: 200),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recent Receipts', style: Theme.of(context).textTheme.titleMedium),
                  TextButton(
                    onPressed: () => context.push('/history'),
                    child: const Text('View All'),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              if (data.recentReceipts.isEmpty)
                const Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Text('No recent receipts found.'),
                )
              else
                ...data.recentReceipts.map((r) => _buildReceiptTile(context, r)),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSummaryCards(BuildContext context, DashboardData data) {
    final currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
    final numberFormat = NumberFormat.decimalPattern();
    
    return Row(
      children: [
        Expanded(
          child: FadeSlideWrapper(
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Total Spend', style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 8),
                    AnimatedNumber(
                      value: data.metrics.totalSpend,
                      formatter: (val) => currencyFormat.format(val),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).colorScheme.primary,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 16),
        Expanded(
          child: FadeSlideWrapper(
            delay: const Duration(milliseconds: 50),
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Receipts', style: Theme.of(context).textTheme.labelLarge),
                    const SizedBox(height: 8),
                    AnimatedNumber(
                      value: data.metrics.totalReceipts.toDouble(),
                      formatter: (val) => numberFormat.format(val.toInt()),
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReceiptTile(BuildContext context, ReceiptModel receipt, {bool isPending = false}) {
    final currencyFormat = NumberFormat.currency(symbol: '₹', decimalDigits: 2);
    return Card(
      margin: const EdgeInsets.only(bottom: 8.0),
      color: isPending ? Theme.of(context).colorScheme.errorContainer.withOpacity(0.3) : null,
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Theme.of(context).colorScheme.primaryContainer,
          child: const Icon(Icons.receipt),
        ),
        title: Row(
          children: [
            Expanded(child: Text(receipt.storeName ?? 'Unknown Store', overflow: TextOverflow.ellipsis)),
            const SizedBox(width: 8),
            ReceiptStatusChip(status: receipt.status),
          ],
        ),
        subtitle: Text(
          receipt.date != null ? DateFormat.yMMMd().format(receipt.date!) : 'Unknown Date',
        ),
        trailing: Text(
          currencyFormat.format(receipt.totalAmount ?? 0),
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
              ),
        ),
        onTap: () {
          // Navigate to receipt details
        },
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:receiptiq_mobile/core/background/background_models.dart';
import 'package:receiptiq_mobile/core/background/notification_controller.dart';
import 'package:go_router/go_router.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifications = ref.watch(notificationControllerProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notifications'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done_all),
            tooltip: 'Mark all as read',
            onPressed: () => ref.read(notificationControllerProvider.notifier).markAllAsRead(),
          ),
          IconButton(
            icon: const Icon(Icons.settings),
            tooltip: 'Settings',
            onPressed: () => context.push('/settings/notifications'),
          ),
        ],
      ),
      body: notifications.isEmpty
          ? const Center(child: Text('No notifications'))
          : _buildNotificationList(context, ref, notifications),
    );
  }

  Widget _buildNotificationList(BuildContext context, WidgetRef ref, List<AppNotification> notifications) {
    // Grouping
    final today = <AppNotification>[];
    final yesterday = <AppNotification>[];
    final earlier = <AppNotification>[];

    final now = DateTime.now();
    for (final n in notifications) {
      if (n.timestamp.year == now.year && n.timestamp.month == now.month && n.timestamp.day == now.day) {
        today.add(n);
      } else if (n.timestamp.year == now.year && n.timestamp.month == now.month && n.timestamp.day == now.day - 1) {
        yesterday.add(n);
      } else {
        earlier.add(n);
      }
    }

    return ListView(
      children: [
        if (today.isNotEmpty) ...[
          _buildHeader('Today'),
          ...today.map((n) => _buildNotificationTile(context, ref, n)),
        ],
        if (yesterday.isNotEmpty) ...[
          _buildHeader('Yesterday'),
          ...yesterday.map((n) => _buildNotificationTile(context, ref, n)),
        ],
        if (earlier.isNotEmpty) ...[
          _buildHeader('Earlier'),
          ...earlier.map((n) => _buildNotificationTile(context, ref, n)),
        ],
      ],
    );
  }

  Widget _buildHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
      ),
    );
  }

  Widget _buildNotificationTile(BuildContext context, WidgetRef ref, AppNotification notification) {
    IconData icon;
    Color iconColor;

    switch (notification.type) {
      case NotificationType.receipt:
        icon = Icons.receipt;
        iconColor = Colors.blue;
        break;
      case NotificationType.household:
        icon = Icons.group;
        iconColor = Colors.purple;
        break;
      case NotificationType.settlement:
        icon = Icons.monetization_on;
        iconColor = Colors.green;
        break;
      case NotificationType.processing:
        icon = Icons.sync;
        iconColor = Colors.orange;
        break;
      case NotificationType.system:
      default:
        icon = Icons.info;
        iconColor = Colors.grey;
    }

    return Dismissible(
      key: Key(notification.id),
      onDismissed: (_) {
        ref.read(notificationControllerProvider.notifier).deleteNotification(notification.id);
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: iconColor.withOpacity(0.2),
          child: Icon(icon, color: iconColor),
        ),
        title: Text(
          notification.title,
          style: TextStyle(fontWeight: notification.isRead ? FontWeight.normal : FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(notification.body),
            const SizedBox(height: 4),
            Text(
              _formatTime(notification.timestamp),
              style: const TextStyle(fontSize: 12, color: Colors.grey),
            ),
          ],
        ),
        trailing: notification.isRead
            ? null
            : const CircleAvatar(radius: 4, backgroundColor: Colors.blue),
        onTap: () {
          ref.read(notificationControllerProvider.notifier).markAsRead(notification.id);
          _handleNotificationTap(context, notification);
        },
      ),
    );
  }

  String _formatTime(DateTime time) {
    final now = DateTime.now();
    final difference = now.difference(time);
    
    if (difference.inMinutes < 60) {
      return '${difference.inMinutes} min ago';
    } else if (difference.inHours < 24) {
      return '${difference.inHours} hours ago';
    } else {
      return DateFormat.yMMMd().format(time);
    }
  }

  void _handleNotificationTap(BuildContext context, AppNotification notification) {
    if (notification.payload != null) {
      final type = notification.payload!['type'];
      if (type == 'receipt_ready') {
        final receiptId = notification.payload!['receiptId'];
        context.push('/receipts/$receiptId');
      } else if (type == 'settlement_reminder') {
        context.push('/households/balances');
      } else if (type == 'household_invite') {
        context.push('/households');
      } else if (type == 'processing_failed') {
        // Route to dashboard to see the failed job card
        context.push('/');
      }
    }
  }
}

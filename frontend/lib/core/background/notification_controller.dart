import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:receiptiq_mobile/core/background/background_models.dart';

final notificationControllerProvider = NotifierProvider<NotificationController, List<AppNotification>>(() {
  return NotificationController();
});

class NotificationController extends Notifier<List<AppNotification>> {
  @override
  List<AppNotification> build() {
    // In a full implementation, we load from Hive
    return [
      AppNotification(
        id: '1',
        type: NotificationType.receipt,
        title: 'Receipt Ready',
        body: 'Amazon receipt processed successfully.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 2)),
        isRead: false,
        payload: {'type': 'receipt_ready', 'receiptId': 'amazon-123'},
      ),
      AppNotification(
        id: '2',
        type: NotificationType.settlement,
        title: 'Settlement Reminder',
        body: 'Pay Sasank ₹350.',
        timestamp: DateTime.now().subtract(const Duration(minutes: 15)),
        isRead: false,
      ),
      AppNotification(
        id: '3',
        type: NotificationType.household,
        title: 'Household Invite',
        body: 'You have been invited to Flatmates.',
        timestamp: DateTime.now().subtract(const Duration(days: 1, hours: 2)),
        isRead: true,
      ),
    ];
  }

  int get unreadCount => state.where((n) => !n.isRead).length;

  void markAsRead(String id) {
    state = state.map((n) {
      if (n.id == id) {
        return n.copyWith(isRead: true);
      }
      return n;
    }).toList();
  }

  void markAllAsRead() {
    state = state.map((n) => n.copyWith(isRead: true)).toList();
  }

  void addNotification(AppNotification notification) {
    state = [notification, ...state];
  }

  void deleteNotification(String id) {
    state = state.where((n) => n.id != id).toList();
  }
}

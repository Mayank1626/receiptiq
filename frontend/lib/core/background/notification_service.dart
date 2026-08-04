import 'dart:convert';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class NotificationProvider {
  Future<void> initialize(void Function(Map<String, dynamic>? payload) onPayloadReceived);
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
    List<AndroidNotificationAction>? actions,
  });
}

class LocalNotificationProvider implements NotificationProvider {
  final FlutterLocalNotificationsPlugin _plugin = FlutterLocalNotificationsPlugin();
  void Function(Map<String, dynamic>? payload)? _onPayloadReceived;

  @override
  Future<void> initialize(void Function(Map<String, dynamic>? payload) onPayloadReceived) async {
    _onPayloadReceived = onPayloadReceived;
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const darwinInit = DarwinInitializationSettings();
    const initSettings = InitializationSettings(android: androidInit, iOS: darwinInit);

    await _plugin.initialize(
      initSettings,
      onDidReceiveNotificationResponse: (response) {
        if (response.payload != null) {
          final payloadData = jsonDecode(response.payload!) as Map<String, dynamic>;
          _onPayloadReceived?.call(payloadData);
        }
      },
    );
  }

  @override
  Future<void> showNotification({
    required int id,
    required String title,
    required String body,
    Map<String, dynamic>? payload,
    List<AndroidNotificationAction>? actions,
  }) async {
    final androidDetails = AndroidNotificationDetails(
      'receiptiq_channel',
      'ReceiptIQ Notifications',
      importance: Importance.max,
      priority: Priority.high,
      actions: actions,
    );
    const darwinDetails = DarwinNotificationDetails();
    final details = NotificationDetails(android: androidDetails, iOS: darwinDetails);

    await _plugin.show(
      id,
      title,
      body,
      details,
      payload: payload != null ? jsonEncode(payload) : null,
    );
  }
}

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService(LocalNotificationProvider());
});

class NotificationService {
  final NotificationProvider _provider;

  NotificationService(this._provider);

  Future<void> initialize(void Function(Map<String, dynamic>? payload) onPayloadReceived) async {
    await _provider.initialize(onPayloadReceived);
  }

  Future<void> showReceiptReady(String storeName, String receiptId) async {
    await _provider.showNotification(
      id: receiptId.hashCode,
      title: 'Receipt Ready',
      body: '$storeName receipt processed successfully. Tap to review.',
      payload: {
        'type': 'receipt_ready',
        'receiptId': receiptId,
      },
    );
  }

  Future<void> showOCRCompleted() async {
    await _provider.showNotification(
      id: 'ocr'.hashCode,
      title: 'OCR Complete',
      body: 'AI extraction has started.',
    );
  }

  Future<void> showSettlementReminder(String payeeName, double amount) async {
    await _provider.showNotification(
      id: 'settlement'.hashCode,
      title: 'Settlement Reminder',
      body: 'You owe $payeeName ₹${amount.toStringAsFixed(2)}.',
      payload: {
        'type': 'settlement_reminder',
      },
    );
  }

  Future<void> showHouseholdInvite(String householdName) async {
    await _provider.showNotification(
      id: 'invite'.hashCode,
      title: 'Household Invite',
      body: 'You have been invited to $householdName.',
      payload: {
        'type': 'household_invite',
      },
    );
  }
  
  Future<void> showFailure(String stage, String jobId) async {
    await _provider.showNotification(
      id: 'failure_$jobId'.hashCode,
      title: 'Processing Failed',
      body: 'Receipt couldn\'t be processed.',
      payload: {
        'type': 'processing_failed',
        'jobId': jobId,
      },
      actions: const [
        AndroidNotificationAction('retry_action', 'Retry'),
        AndroidNotificationAction('view_action', 'View'),
      ],
    );
  }
}

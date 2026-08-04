import 'package:flutter/material.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key});

  @override
  State<NotificationSettingsScreen> createState() => _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState extends State<NotificationSettingsScreen> {
  // In a real app, these would be backed by SharedPreferences/Hive
  bool receiptReady = true;
  bool ocrComplete = false;
  bool settlementReminder = true;
  bool householdInvite = true;
  bool sounds = true;
  bool vibrations = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Notification Settings'),
      ),
      body: ListView(
        children: [
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Events',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          SwitchListTile(
            title: const Text('Receipt Ready'),
            subtitle: const Text('When processing is fully complete'),
            value: receiptReady,
            onChanged: (val) => setState(() => receiptReady = val),
          ),
          SwitchListTile(
            title: const Text('OCR Complete'),
            subtitle: const Text('When text extraction finishes'),
            value: ocrComplete,
            onChanged: (val) => setState(() => ocrComplete = val),
          ),
          SwitchListTile(
            title: const Text('Settlement Reminder'),
            subtitle: const Text('When someone requests payment'),
            value: settlementReminder,
            onChanged: (val) => setState(() => settlementReminder = val),
          ),
          SwitchListTile(
            title: const Text('Household Invite'),
            subtitle: const Text('When invited to a new workspace'),
            value: householdInvite,
            onChanged: (val) => setState(() => householdInvite = val),
          ),
          const Divider(),
          const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text(
              'Alerts',
              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.grey),
            ),
          ),
          SwitchListTile(
            title: const Text('Sounds'),
            value: sounds,
            onChanged: (val) => setState(() => sounds = val),
          ),
          SwitchListTile(
            title: const Text('Vibration'),
            value: vibrations,
            onChanged: (val) => setState(() => vibrations = val),
          ),
        ],
      ),
    );
  }
}

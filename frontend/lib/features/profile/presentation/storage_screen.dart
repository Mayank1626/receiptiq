import 'package:flutter/material.dart';

class StorageScreen extends StatelessWidget {
  const StorageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Storage')),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          const ListTile(
            title: Text('Images'),
            trailing: Text('24 MB', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const ListTile(
            title: Text('Notifications'),
            trailing: Text('3 MB', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const ListTile(
            title: Text('Settings'),
            trailing: Text('250 KB', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const ListTile(
            title: Text('Queue'),
            trailing: Text('1.2 MB', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
          const Divider(height: 32),
          const ListTile(
            title: Text('Total Cached Data', style: TextStyle(fontWeight: FontWeight.bold)),
            trailing: Text('28.45 MB', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
          ),
          const SizedBox(height: 24),
          FilledButton.icon(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Cache cleared successfully.')));
            },
            icon: const Icon(Icons.delete_outline),
            label: const Text('Clear Cache'),
            style: FilledButton.styleFrom(
              backgroundColor: Colors.red,
              foregroundColor: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}

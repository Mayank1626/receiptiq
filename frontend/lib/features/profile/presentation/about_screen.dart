import 'package:flutter/material.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  PackageInfo? _packageInfo;

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: _packageInfo == null
          ? const Center(child: CircularProgressIndicator())
          : ListView(
              padding: const EdgeInsets.all(16.0),
              children: [
                const Center(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 24.0),
                    child: Text('ReceiptIQ', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                  ),
                ),
                ListTile(
                  title: const Text('Version'),
                  trailing: Text('${_packageInfo!.version} (Build ${_packageInfo!.buildNumber})'),
                ),
                const ListTile(
                  title: Text('Backend Version'),
                  trailing: Text('2.4.0 (Stable)'),
                ),
                const ListTile(
                  title: Text('Flutter Version'),
                  trailing: Text('3.x.x'),
                ),
                const ListTile(
                  title: Text('Database'),
                  trailing: Text('Hive / Secure Storage'),
                ),
                const Divider(height: 32),
                ListTile(
                  title: const Text('Privacy Policy'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () {},
                ),
                ListTile(
                  title: const Text('Licenses'),
                  trailing: const Icon(Icons.open_in_new),
                  onTap: () {},
                ),
              ],
            ),
    );
  }
}

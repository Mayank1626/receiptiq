import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../application/preferences_controller.dart';
import '../domain/profile_models.dart';
import '../../auth/application/auth_controller.dart';

class ProfileScreen extends ConsumerWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authState = ref.watch(authControllerProvider);
    
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
      ),
      body: authState.maybeWhen(
        authenticated: (user) => ListView(
          padding: const EdgeInsets.symmetric(vertical: 16),
          children: [
            _buildAccountSection(context, user),
            const Divider(height: 32),
            _buildAppearanceSection(context, ref),
            const Divider(height: 32),
            _buildWorkspaceSection(context, ref),
            const Divider(height: 32),
            _buildLandingPageSection(context, ref),
            const Divider(height: 32),
            _buildNotificationsSection(context),
            const Divider(height: 32),
            _buildPrivacySection(context, ref),
            const Divider(height: 32),
            _buildStorageSection(context),
            const Divider(height: 32),
            _buildAboutSection(context),
            const Divider(height: 32),
            _buildLogoutSection(context, ref),
          ],
        ),
        orElse: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }

  Widget _buildSectionHeader(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, size: 20, color: Theme.of(context).colorScheme.primary),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccountSection(BuildContext context, dynamic user) {
    // Generate initials for avatar
    final initials = user.fullName.isNotEmpty
        ? user.fullName.trim().split(RegExp(r'\s+')).take(2).map((s) => s[0].toUpperCase()).join('')
        : '?';

    // Deterministic color
    final colors = [Colors.blue, Colors.green, Colors.purple, Colors.orange, Colors.teal, Colors.pink];
    final color = colors[user.id.hashCode % colors.length];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Account', Icons.person),
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: color,
            foregroundColor: Colors.white,
            child: Text(initials, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          ),
          title: Text(user.fullName, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(user.email),
              const SizedBox(height: 4),
              Text('Member since ${DateFormat.yMMMd().format(user.createdAt)}', style: const TextStyle(fontSize: 12)),
            ],
          ),
        ),
        // TODO(backend): Show Edit Profile when PATCH /auth/me is available.
        // TODO(backend): Show Change Password when endpoint is implemented.
        // TODO(backend): Show Delete Account when endpoint is implemented.
      ],
    );
  }

  Widget _buildAppearanceSection(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Appearance', Icons.color_lens),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildThemeCard(context, ref, 'System', Icons.settings_system_daydream, ThemeModeType.system, preferences.themeMode),
              _buildThemeCard(context, ref, 'Light', Icons.wb_sunny, ThemeModeType.light, preferences.themeMode),
              _buildThemeCard(context, ref, 'Dark', Icons.nights_stay, ThemeModeType.dark, preferences.themeMode),
            ],
          ),
        ),
        ListTile(
          title: const Text('Currency'),
          subtitle: Text('Preview: ${preferences.currency.symbol}12,345.67'),
          trailing: DropdownButton<Currency>(
            value: preferences.currency,
            underline: const SizedBox(),
            items: Currency.values.map((c) {
              return DropdownMenuItem(value: c, child: Text('${c.symbol} ${c.name}'));
            }).toList(),
            onChanged: (val) {
              if (val != null) ref.read(preferencesControllerProvider.notifier).updateCurrency(val);
            },
          ),
        ),
        const ListTile(
          title: Text('Language'),
          trailing: Text('English', style: TextStyle(color: Colors.grey)), // Future: Locale picker
        ),
      ],
    );
  }

  Widget _buildThemeCard(BuildContext context, WidgetRef ref, String label, IconData icon, ThemeModeType mode, ThemeModeType currentMode) {
    final isSelected = mode == currentMode;
    return GestureDetector(
      onTap: () => ref.read(preferencesControllerProvider.notifier).updateTheme(mode),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? Theme.of(context).colorScheme.primaryContainer : Colors.transparent,
          border: Border.all(
            color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade300,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: [
            Icon(icon, color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey),
            const SizedBox(height: 8),
            Text(label, style: TextStyle(
              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              color: isSelected ? Theme.of(context).colorScheme.primary : Colors.grey.shade700,
            )),
          ],
        ),
      ),
    );
  }

  Widget _buildWorkspaceSection(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Workspace', Icons.home),
        ListTile(
          title: const Text('Default Workspace'),
          subtitle: const Text('Starts here on launch'),
          trailing: DropdownButton<String>(
            value: 'personal',
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: 'personal', child: Text('Personal')),
              // Household options would be dynamically populated here
            ],
            onChanged: (val) {
              if (val != null) ref.read(preferencesControllerProvider.notifier).updateDefaultWorkspace(val);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildLandingPageSection(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Startup', Icons.launch),
        ListTile(
          title: const Text('Default Landing Page'),
          subtitle: const Text('App opens directly to this screen'),
          trailing: DropdownButton<LandingPage>(
            value: preferences.defaultLandingPage,
            underline: const SizedBox(),
            items: const [
              DropdownMenuItem(value: LandingPage.dashboard, child: Text('Dashboard')),
              DropdownMenuItem(value: LandingPage.history, child: Text('History')),
              DropdownMenuItem(value: LandingPage.analytics, child: Text('Analytics')),
              DropdownMenuItem(value: LandingPage.wallet, child: Text('Wallet')),
            ],
            onChanged: (val) {
              if (val != null) ref.read(preferencesControllerProvider.notifier).updateLandingPage(val);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildNotificationsSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Notifications', Icons.notifications),
        ListTile(
          title: const Text('Notification Settings'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push('/settings/notifications'),
        ),
      ],
    );
  }

  Widget _buildPrivacySection(BuildContext context, WidgetRef ref) {
    final preferences = ref.watch(preferencesControllerProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Privacy', Icons.lock),
        SwitchListTile(
          title: const Text('Usage Analytics'),
          subtitle: const Text('Help us improve the app'),
          value: preferences.analyticsEnabled,
          onChanged: (val) => ref.read(preferencesControllerProvider.notifier).toggleAnalytics(val),
        ),
        SwitchListTile(
          title: const Text('Biometric Lock'),
          subtitle: const Text('Require FaceID / Fingerprint on open'),
          value: preferences.biometricEnabled,
          onChanged: (val) => ref.read(preferencesControllerProvider.notifier).toggleBiometrics(val),
        ),
      ],
    );
  }

  Widget _buildStorageSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'Storage', Icons.storage),
        ListTile(
          title: const Text('Manage Storage'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push('/profile/storage'),
        ),
      ],
    );
  }

  Widget _buildAboutSection(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionHeader(context, 'About', Icons.info),
        ListTile(
          title: const Text('About ReceiptIQ'),
          trailing: const Icon(Icons.chevron_right),
          onTap: () => context.push('/profile/about'),
        ),
      ],
    );
  }

  Widget _buildLogoutSection(BuildContext context, WidgetRef ref) {
    return ListTile(
      leading: const Icon(Icons.logout, color: Colors.red),
      title: const Text('Logout', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)),
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text('Logout'),
            content: const Text('Are you sure you want to log out? All your offline data and cache will be cleared from this device.'),
            actions: [
              TextButton(onPressed: () => context.pop(), child: const Text('Cancel')),
              FilledButton(
                onPressed: () {
                  context.pop();
                  ref.read(preferencesControllerProvider.notifier).performFullLogout();
                },
                child: const Text('Logout'),
              ),
            ],
          ),
        );
      },
    );
  }
}

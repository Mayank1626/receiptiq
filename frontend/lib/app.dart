import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/app_config.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/profile/application/preferences_controller.dart';
import 'features/profile/domain/profile_models.dart';

class ReceiptIQApp extends ConsumerWidget {
  const ReceiptIQApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);
    final preferences = ref.watch(preferencesControllerProvider);

    return MaterialApp.router(
      title: 'ReceiptIQ',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme, // To be added later
      themeMode: preferences.themeMode.toThemeMode,
      routerConfig: router,
      debugShowCheckedModeBanner: AppConfig.instance.environment == Environment.dev,
    );
  }
}

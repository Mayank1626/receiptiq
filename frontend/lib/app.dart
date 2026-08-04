import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'core/config/app_config.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';

class ReceiptIQApp extends ConsumerWidget {
  const ReceiptIQApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final router = ref.watch(routerProvider);

    return MaterialApp.router(
      title: 'ReceiptIQ',
      theme: AppTheme.lightTheme,
      // darkTheme: AppTheme.darkTheme, // To be added later
      themeMode: ThemeMode.light,
      routerConfig: router,
      debugShowCheckedModeBanner: AppConfig.instance.environment == Environment.dev,
    );
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/profile_models.dart';
import '../../auth/application/auth_controller.dart';
import '../../../../core/background/notification_controller.dart';
import '../../../../core/background/background_processing_controller.dart';
import '../../dashboard/application/dashboard_controller.dart';
import '../../history/application/history_controller.dart';
import '../../analytics/application/analytics_controller.dart';
import '../../upload/application/upload_controller.dart';
import '../../households/application/household_controller.dart';

final preferencesControllerProvider = NotifierProvider<PreferencesController, AppPreferences>(() {
  return PreferencesController();
});

class PreferencesController extends Notifier<AppPreferences> {
  @override
  AppPreferences build() {
    // Ideally this would read synchronously from Hive/SharedPreferences
    // For this sprint, we start with default preferences
    return const AppPreferences();
  }

  void updateTheme(ThemeModeType mode) {
    state = state.copyWith(themeMode: mode);
    // TODO: Persist to Hive
  }

  void updateCurrency(Currency currency) {
    state = state.copyWith(currency: currency);
    // TODO: Persist to Hive
  }

  void updateLandingPage(LandingPage page) {
    state = state.copyWith(defaultLandingPage: page);
    // TODO: Persist to Hive
  }

  void updateDefaultWorkspace(String workspaceId) {
    state = state.copyWith(defaultWorkspaceId: workspaceId);
    // TODO: Persist to Hive
  }

  void toggleAnalytics(bool value) {
    state = state.copyWith(analyticsEnabled: value);
    // TODO: Persist to Hive
  }

  void toggleBiometrics(bool value) {
    state = state.copyWith(biometricEnabled: value);
    // TODO: Persist to Hive
  }

  Future<void> performFullLogout() async {
    // 1. Clear Caches & State
    ref.read(notificationControllerProvider.notifier).markAllAsRead(); // Mock clear
    // ref.read(backgroundProcessingControllerProvider.notifier).clearQueue(); // Assume exists
    ref.invalidate(dashboardControllerProvider);
    ref.invalidate(historyControllerProvider);
    ref.invalidate(analyticsControllerProvider);
    ref.invalidate(uploadControllerProvider);
    ref.invalidate(householdControllerProvider);
    
    // 2. Clear Auth Tokens & Cached User
    await ref.read(authControllerProvider.notifier).logout();
  }
}

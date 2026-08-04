import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/splash_screen.dart';
import '../../features/auth/presentation/login_screen.dart';
import '../../features/dashboard/presentation/dashboard_screen.dart';
import '../../features/history/presentation/history_screen.dart';
import '../../features/households/presentation/household_screen.dart';
import '../../features/upload/presentation/upload_screen.dart';
import '../../features/receipts/presentation/review_screen.dart';
import '../../features/analytics/presentation/analytics_screen.dart';
import '../../features/splits/presentation/split_receipt_screen.dart';
import '../../features/splits/presentation/household_balances_screen.dart';
import '../../features/auth/application/auth_controller.dart';
import '../../features/notifications/presentation/notifications_screen.dart';
import '../../features/notifications/presentation/notification_settings_screen.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authControllerProvider);

  return GoRouter(
    initialLocation: '/',
    redirect: (context, state) {
      final isLoading = authState.maybeWhen(
        checking: () => true,
        orElse: () => false,
      );
      final isAuth = authState.maybeWhen(
        authenticated: (_) => true,
        orElse: () => false,
      );

      // Keep routing through splash screen until authentication state is resolved
      if (isLoading) {
        return state.matchedLocation == '/' ? null : '/';
      }

      if (!isAuth && state.matchedLocation != '/login') {
        return '/login';
      }

      if (isAuth && (state.matchedLocation == '/login' || state.matchedLocation == '/')) {
        return '/dashboard';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/dashboard',
        builder: (context, state) => const DashboardScreen(),
      ),
      GoRoute(
        path: '/upload',
        builder: (context, state) => const UploadScreen(),
      ),
      GoRoute(
        path: '/settings/notifications',
        builder: (context, state) => const NotificationSettingsScreen(),
      ),
      GoRoute(
        path: '/notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/review/:id',
        builder: (context, state) {
          final receiptId = state.pathParameters['id']!;
          return ReviewScreen(receiptId: receiptId);
        },
      ),
      GoRoute(
        path: '/analytics',
        builder: (context, state) => const AnalyticsScreen(),
      ),
      GoRoute(
        path: '/history',
        builder: (context, state) => const HistoryScreen(),
      ),
      GoRoute(
        path: '/households',
        builder: (context, state) => const HouseholdScreen(),
      ),
      GoRoute(
        path: '/households/balances',
        builder: (context, state) => const HouseholdBalancesScreen(),
      ),
      GoRoute(
        path: '/receipts/:id/split',
        builder: (context, state) {
          final receiptId = state.pathParameters['id']!;
          final receiptTotal = (state.extra as double?) ?? 0.0;
          return SplitReceiptScreen(receiptId: receiptId, receiptTotal: receiptTotal);
        },
      ),
    ],
  );
});

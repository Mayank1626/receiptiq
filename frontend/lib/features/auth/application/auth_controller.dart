import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../domain/auth_state.dart';
import '../domain/user_model.dart';
import '../data/auth_repository.dart';
import '../../../../core/storage/storage_service.dart';

import '../../../../core/network/api_client.dart';

final authRepositoryProvider = Provider<AuthRepository>((ref) => AuthRepository(ref.watch(apiClientProvider)));
final storageServiceProvider = Provider<StorageService>((ref) => throw UnimplementedError());

final authControllerProvider = NotifierProvider<AuthController, AuthState>(() {
  return AuthController();
});

class AuthController extends Notifier<AuthState> with WidgetsBindingObserver {
  late AuthRepository _authRepository;
  late StorageService _storageService;

  @override
  AuthState build() {
    _authRepository = ref.watch(authRepositoryProvider);
    _storageService = ref.watch(storageServiceProvider);
    
    WidgetsBinding.instance.addObserver(this);
    
    ref.onDispose(() {
      WidgetsBinding.instance.removeObserver(this);
    });

    Future.microtask(() => checkSession());
    return const AuthState.checking();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState appState) {
    if (appState == AppLifecycleState.resumed) {
      // Re-verify session when app comes to foreground
      checkSession();
    }
  }

  Future<void> checkSession() async {
    state = const AuthState.checking();
    
    final token = await _storageService.getAccessToken();
    if (token == null) {
      state = const AuthState.unauthenticated();
      return;
    }

    final cachedUserJson = _storageService.getCachedUser();
    if (cachedUserJson != null) {
      try {
        final user = UserModel.fromJson(jsonDecode(cachedUserJson));
        state = AuthState.authenticated(user);
      } catch (_) {}
    }

    final result = await _authRepository.getCurrentUser();
    
    result.when(
      success: (user) async {
        await _storageService.saveCachedUser(jsonEncode(user.toJson()));
        state = AuthState.authenticated(user);
      },
      failure: (failure) async {
        // If network error, keep using cached user (don't logout)
        failure.maybeWhen(
          unauthorized: (_) => logout(),
          orElse: () {
            if (cachedUserJson == null) {
              state = const AuthState.unauthenticated();
            }
          },
        );
      },
    );
  }

  Future<void> login(String email, String password) async {
    state = const AuthState.checking(); 
    
    final result = await _authRepository.login(email.trim(), password.trim());
    
    await result.when(
      success: (data) async {
        await _storageService.saveTokens(
          accessToken: data['access_token'],
          refreshToken: data['refresh_token'],
        );
        
        // Cache user immediately from login response
        if (data['user'] != null) {
          final user = UserModel.fromJson(data['user']);
          await _storageService.saveCachedUser(jsonEncode(user.toJson()));
          state = AuthState.authenticated(user);
        } else {
          // Fallback if backend didn't return user
          await checkSession();
        }
      },
      failure: (failure) async {
        final message = failure.maybeWhen(
          unauthorized: (msg) => msg,
          network: (msg) => msg,
          orElse: () => 'An unexpected error occurred.',
        );
        state = AuthState.error(message);
      },
    );
  }

  Future<void> logout() async {
    await _storageService.clearTokens();
    await _storageService.clearCachedUser();
    // Invalidate other feature providers when added, e.g. ref.invalidate(receiptsProvider)
    state = const AuthState.unauthenticated();
  }
}



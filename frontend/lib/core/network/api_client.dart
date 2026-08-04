import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../config/app_config.dart';
import 'auth_interceptor.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Storage service provider defined here or in a separate file (it's injected in main)
// Wait, we can't redefine storageServiceProvider if it's already in auth_controller.dart
import '../../features/auth/application/auth_controller.dart' show storageServiceProvider;

final apiClientProvider = Provider<ApiClient>((ref) {
  final storageService = ref.watch(storageServiceProvider);
  return ApiClient(AuthInterceptor(storageService, Dio()));
});

class ApiClient {
  late final Dio dio;
  final Logger logger = Logger();

  ApiClient(AuthInterceptor authInterceptor) {
    dio = Dio(
      BaseOptions(
        baseUrl: AppConfig.instance.apiBaseUrl,
        connectTimeout: const Duration(seconds: 15),
        receiveTimeout: const Duration(seconds: 15),
        contentType: 'application/json',
      ),
    );

    dio.interceptors.addAll([
      authInterceptor,
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        logPrint: (obj) => logger.d(obj),
      ),
    ]);
  }
}

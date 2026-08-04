import 'package:dio/dio.dart';
import 'package:logger/logger.dart';
import '../storage/storage_service.dart';

class AuthInterceptor extends Interceptor {
  final StorageService storageService;
  final Dio dio;
  final Logger logger = Logger();

  AuthInterceptor(this.storageService, this.dio);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await storageService.getAccessToken();
    if (token != null) {
      options.headers['Authorization'] = 'Bearer $token';
    }
    return handler.next(options);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      logger.w('401 Unauthorized - Attempting token refresh');
      final refreshToken = await storageService.getRefreshToken();
      
      if (refreshToken != null) {
        try {
          // Attempt to refresh token
          // The refresh endpoint needs to be called without the interceptor to avoid loops
          final refreshDio = Dio(dio.options);
          final response = await refreshDio.post('/auth/refresh', data: {
            'refresh_token': refreshToken,
          });

          if (response.statusCode == 200) {
            final newAccessToken = response.data['access_token'];
            final newRefreshToken = response.data['refresh_token'];
            
            await storageService.saveTokens(
              accessToken: newAccessToken,
              refreshToken: newRefreshToken,
            );

            // Retry the original request
            final opts = Options(
              method: err.requestOptions.method,
              headers: {
                ...err.requestOptions.headers,
                'Authorization': 'Bearer $newAccessToken',
              },
            );

            final retryResponse = await dio.request(
              err.requestOptions.path,
              options: opts,
              data: err.requestOptions.data,
              queryParameters: err.requestOptions.queryParameters,
            );

            return handler.resolve(retryResponse);
          }
        } catch (e) {
          logger.e('Token refresh failed', error: e);
          await storageService.clearTokens();
          // Ideally trigger a logout event here
        }
      } else {
        await storageService.clearTokens();
      }
    }
    return handler.next(err);
  }
}

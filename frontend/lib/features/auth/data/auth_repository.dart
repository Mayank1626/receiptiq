import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/api_endpoints.dart';
import '../../../../core/network/result.dart';
import '../../../../core/network/failure.dart';
import '../domain/user_model.dart';

class AuthRepository {
  final ApiClient _apiClient;

  AuthRepository(this._apiClient);

  Future<Result<Map<String, dynamic>>> login(String email, String password) async {
    try {
      final response = await _apiClient.dio.post(
        ApiEndpoints.login,
        data: {
          'username': email,
          'password': password,
        },
        options: Options(
          contentType: 'application/x-www-form-urlencoded', 
        ),
      );
      
      return Result.success({
        'access_token': response.data['access_token'],
        'refresh_token': response.data['refresh_token'],
        'user': response.data['user'],
      });
    } on DioException catch (e) {
      if (e.response?.statusCode == 401 || e.response?.statusCode == 400) {
        return const Result.failure(Failure.unauthorized('Invalid email or password.'));
      }
      return const Result.failure(Failure.network('Network error occurred. Please try again.'));
    } catch (e) {
      return Result.failure(Failure.unknown('An unexpected error occurred.', e));
    }
  }

  Future<Result<UserModel>> getCurrentUser() async {
    try {
      final response = await _apiClient.dio.get(ApiEndpoints.currentUser);
      return Result.success(UserModel.fromJson(response.data));
    } on DioException catch (e) {
      if (e.response?.statusCode == 401) {
        return const Result.failure(Failure.unauthorized('Unauthorized'));
      }
      return const Result.failure(Failure.network('Failed to fetch user'));
    } catch (e) {
      return Result.failure(Failure.unknown('An unexpected error occurred.', e));
    }
  }
}

import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/result.dart';
import '../../../../core/network/failure.dart';
import '../../auth/domain/user_model.dart';

final profileRepositoryProvider = Provider<ProfileRepository>((ref) {
  return ProfileRepository(ref.watch(apiClientProvider));
});

class ProfileRepository {
  final ApiClient _apiClient;

  ProfileRepository(this._apiClient);

  Future<Result<User>> getProfile() async {
    try {
      final response = await _apiClient.get('/auth/me');
      return Result.success(User.fromJson(response.data));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<void>> logout() async {
    try {
      // In a real scenario we might pass the refresh token to /auth/logout
      // but for this sprint we just clean up local state if the API fails or succeeds.
      await _apiClient.post('/auth/logout', data: {'refresh_token': 'dummy'});
      return const Result.success(null);
    } catch (e) {
      // Even if API fails (e.g. offline), we return success to allow local logout to proceed
      return const Result.success(null);
    }
  }

  // TODO(backend): Implement updateProfile when PATCH /auth/me is available.
  Future<Result<User>> updateProfile(Map<String, dynamic> data) async {
    return const Result.failure(Failure.validation('Not implemented on backend yet.'));
  }

  // TODO(backend): Implement changePassword when endpoint is available.
  Future<Result<void>> changePassword(String currentPassword, String newPassword) async {
    return const Result.failure(Failure.validation('Not implemented on backend yet.'));
  }

  // TODO(backend): Implement deleteAccount when endpoint is available.
  Future<Result<void>> deleteAccount() async {
    return const Result.failure(Failure.validation('Not implemented on backend yet.'));
  }
}

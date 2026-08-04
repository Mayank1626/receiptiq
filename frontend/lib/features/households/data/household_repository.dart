import 'package:dio/dio.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/core/network/failure.dart';
import 'package:receiptiq_mobile/core/network/result.dart';
import '../domain/household_models.dart';

class HouseholdRepository {
  final ApiClient _apiClient;

  HouseholdRepository(this._apiClient);

  Future<Result<List<HouseholdModel>>> getHouseholds() async {
    try {
      final response = await _apiClient.dio.get('/households/');
      final list = (response.data as List).map((e) => HouseholdModel.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<HouseholdModel>> createHousehold(String name) async {
    try {
      final response = await _apiClient.dio.post('/households/', data: {'name': name});
      return Result.success(HouseholdModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<HouseholdModel>> getHousehold(String id) async {
    try {
      final response = await _apiClient.dio.get('/households/$id');
      return Result.success(HouseholdModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<void>> inviteMember(String householdId, String email, HouseholdRole role) async {
    try {
      await _apiClient.dio.post('/households/$householdId/invitations', data: {
        'email': email,
        'role': role.name,
      });
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }
}

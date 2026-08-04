import 'package:dio/dio.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/core/network/failure.dart';
import 'package:receiptiq_mobile/core/network/result.dart';
import '../domain/split_models.dart';

class SplitRepository {
  final ApiClient _apiClient;

  SplitRepository(this._apiClient);

  Future<Result<void>> createSplit(String receiptId, ExpenseSplitCreate splitIn) async {
    try {
      await _apiClient.dio.post('/receipts/$receiptId/split', data: splitIn.toJson());
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<List<UserBalance>>> getBalances(String householdId) async {
    try {
      final response = await _apiClient.dio.get('/households/$householdId/balances');
      final list = (response.data as List).map((e) => UserBalance.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<List<SuggestedSettlementResponse>>> getSuggestedSettlements(String householdId) async {
    try {
      final response = await _apiClient.dio.get('/households/$householdId/settlements');
      final list = (response.data as List).map((e) => SuggestedSettlementResponse.fromJson(e)).toList();
      return Result.success(list);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<LedgerResponse>> getLedger(String householdId) async {
    try {
      final response = await _apiClient.dio.get('/households/$householdId/ledger');
      return Result.success(LedgerResponse.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }

  Future<Result<void>> completeSettlement(String householdId, String payerId, String payeeId, double amount) async {
    try {
      final settlementIn = SettlementCreate(payerId: payerId, payeeId: payeeId, amount: amount);
      await _apiClient.dio.post(
        '/settlements/complete',
        queryParameters: {'household_id': householdId},
        data: settlementIn.toJson(),
      );
      return const Result.success(null);
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure('An unexpected error occurred'));
    }
  }
}

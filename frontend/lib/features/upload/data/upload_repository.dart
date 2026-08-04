import 'dart:io';
import 'package:dio/dio.dart';
import '../../../../core/network/api_client.dart';
import '../../../../core/network/result.dart';
import '../../../../core/network/failure.dart';
import '../domain/upload_models.dart';
import '../../receipts/domain/receipt_model.dart';
import 'package:path/path.dart' as path;

class UploadRepository {
  final ApiClient _apiClient;

  UploadRepository(this._apiClient);

  Future<Result<UploadedFile>> uploadReceipt(File file) async {
    try {
      final fileName = path.basename(file.path);
      final formData = FormData.fromMap({
        'file': await MultipartFile.fromFile(file.path, filename: fileName),
      });

      final response = await _apiClient.dio.post(
        '/uploads/',
        data: formData,
      );
      return Result.success(UploadedFile.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<OCRResult>> startOCR(String uploadedFileId) async {
    try {
      final response = await _apiClient.dio.post('/ocr/$uploadedFileId');
      return Result.success(OCRResult.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<AIExtractionResult>> startAI(String ocrResultId) async {
    try {
      final response = await _apiClient.dio.post('/ai/$ocrResultId');
      return Result.success(AIExtractionResult.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }

  Future<Result<ReceiptModel>> materialize(String aiExtractionResultId) async {
    try {
      final response = await _apiClient.dio.post('/normalization/$aiExtractionResultId');
      return Result.success(ReceiptModel.fromJson(response.data));
    } on DioException catch (e) {
      return Result.failure(Failure.fromDioException(e));
    } catch (e) {
      return Result.failure(Failure.unknown(e.toString()));
    }
  }
}

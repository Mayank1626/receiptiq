import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dio/dio.dart';

part 'failure.freezed.dart';

@freezed
class Failure with _$Failure {
  const factory Failure.unauthorized(String message) = _Unauthorized;
  const factory Failure.validation(String message) = _Validation;
  const factory Failure.network(String message) = _Network;
  const factory Failure.server(String message) = _Server;
  const factory Failure.unknown(String message, [Object? exception]) = _Unknown;

  factory Failure.fromDioException(DioException e) {
    if (e.response?.statusCode == 400 || e.response?.statusCode == 422) {
      return Failure.validation(e.response?.data?['detail']?.toString() ?? 'Validation error');
    }
    if (e.response?.statusCode == 401 || e.response?.statusCode == 403) {
      return const Failure.unauthorized('Unauthorized');
    }
    if (e.response?.statusCode != null && e.response!.statusCode! >= 500) {
      return const Failure.server('Server error');
    }
    return const Failure.network('Network error');
  }
}

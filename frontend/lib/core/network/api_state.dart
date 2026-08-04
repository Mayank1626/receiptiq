import 'package:freezed_annotation/freezed_annotation.dart';
import 'failure.dart';

part 'api_state.freezed.dart';

@freezed
class ApiState<T> with _$ApiState<T> {
  const factory ApiState.initial() = _Initial<T>;
  const factory ApiState.loading() = _Loading<T>;
  const factory ApiState.refreshing(T data) = _Refreshing<T>;
  const factory ApiState.success(T data) = _Success<T>;
  const factory ApiState.failure(Failure failure) = _FailureState<T>;
}

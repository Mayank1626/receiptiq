import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dio/dio.dart';
import 'package:receiptiq_mobile/core/network/api_client.dart';
import 'package:receiptiq_mobile/features/auth/data/auth_repository.dart';
import 'package:receiptiq_mobile/core/network/api_endpoints.dart';

class MockApiClient extends Mock implements ApiClient {}
class MockDio extends Mock implements Dio {}

void main() {
  late AuthRepository authRepository;
  late MockApiClient mockApiClient;
  late MockDio mockDio;

  setUp(() {
    mockApiClient = MockApiClient();
    mockDio = MockDio();
    when(() => mockApiClient.dio).thenReturn(mockDio);
    authRepository = AuthRepository(mockApiClient);
    
    registerFallbackValue(Options());
  });

  group('AuthRepository', () {
    test('login returns success result when credentials are valid', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: ApiEndpoints.login),
        data: {'access_token': 'access', 'refresh_token': 'refresh'},
        statusCode: 200,
      );

      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenAnswer((_) async => mockResponse);

      final result = await authRepository.login('test@example.com', 'password');

      result.when(
        success: (data) {
          expect(data['access_token'], 'access');
          expect(data['refresh_token'], 'refresh');
        },
        failure: (msg, [err]) => fail('Expected success but got failure'),
      );
    });

    test('login returns failure result on 401 Unauthorized', () async {
      when(() => mockDio.post(
            any(),
            data: any(named: 'data'),
            options: any(named: 'options'),
          )).thenThrow(DioException(
        requestOptions: RequestOptions(path: ApiEndpoints.login),
        response: Response(requestOptions: RequestOptions(path: ApiEndpoints.login), statusCode: 401),
      ));

      final result = await authRepository.login('test@example.com', 'wrongpassword');

      result.when(
        success: (_) => fail('Expected failure but got success'),
        failure: (msg, [err]) {
          expect(msg, 'Invalid email or password.');
        },
      );
    });

    test('getCurrentUser returns success with UserModel', () async {
      final mockResponse = Response(
        requestOptions: RequestOptions(path: ApiEndpoints.currentUser),
        data: {'id': '123', 'email': 'test@example.com', 'full_name': 'Test User'},
        statusCode: 200,
      );

      when(() => mockDio.get(any())).thenAnswer((_) async => mockResponse);

      final result = await authRepository.getCurrentUser();

      result.when(
        success: (user) {
          expect(user.id, '123');
          expect(user.email, 'test@example.com');
          expect(user.fullName, 'Test User');
        },
        failure: (msg, [err]) => fail('Expected success but got failure'),
      );
    });
  });
}

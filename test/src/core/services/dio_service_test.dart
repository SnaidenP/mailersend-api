import 'package:dio/dio.dart';
import 'package:mailersend_api/src/core/services/dio_service.dart';
import 'package:test/test.dart';

void main() {
  group('DioService', () {
    late DioService dioService;

    setUp(() {
      dioService = DioService();
    });

    test('should return Dio instance', () {
      final dio = dioService();
      expect(dio, isA<Dio>());
    });

    test('should return the same Dio instance', () {
      final dio1 = dioService();
      final dio2 = dioService();
      expect(dio1, equals(dio2));
    });

    test('should set Authorization header when token is provided', () {
      const token = 'test_token';
      final dio = dioService(token: token);
      expect(dio.options.headers['Authorization'], 'Bearer $token');
    });
  });
}

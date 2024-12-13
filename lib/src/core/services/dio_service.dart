import 'package:dio/dio.dart';

/// {@template dio_service}
/// Service to handle HTTP requests using the Dio package.
/// {@endtemplate}
class DioService {
  /// {@macro dio_service}
  factory DioService() => _instance;

  /// Internal constructor for the DioService.
  DioService._internal() {
    _dio = Dio(
      BaseOptions(
        baseUrl: 'https://api.mailersend.com/v1/',
      ),
    );
  }

  /// The singleton instance of the DioService.
  static final DioService _instance = DioService._internal();

  /// Dio instance used for HTTP requests.
  late final Dio _dio;

  /// Allows the instance to be callable, optionally accepting a token.
  Dio call({String? token}) {
    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
    return _dio;
  }
}

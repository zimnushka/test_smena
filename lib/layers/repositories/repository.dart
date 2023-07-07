import 'package:dio/dio.dart';
import 'package:test_smena/app/configs.dart';

abstract class ApiRepository {
  static String? _url;
  static bool _debug = false;
  static Dio _dio = Dio();

  static set url(String value) => _setUrl(value);

  static void setConfig(AppConfig value) {
    _url = value.url;
    _debug = value.isDebug;
    _updateDio();
  }

  static _setUrl(String value) {
    _url = value;
    _updateDio();
  }

  static _updateDio() {
    _dio = Dio(BaseOptions(
      baseUrl: _url ?? '',
      followRedirects: false,
    ))
      ..interceptors.add(
        LogInterceptor(
          requestHeader: false,
          responseHeader: false,
          requestBody: _debug,
          responseBody: _debug,
          error: _debug,
        ),
      );
  }

  Dio get client => _dio;
}

class ApiErrorHandler<T> {
  final Future<ApiResponse<T?>> Function() func;
  const ApiErrorHandler(this.func);

  Future<ApiResponse<T?>> get result => _errorHandler();

  Future<ApiResponse<T?>> _errorHandler() async {
    try {
      final result = await func();
      return result;
    } on DioException catch (e) {
      return ApiResponse<T?>(body: null, status: e.response?.statusCode ?? 0, error: e);
    } catch (e) {
      return ApiResponse<T?>(body: null, status: 0, error: Exception(e.toString()));
    }
  }
}

class ApiResponse<T> {
  final int statusCode;
  final bool isSuccess;
  final String? message;
  final T? data;

  static bool _isSuccessStatusCode(int? code) {
    final index = code ?? 0;
    return index > 199 && index < 300;
  }

  factory ApiResponse({T? body, int? status, Exception? error}) {
    // ignore: avoid_bool_literals_in_conditional_expressions
    final isSuccess = error != null ? false : _isSuccessStatusCode(status);
    String message = error.toString();
    if (error is DioException) {
      message = error.response?.data.toString() ?? error.message ?? '';
    }
    return ApiResponse._internal(
      data: isSuccess ? body : null,
      isSuccess: isSuccess,
      message: isSuccess ? null : message,
      statusCode: status ?? 0,
    );
  }

  ApiResponse._internal({
    required this.data,
    required this.isSuccess,
    required this.message,
    required this.statusCode,
  });
}

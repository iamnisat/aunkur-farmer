import 'dart:convert';
import 'dart:io';
import 'package:aunkur_farmer/main.dart';
import 'package:aunkur_farmer/src/common/constant/api_constant.dart';
import 'package:aunkur_farmer/src/common/constant/app_constant.dart';
import 'package:aunkur_farmer/src/common/widget/app_constant_ui.dart';
import 'package:aunkur_farmer/src/service/localStorage/setup.dart';
import 'package:aunkur_farmer/src/service/localStorage/shared_preferences_helper.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/material.dart';

final preference = getIt<SharedPreferencesHelper>();

class Api {
  final Dio dio = createDio();
  Api._internal();
  static final _singleton = Api._internal();
  factory Api() => _singleton;

  static Dio createDio() {
    final dio = Dio(
      BaseOptions(
        baseUrl: ApiConstant.BASEURL,
        connectTimeout: const Duration(milliseconds: 30000),
        receiveTimeout: const Duration(milliseconds: 30000),
        sendTimeout: const Duration(milliseconds: 30000),
      ),
    );

    dio.interceptors.addAll({ErrorInterceptor(dio)});
    dio.options.validateStatus = (int? status) {
      return (status != null) &&
          (status >= 200 && status < 300 ||
              [400, 401, 403, 404, 409, 500].contains(status));
    };

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    return dio;
  }

  //----------------------COMMON REQUEST METHODS----------------------

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onReceiveProgress,
  }) async {
    _addRequestInterceptor();
    _logRequest('GET', path, queryParameters: queryParameters);
    final res = await dio.get(
      dio.options.baseUrl + path,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
    return _processResponse(res);
  }

  Future<Response> post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    void Function(int, int)? onSendProgress,
    void Function(int, int)? onReceiveProgress,
  }) async {
    _addRequestInterceptor();
    _logRequest('POST', path, body: data, queryParameters: queryParameters);
    final res = await dio.post(
      dio.options.baseUrl + path,
      data: data,
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
      onSendProgress: onSendProgress,
      onReceiveProgress: onReceiveProgress,
    );
    return _processResponse(res);
  }

  Future<Response> put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _addRequestInterceptor();
    _logRequest('PUT', path, body: data, queryParameters: queryParameters);
    final res = await dio.put(
      dio.options.baseUrl + path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return _processResponse(res);
  }

  Future<Response> delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
  }) async {
    _addRequestInterceptor();
    _logRequest('DELETE', path, body: data, queryParameters: queryParameters);
    final res = await dio.delete(
      dio.options.baseUrl + path,
      data: FormData.fromMap(data),
      queryParameters: queryParameters,
      options: options,
      cancelToken: cancelToken,
    );
    return _processResponse(res);
  }

  //----------------------HELPERS----------------------

  void _addRequestInterceptor() {
    dio.interceptors.add(
      RequestInterceptor(
        dio,
        apiKey: '',
        token: preference.getString(AppConstant.TOKEN),
      ),
    );
  }

  //----------------------RESPONSE HANDLER----------------------

  Response _processResponse(Response response) {
    final status = response.statusCode ?? 0;
    final success = status >= 200 && status < 300;
    final prettyJson = const JsonEncoder.withIndent(
      '  ',
    ).convert(response.data);

    debugPrint("\n📦 RESPONSE ───────────────────────────────────────────────");
    debugPrint("✅ STATUS: $status ${success ? '✅ SUCCESS' : '❌ FAILED'}");
    debugPrint("🌐 URL: ${response.requestOptions.uri}");
    debugPrint("🕓 TIME: ${response.requestOptions.sendTimeout} ms");
    debugPrint("📄 DATA: $prettyJson");
    debugPrint(
      "────────────────────────────────────────────────────────────\n",
    );

    final dynamic rawData = response.data;
    Map<String, dynamic> data = {};

    try {
      if (rawData is String) {
        data = jsonDecode(rawData);
      } else if (rawData is Map<String, dynamic>) {
        data = rawData;
      }
    } catch (_) {
      data = {};
    }

    final String message =
        data['message']?.toString() ?? 'Something went wrong.';

    // Combine validation errors
    if (data['errors'] != null && data['errors'] is List) {
      final List<dynamic> errors = data['errors'];
      final combined = errors
          .map((e) => e['message']?.toString() ?? '')
          .where((m) => m.isNotEmpty)
          .join('\n');
      final fullMessage = combined.isNotEmpty ? combined : message;
      _logError("Validation Error", fullMessage);
      throw BadRequestException(
        response.requestOptions,
        Response(
          requestOptions: response.requestOptions,
          data: {'message': fullMessage},
          statusCode: response.statusCode,
        ),
      );
    }

    switch (status) {
      case 200:
      case 201:
      case 204:
        return response;
      case 400:
        _logError("Bad Request", message);
        throw BadRequestException(response.requestOptions, response);
      case 401:
      case 403:
        _logError("Unauthorized", message);
        throw UnauthorizedException(response.requestOptions);
      case 404:
        _logError("Not Found", message);
        throw NotFoundException(response.requestOptions);
      case 409:
        _logError("Conflict", message);
        throw ConflictException(response.requestOptions, response);
      case 500:
        _logError("Server Error", message);
        throw InternalServerErrorException(response.requestOptions);
      default:
        _logError("Unexpected Error [$status]", message);
        throw BadRequestException(response.requestOptions, response);
    }
  }

  //----------------------LOG HELPERS----------------------

  void _logRequest(
    String method,
    String path, {
    dynamic body,
    Map<String, dynamic>? queryParameters,
  }) {
    final token = preference.getString(AppConstant.TOKEN);
    debugPrint("\n🚀 REQUEST ───────────────────────────────────────────────");
    debugPrint("🔹 METHOD: $method");
    debugPrint("🌐 URL: ${dio.options.baseUrl + path}");
    if (queryParameters != null && queryParameters.isNotEmpty) {
      debugPrint("🧭 QUERY: ${jsonEncode(queryParameters)}");
    }
    if (body != null) {
      debugPrint("📦 BODY: ${jsonEncode(body)}");
    }
    debugPrint("🔑 TOKEN: ${token.isNotEmpty ? 'Attached ✅' : 'None ⚠️'}");
    debugPrint(
      "────────────────────────────────────────────────────────────\n",
    );
  }

  void _logError(String title, String message) {
    debugPrint("❌ ERROR [$title]");
    debugPrint("🧾 MESSAGE: $message");
    debugPrint(
      "────────────────────────────────────────────────────────────\n",
    );
  }
}

class RequestInterceptor extends Interceptor {
  final Dio dio;
  final String apiKey;
  final String token;

  RequestInterceptor(this.dio, {required this.token, required this.apiKey});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final freshToken = preference.getString(AppConstant.TOKEN);
    options.headers = {
      'Authorization': 'Bearer $freshToken',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    handler.next(options);
  }
}

class ErrorInterceptor extends Interceptor {
  final Dio dio;
  ErrorInterceptor(this.dio);

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    debugPrint("💥 DIO ERROR ─────────────────────────────────────────────");
    debugPrint("🔺 Type: ${err.type}");
    debugPrint("🔻 Message: ${err.message}");
    debugPrint("📡 URL: ${err.requestOptions.uri}");
    debugPrint(
      "────────────────────────────────────────────────────────────\n",
    );

    switch (err.type) {
      case DioExceptionType.connectionTimeout:
        throw ConnectionTimeOutException(err.requestOptions);
      case DioExceptionType.sendTimeout:
        throw SendTimeOutException(err.requestOptions);
      case DioExceptionType.receiveTimeout:
        throw ReceiveTimeOutException(err.requestOptions);
      case DioExceptionType.unknown:
        throw NoInternetConnectionException(err.requestOptions);
      case DioExceptionType.badResponse:
        if (err.response?.statusCode == 401 &&
            preference.getString(AppConstant.TOKEN).isNotEmpty) {
          preference.removeData();
          AppConstantUI.showCustomSnackBar(
            "Session Expired. Please Login Again",
          );
          Navigator.pushNamedAndRemoveUntil(
            navigatorKey.currentContext!,
            '/LoginPage',
            (Route<dynamic> route) => false,
          );
        }
        throw BadRequestException(err.requestOptions, err.response);
      default:
        break;
    }

    handler.next(err);
  }
}

//----------------------CUSTOM EXCEPTIONS----------------------

class ConnectionTimeOutException extends DioException {
  ConnectionTimeOutException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() => '⏱ Connection Timed out, please try again.';
}

class SendTimeOutException extends DioException {
  SendTimeOutException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() => '📤 Send Timed out, please try again.';
}

class ReceiveTimeOutException extends DioException {
  ReceiveTimeOutException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() => '📥 Receive Timed out, please try again.';
}

class BadRequestException extends DioException {
  BadRequestException(RequestOptions r, Response? response)
    : super(requestOptions: r, response: response);
  @override
  String toString() =>
      '⚠️ ${response?.data['message'] ?? 'Bad request, please try again.'}';
}

class InternalServerErrorException extends DioException {
  InternalServerErrorException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() =>
      '💣 Internal server error occurred, please try again later.';
}

class ConflictException extends DioException {
  ConflictException(RequestOptions r, Response? response)
    : super(requestOptions: r, response: response);
  @override
  String toString() =>
      '⚔️ ${response?.data['message'] ?? 'Conflict occurred, please try again.'}';
}

class UnauthorizedException extends DioException {
  UnauthorizedException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() => '🔒 Access denied, please login again.';
}

class NotFoundException extends DioException {
  NotFoundException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() => '🔍 The requested resource could not be found.';
}

class NoInternetConnectionException extends DioException {
  NoInternetConnectionException(RequestOptions r) : super(requestOptions: r);
  @override
  String toString() =>
      '🌐 No internet connection detected, please check your network.';
}

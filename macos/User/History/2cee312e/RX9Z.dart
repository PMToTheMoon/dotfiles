import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import 'models/document_type.dart';
import 'models/session.dart';
import 'models/user.dart';
import 'models/user_sign_in_status.dart';

import 'network/api/authentication_api.dart';
import 'network/api/document_api.dart';
import 'network/api/user_api.dart';
import 'network/mappers/document_type_mapper.dart';
import 'network/mappers/sign_in_mapper.dart';
import 'network/request/update_push_token_body.dart';

typedef BearerTokenProvider = FutureOr<String?> Function();

typedef RefreshTokenCallback = FutureOr<void> Function();

final _log = Logger('ZanalysAuthApiClient');

class ZanalysAuthApiClient {
  factory ZanalysAuthApiClient(
    String baseUrl, {
    bool isDebug = false,
    required BearerTokenProvider tokenProvider,
    required RefreshTokenCallback refreshTokenCallback,
  }) {
    final dio = _createDioAuthClient(
      isDebug: isDebug,
      tokenProvider: tokenProvider,
      refreshTokenCallback: refreshTokenCallback,
    );
    return ZanalysAuthApiClient._(baseUrl, dio);
  }

  final Dio _dio;

  final String _baseUrl;

  ZanalysAuthApiClient._(this._baseUrl, this._dio);
}

Dio _createDioAuthClient({
  required bool isDebug,
  required BearerTokenProvider tokenProvider,
  required RefreshTokenCallback refreshTokenCallback,
}) {
  final dio = _createDioClientWithBaseOptions();
  dio.interceptors.addAll([
    _refreshTokenInterceptor(
      dio,
      tokenProvider: tokenProvider,
      refreshTokenCallback: refreshTokenCallback,
    ),
    if (isDebug)
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        logPrint: (Object object) => _log.info(object.toString()),
      ),
  ]);
  return dio;
}

Dio _createDioClientWithBaseOptions() => Dio(
      BaseOptions(
        contentType: ContentType.json.value,
        followRedirects: true,
        maxRedirects: 10,
        connectTimeout: const Duration(seconds: 30).inMilliseconds,
        receiveTimeout: const Duration(seconds: 30).inMilliseconds,
        sendTimeout: const Duration(seconds: 30).inMilliseconds,
      ),
    );

Interceptor _refreshTokenInterceptor(
  Dio baseClient, {
  required BearerTokenProvider tokenProvider,
  required RefreshTokenCallback refreshTokenCallback,
}) =>
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        options.headers['Source'] = 'MOBILE';
        final token = await tokenProvider();
        if (token != null && token.isNotEmpty) {
          options.headers['Authorization'] = 'Bearer:$token';
        }
        return handler.next(options);
      },
      onError: (error, handler) async {
        //Handle 401 HTTP ERRORS and refresh token
        if (error.response?.statusCode == 401) {
          await refreshTokenCallback();
          final token = await tokenProvider();
          if (token != null && token.isNotEmpty) {
            error.requestOptions.headers['Authorization'] = 'Bearer:$token';

            final opts = Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers);
            final cloneReq = await baseClient.request(error.requestOptions.path,
                options: opts,
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters);

            return handler.resolve(cloneReq);
          } else {
            handler.reject(error);
          }
        } else {
          handler.next(error);
        }
      },
    );

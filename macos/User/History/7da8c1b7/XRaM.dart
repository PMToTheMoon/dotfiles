import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys_api/src/models/document_type.dart';
import 'package:zanalys_api/src/models/session.dart';
import 'package:zanalys_api/src/models/user.dart';
import 'package:zanalys_api/src/models/user_sign_in_status.dart';
import 'package:zanalys_api/src/network/api/authentication_api.dart';
import 'package:zanalys_api/src/network/api/document_api.dart';
import 'package:zanalys_api/src/network/api/user_api.dart';
import 'package:zanalys_api/src/network/mappers/document_type_mapper.dart';
import 'package:zanalys_api/src/network/mappers/sign_in_mapper.dart';
import 'package:zanalys_api/src/network/network_service.dart';
import 'package:zanalys_api/src/network/request/update_push_token_body.dart';

final _log = Logger('NetworkService');

class DioNetworkService implements NetworkService {
  late AuthenticationAPI _authenticationAPI;
  late DocumentAPI _documentAPI;
  late UserAPI _userAPI;
  late Dio _dio;

  @override
  Future<void> init() async {
    _dio = Dio(
      BaseOptions(
        contentType: ContentType.json.value,
        followRedirects: true,
        maxRedirects: 10,
        connectTimeout: const Duration(seconds: 30).inMilliseconds,
        receiveTimeout: const Duration(seconds: 30).inMilliseconds,
        sendTimeout: const Duration(seconds: 30).inMilliseconds,
      ),
    );

    _dio.interceptors
        .add(InterceptorsWrapper(onRequest: (options, handler) async {
      options.headers['Source'] = 'MOBILE';
      String? token = await AppServices.storage.getToken();
      if (token != null && token.isNotEmpty) {
        options.headers['Authorization'] = 'Bearer:$token';
      }
      return handler.next(options);
    }, onError: (error, handler) async {
      //Handle 401 HTTP ERRORS and refresh token
      if (error.response?.statusCode == 401) {
        String? currentToken = await AppServices.storage.getRefreshToken();
        if (currentToken != null && currentToken.isNotEmpty) {
          String? newToken = await refreshToken(currentToken: currentToken);
          if (newToken != null && newToken.isNotEmpty) {
            await AppServices.storage.saveToken(newToken);
            error.requestOptions.headers['Authorization'] = 'Bearer:$newToken';

            final opts = Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers);
            final cloneReq = await _dio.request(error.requestOptions.path,
                options: opts,
                data: error.requestOptions.data,
                queryParameters: error.requestOptions.queryParameters);

            return handler.resolve(cloneReq);
          } else {
            handler.reject(error);
            _logout();
          }
        } else {
          handler.reject(error);
          _logout();
        }
      } else {
        handler.next(error);
      }
    }));

    if (env.isDebugBuild) {
      _dio.interceptors.add(
        LogInterceptor(
          requestHeader: true,
          requestBody: true,
          responseHeader: true,
          responseBody: true,
          logPrint: (Object object) => _log.info(object.toString()),
        ),
      );
    }

    _initAPIs();
  }

  _logout() async {
    await AppServices.storage.clearSession();
  }

  @override
  Future<UserSignInStatus> signIn(
      {required String identifier, required String password}) async {
    String status = await _authenticationAPI.signIn(identifier, password);
    return SignInMapper().convert(status);
  }

  @override
  Future<User?> folderSignIn(
      {required String identifier, required String password}) {
    return _authenticationAPI.folderSignIn(identifier, password);
  }

  @override
  Future<Session?> validateOTP(
      {required String identifier,
      required String password,
      required String code}) {
    return _authenticationAPI.validateOTP(identifier, password, code);
  }

  @override
  Future<String?> uploadDocument({
    required String path,
    required String accessCode,
    required DocumentType type,
  }) {
    return _documentAPI.upload(
        DocumentTypeMapper().convert(type).toString(), accessCode, File(path));
  }

  @override
  Future<String?> refreshToken({required String currentToken}) {
    return _authenticationAPI.refreshToken(currentToken);
  }

  @override
  Future<void> updatePushToken({required String token}) {
    return _userAPI.updatePushToken(UpdatePushTokenBody(token: token));
  }

  _initAPIs() {
    _authenticationAPI = AuthenticationAPI(_dio, baseUrl: env.rootURL);
    _documentAPI = DocumentAPI(_dio, baseUrl: env.rootURL);
    _userAPI = UserAPI(_dio, baseUrl: env.rootURL);
  }
}

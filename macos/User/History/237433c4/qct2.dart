import 'dart:async';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';

import '_dio.dart';
import 'models/session.dart';
import 'models/user.dart';
import 'models/user_sign_in_status.dart';

import 'network/api/authentication_api.dart';
import 'network/mappers/sign_in_mapper.dart';

final _log = Logger('ZanalysPublicApiClient');

class ZanalysPublicApiClient {
  factory ZanalysPublicApiClient(String baseUrl, {bool isDebug = false}) {
    final dio = _createDioClient(
      isDebug: isDebug,
    );
    return ZanalysPublicApiClient._(baseUrl, dio);
  }

  final AuthenticationAPI _auth;

  Future<UserSignInStatus> signIn(
      {required String identifier, required String password}) async {
    String status = await _auth.signIn(identifier, password);
    return SignInMapper().convert(status);
  }

  Future<User?> folderSignIn(
      {required String identifier, required String password}) {
    return _auth.folderSignIn(identifier, password);
  }

  Future<Session?> validateOTP(
      {required String identifier,
      required String password,
      required String code}) {
    return _auth.validateOTP(identifier, password, code);
  }

  ZanalysPublicApiClient._(String baseUrl, Dio dio)
      : _auth = AuthenticationAPI(dio, baseUrl: baseUrl);
}

Dio _createDioClient({
  required bool isDebug,
}) {
  final dio = createDioClientWithBaseOptions();
  if (isDebug) {
    dio.interceptors.add(LogInterceptor(
      requestHeader: true,
      requestBody: true,
      responseHeader: true,
      responseBody: true,
      logPrint: (Object object) => _log.info(object.toString()),
    ));
  }
  return dio;
}

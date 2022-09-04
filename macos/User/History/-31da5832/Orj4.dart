import 'dart:io';
import 'dart:convert';

import 'package:app_client/urban_driver_api/models/models.dart';
import 'package:app_client/urban_driver_api/urban_driver_api.dart';
import 'package:dio/dio.dart';
import 'package:dio_smart_retry/dio_smart_retry.dart';
import 'package:crypto/crypto.dart';

import 'package:common/common.dart';
import 'package:app_client/config.dart';
import 'package:intl/intl.dart';
import 'package:intl_phone_field/phone_number.dart';

final _uri = Uri.https(
  Config.urbanDriverApiDomain,
  Config.urbanDriverApiBaseUrl,
);

final _options = BaseOptions(
  baseUrl: _uri.toString(),
  responseType: ResponseType.json,
  contentType: Headers.formUrlEncodedContentType,
);

class UrbanDriverApiClient {
  UrbanDriverApiClient() {
    _client.interceptors.add(
      RetryInterceptor(
        dio: _client,
        logPrint: print,
        retryDelays: const [
          Duration(milliseconds: 500),
          Duration(milliseconds: 750),
          Duration(seconds: 1)
        ],
      ),
    );
  }

  final _client = Dio(_options);

  Future<String> login({
    required String email,
    required String password,
  }) async {
    try {
      final res = await _client.post<Map<String, dynamic>>("/login", data: {
        "login": email,
        "password": password,
      });
      final String? token = res.data?["token"];
      if (token == null) throw Unauthorized();
      return token;
    } on DioError catch (e) {
      throw e.toDomain();
    }
  }

  Future<String> signin(SignInRequest request) async {
    try {
      final res = await _client.post<Map<String, dynamic>>(
        "/signin",
        data: request,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      final String? token = res.data?["token"];
      if (token == null) throw Unauthorized();
      return token;
    } on DioError catch (e) {
      throw e.toDomain();
    }
  }

  Future<void> sendSmsVerificationCode(
    String _,
  ) async {
    final phoneNumber = "0000330652179408";
    final date = DateTime.now();
    "2022-03-28 13:50:30";
    final format = DateFormat("y-M-d H:m:s");
    final dateStr = format.format(date);
    final toBeHashed = utf8.encode("$dateStr${Config.smsSalt}$phoneNumber");
    final hash = sha256.convert(toBeHashed).toString();
    try {
      final res = await _client.post<Map<String, dynamic>>(
        "/smscode",
        data: {
          "mobile": phoneNumber, //phoneNumber,
          "datetime": dateStr,
          "hash": hash,
        },
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
          },
        ),
      );
      if (res.data?["status"] != "ok") throw "Failed to send sms";
    } on DioError catch (e) {
      throw e.toDomain();
    }
  }
}

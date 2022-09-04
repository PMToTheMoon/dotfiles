import 'package:dio/dio.dart';
import 'package:zanalys_api/src/network/api/document_api.dart';

mixin DocumentApiClient {
  String get baseUrl;
  Dio get dio;

  late final document = DocumentAPI(dio, baseUrl: baseUrl);
}

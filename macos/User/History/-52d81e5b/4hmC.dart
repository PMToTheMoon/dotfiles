import 'package:dio/dio.dart';
import 'package:zanalys_api/src/network/api/document_api.dart';

mixin DocumentApiMixin {
  String get baseUrl;
  Dio get dio;

  late final document = DocumentAPI(_dio, baseUrl: baseUrl);
}

import 'package:dio/dio.dart';

mixin DocumentApiMixin {
  String get baseUrl;
  Dio get dio;

  late final document = DocumentAPI(_dio, baseUrl: baseUrl);
}

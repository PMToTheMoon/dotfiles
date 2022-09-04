import 'package:dio/dio.dart';

mixin GridApiMixin {
  String get baseUrl;
  Dio get dio;
}

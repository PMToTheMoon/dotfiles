import 'package:dio/dio.dart';

mixin RecordApiMixin {
  String get baseUrl;
  Dio get dio;
}

import 'package:dio/dio.dart';
import 'package:zanalys_api/src/user_api/user_api.dart';

mixin RecordApiMixin {
  String get baseUrl;
  Dio get dio;

  late final _user = UserAPI(dio, baseUrl: baseUrl);
}

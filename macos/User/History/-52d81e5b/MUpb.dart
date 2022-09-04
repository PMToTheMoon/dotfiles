import 'package:dio/dio.dart';
import 'package:zanalys_api/src/network/api/document_api.dart';

mixin DocumentApiClient {
  String get baseUrl;
  Dio get dio;

  late final _document = DocumentAPI(dio, baseUrl: baseUrl);

  Future<String?> uploadDocument({
    required String path,
    required String accessCode,
    required DocumentType type,
  }) {
    return _document.upload(
        DocumentTypeMapper().convert(type).toString(), accessCode, File(path));
  }
}

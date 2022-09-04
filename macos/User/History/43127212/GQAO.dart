import 'package:zanalys/app/environment.dart';
import 'package:zanalys/authentication/authentication.dart';
import 'package:zanalys/upload_document/models/document_type.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class DocumentService {
  DocumentService({
    required AppEnvironment environment,
    required AuthService authService,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  Future<String?> uploadDocument({
    required String path,
    required String accessCode,
    required DocumentType type,
  }) {
    return _client.uploadDocument(
      path: path,
      accessCode: accessCode,
      type: type,
    );
  }

  late final api.ZanalysPrivateApiClient _client;
}

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/authentication/authentication.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class DocumentService {
  DocumentService({
    required AppEnvironment environment,
    required AutheService authService,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  late final api.ZanalysPrivateApiClient _client;
}

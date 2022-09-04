import 'package:zanalys/app/environment.dart';
import 'package:zanalys/authentication/authentication.dart';
import 'package:zanalys_api/zanalys_api.dart';

class DocumentService {
  DocumentService({
    required AppEnvironment environment,
    required AuthenticationService authService,
  }) {
    _client = ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  late final ZanalysPrivateApiClient _client;
}

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/authentication/services/authentication_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class UserService {
  UserService({
    required AppEnvironment environment,
    required AuthenticationService authService,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  late final api.ZanalysPrivateApiClient _client;
}

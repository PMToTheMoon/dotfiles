import 'package:zanalys/app/environment.dart';
import 'package:zanalys/authentication/services/authentication_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class UserService {
  UserService({
    required AppEnvironment environment,
    required AuthService authService,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  Future<void> updatePushToken({required String token}) =>
      _client.updatePushToken(token: token);

  late final api.ZanalysPrivateApiClient _client;
}

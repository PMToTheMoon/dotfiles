import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class PatientService {
  PatientService({
    required this.authService,
    required AppEnvironment environment,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  final AuthService authService;

  late final api.ZanalysPrivateApiClient _client;
}

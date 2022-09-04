class PatientService {
  PatientService({
    required this.storage,
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

  final StorageService storage;

  late final api.ZanalysPrivateApiClient _client;
}

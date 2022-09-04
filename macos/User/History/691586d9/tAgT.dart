class UserService {
  UserService({
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

abstract class AppEnvironment {
  String get rootURL;

  bool get isDebugBuild;

  APIClient get apiClient;

  StorageService get storage;
}

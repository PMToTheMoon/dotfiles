import 'package:zanalys/data/network/network.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart';

abstract class AppEnvironment {
  String get rootURL;

  bool get isDebugBuild;

  APIClient Function(
    BearerTokenProvider tokenProvider,
    RefreshTokenCallback refreshToken,
  ) get apiClient;

  StorageService get storage;
}

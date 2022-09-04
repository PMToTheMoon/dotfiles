import 'package:zanalys/data/network/network.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart';

abstract class AppEnvironment {
  APIClient Function({
    required BearerTokenProvider tokenProvider,
    required RefreshTokenCallback refreshToken,
  }) get apiClientFactory;

  StorageService get storage;
}

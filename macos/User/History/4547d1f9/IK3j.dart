import 'package:zanalys/data/network/network.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart';

typedef ApiClientFactory = APIClient Function(
  BearerTokenProvider tokenProvider,
  RefreshTokenCallback refreshToken,
);

abstract class AppEnvironment {
  ApiClientFactory get apiClientFactory;

  StorageService get storage;
}

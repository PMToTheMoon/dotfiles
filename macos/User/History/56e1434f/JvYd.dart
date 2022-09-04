import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/app_environment.dart';
import 'package:zanalys/data/network/network.dart';
import 'package:zanalys/data/storage/secure_storage_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart';

void main() {
  launchApp(
    const AppData(
      services: _LocalAppServices(),
      environment: _LocalAppEnv(),
    ),
  );
}

class _LocalAppEnv implements AppEnvironment {
  const _LocalAppEnv();

  @override
  final isDebugBuild = true;

  // @override
  // final rootURL = ;

  @override
  ZanalysAPIClient apiClientFactory(
    BearerTokenProvider provider,
    RefreshTokenCallback refresh,
  ) =>
      ZanalysAPIClient(
        'https://local.zanalys.fr:8080',
        isDebug: true,
        tokenProvider: provider,
        refreshTokenCallback: refresh,
      );

  @override
  StorageService get storage => SecureStorageService();
}

class _LocalAppServices implements AppServicesProvider {
  const _LocalAppServices();
}

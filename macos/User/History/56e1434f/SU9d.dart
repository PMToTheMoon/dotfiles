import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/app_environment.dart';
import 'package:zanalys/data/network/network.dart';
import 'package:zanalys/data/storage/secure_storage_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart';

Future<void> main() async {
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

  @override
  final rootURL = 'https://local.zanalys.fr:8080';

  @override
  StorageService get storage => SecureStorageService();
}

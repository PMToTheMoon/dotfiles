import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/app_environment.dart';
import 'package:zanalys/app/app_services.dart';
import 'package:zanalys/data/storage/secure_storage_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';

void main() {
  launchApp(
      const AppData(services: _ProdAppServices(), environment: _ProdAppEnv()));
}

class _ProdAppEnv implements AppEnvironment {
  const _ProdAppEnv();

  @override
  bool get isDebugBuild => false;

  @override
  String get rootURL => 'https://my.zanalys.fr';
}

class _ProdAppServices implements AppServicesProvider {
  const _ProdAppServices();

  @override
  StorageService get storage => SecureStorageService();
}

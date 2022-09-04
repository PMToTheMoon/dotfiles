import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/app_environment.dart';
import 'package:zanalys/app/app_services_provider.dart';
import 'package:zanalys/data/network/dio_network_service.dart';
import 'package:zanalys/data/network/network_service.dart';
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
  NetworkService get network => DioNetworkService();

  @override
  StorageService get storage => SecureStorageService();
}

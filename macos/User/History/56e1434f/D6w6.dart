import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/app_environment.dart';
import 'package:zanalys/app/app_services_provider.dart';
import 'package:zanalys/data/network/dio_network_service.dart';
import 'package:zanalys/data/network/network_service.dart';
import 'package:zanalys/data/storage/secure_storage_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';

void main() {
  launchApp(const AppData(
      services: _LocalAppServices(), environment: _LocalAppEnv()));
}

class _LocalAppEnv implements AppEnvironment {
  const _LocalAppEnv();

  @override
  bool get isDebugBuild => true;

  @override
  String get rootURL => 'https://local.zanalys.fr:8080';
}

class _LocalAppServices implements AppServicesProvider {
  const _LocalAppServices();

  @override
  NetworkService get network => DioNetworkService();

  @override
  StorageService get storage => SecureStorageService();

  @override
  NavigationService get navigation => ZanalysNavigationService();
}

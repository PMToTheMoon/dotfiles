import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/app_environment.dart';
import 'package:zanalys/app/app_services_provider.dart';
import 'package:zanalys/data/network/dio_network_service.dart';
import 'package:zanalys/data/network/network_service.dart';
import 'package:zanalys/data/storage/secure_storage_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';

void main() {
  launchApp(const AppData(
      services: _QualifAppServices(), environment: _QualifAppEnv()));
}

class _QualifAppEnv implements AppEnvironment {
  const _QualifAppEnv();

  @override
  bool get isDebugBuild => true;

  @override
  String get rootURL => 'https://training.zanalys.fr';
}

class _QualifAppServices implements AppServicesProvider {
  const _QualifAppServices();

  @override
  NetworkService get network => DioNetworkService();

  @override
  StorageService get storage => SecureStorageService();

  @override
  NavigationService get navigation => ZanalysNavigationService();
}

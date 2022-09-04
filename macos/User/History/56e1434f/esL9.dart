import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/environment.dart';
import 'package:zanalys/app/services.dart';
import 'package:zanalys/authentication/authentication.dart';
import 'package:zanalys/data/storage/secure_storage_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';

Future<void> main() async {
  await launchApp(AppData(
    services: _LocalAppServices(),
    environment: const _LocalAppEnv(),
  ));
}

class _LocalAppEnv implements AppEnvironment {
  const _LocalAppEnv();

  @override
  bool get isDebugBuild => true;

  @override
  String get rootURL => 'https://local.zanalys.fr:8080';
}

class _LocalAppServices implements AppServicesProvider {
  _LocalAppServices();

  @override
  final storage = SecureStorageService();

  @override
  final authService = AuthService();
}

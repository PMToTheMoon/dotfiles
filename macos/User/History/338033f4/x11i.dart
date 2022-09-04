import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/environment.dart';
import 'package:zanalys/app/services.dart';
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

const _env = _ProdAppEnv();

class _ProdAppServices implements AppServicesProvider {
  _ProdAppServices();

  @override
  final storage = SecureStorageService();

  @override
  late final authService = AuthService(
    storage: storage,
    environment: _env,
  );

  @override
  late final userService = UserService(
    environment: _env,
    authService: authService,
  );

  @override
  late final documentService = DocumentService(
    environment: _env,
    authService: authService,
  );
}

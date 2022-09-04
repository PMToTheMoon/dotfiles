import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/environment.dart';
import 'package:zanalys/app/services.dart';

import 'package:zanalys/data/storage/secure_storage_service.dart';

import 'package:zanalys/auth/authentication.dart';
import 'package:zanalys/upload_document/upload_document.dart';
import 'package:zanalys/user/user.dart';

class _ProdAppEnv implements AppEnvironment {
  const _ProdAppEnv();

  @override
  bool get isDebugBuild => false;

  @override
  String get rootURL => 'https://my.zanalys.fr';
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

void main() {
  launchApp(AppData(
    services: _ProdAppServices(),
    environment: const _ProdAppEnv(),
  ));
}

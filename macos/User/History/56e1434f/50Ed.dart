import 'package:zanalys/app/app.dart';
import 'package:zanalys/app/environment.dart';
import 'package:zanalys/app/services.dart';
import 'package:zanalys/authentication/authentication.dart';
import 'package:zanalys/data/storage/secure_storage_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys/user/services/user_service.dart';
import 'package:zanalys/upload_document/services/document_service.dart';

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

const _env = _LocalAppEnv();
Future<void> main() async {
  await launchApp(AppData(
    services: _LocalAppServices(),
    environment: _env,
  ));
}

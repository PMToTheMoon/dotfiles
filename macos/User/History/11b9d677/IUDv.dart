import 'package:common/common.dart';
import 'package:zanalys/app/launch.dart';
import 'package:zanalys/app/environment.dart';
import 'package:zanalys/app/services.dart';
import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/storage/storage.dart';
import 'package:zanalys/upload_document/upload_document.dart';
import 'package:zanalys/user/user_service.dart';

class _QualifAppEnv implements AppEnvironment {
  const _QualifAppEnv();

  @override
  bool get isDebugBuild => true;

  @override
  String get rootURL => 'https://training.zanalys.fr';
}

const _env = _QualifAppEnv();

class _QualifAppServices implements AppServicesProvider {
  _QualifAppServices();

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
    storage: storage,
    authService: authService,
  );

  @override
  late final documentService = DocumentService(
    environment: _env,
    authService: authService,
  );

  @override
  late final avatarCacheService = AvatarCacheService(
    rootUrl: _env.rootURL,
    authProvider: authService,
  );
}

void main() {
  launchApp(AppData(
    services: _QualifAppServices(),
    environment: const _QualifAppEnv(),
  ));
}

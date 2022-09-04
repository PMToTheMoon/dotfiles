import 'package:common/common.dart';
import 'package:zanalys/app/launch.dart';
import 'package:zanalys/app/environment.dart';
import 'package:zanalys/app/services.dart';
import 'package:zanalys/doctor/doctor_service.dart';
import 'package:zanalys/patient/patient_service.dart';

import 'package:zanalys/storage/storage.dart';

import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/upload_document/upload_document.dart';
import 'package:zanalys/user/user_service.dart';

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
    getToken: () => authService.bearerToken ?? '',
  );

  @override
  late final patientService = PatientService(
    environment: _env,
    authService: authService,
  );

  @override
  late final doctorService = DoctorService(
    environment: _env,
    authService: authService,
    userService: userService,
  );

  @override
  late final recordService = RecordService(
    environment: _env,
    authService: authService,
    userService: userService,
  );
}

void main() {
  launchApp(AppData(
    services: _ProdAppServices(),
    environment: const _ProdAppEnv(),
  ));
}

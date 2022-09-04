import 'package:common/common.dart';
import 'package:get_it/get_it.dart';

import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/doctor/doctor_service.dart';
import 'package:zanalys/patient/patient_service.dart';
import 'package:zanalys/storage/storage.dart';
import 'package:zanalys/upload_document/upload_document.dart';
import 'package:zanalys/user/user_service.dart';

abstract class AppServicesProvider {
  StorageService get storage;
  AuthService get authService;
  UserService get userService;
  DocumentService get documentService;
  AvatarCacheService get avatarCacheService;
  PatientService get patientService;
  DoctorService get doctorService;
}

class AppServices {
  const AppServices._();

  static Future<void> register(AppServicesProvider provider) async {
    GetIt.instance.registerSingletonAsync<StorageService>(() async {
      StorageService storage = provider.storage;
      await storage.init();
      return storage;
    });

    GetIt.instance.registerSingletonAsync<AuthService>(
      provider.authService.init,
      dispose: (s) => s.dispose(),
      dependsOn: [StorageService],
    );

    GetIt.instance.registerSingleton<UserService>(
      provider.userService,
      dispose: (s) => s.dispose(),
    );

    GetIt.instance.registerSingleton<DocumentService>(
      provider.documentService,
    );

    GetIt.instance.registerSingleton<AvatarCacheService>(
      provider.avatarCacheService,
    );

    GetIt.instance.registerSingleton<PatientService>(
      provider.patientService,
    );

    GetIt.instance.registerSingleton<DoctorService>(
      provider.doctorService,
    );
  }

  @Deprecated('Use GetIt.instance.get<StorageService>() instead.')
  static StorageService get storage => GetIt.instance.get<StorageService>();

  @Deprecated('Use GetIt.instance.get<AuthService>() instead.')
  static AuthService get auth => GetIt.instance.get<AuthService>();

  @Deprecated('Use GetIt.instance.get<UserService>() instead.')
  static UserService get user => GetIt.instance.get<UserService>();

  @Deprecated('Use GetIt.instance.get<DocumentService>() instead.')
  static DocumentService get document => GetIt.instance.get<DocumentService>();

  static AvatarCacheService get avatar =>
      GetIt.instance.get<AvatarCacheService>();
}

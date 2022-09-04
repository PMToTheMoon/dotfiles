import 'package:get_it/get_it.dart';

import 'package:zanalys/auth/auth.dart';
import 'package:zanalys/storage/storage.dart';
import 'package:zanalys/upload_document/upload_document.dart';
import 'package:zanalys/user/user_service.dart';

abstract class AppServicesProvider {
  StorageService get storage;
  AuthService get authService;
  UserService get userService;
  DocumentService get documentService;
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
  }

  static StorageService get storage => GetIt.instance.get<StorageService>();

  static AuthService get auth => GetIt.instance.get<AuthService>();

  static UserService get user => GetIt.instance.get<UserService>();

  static DocumentService get document => GetIt.instance.get<DocumentService>();

  static DocumentService get document => GetIt.instance.get<DocumentService>();
}

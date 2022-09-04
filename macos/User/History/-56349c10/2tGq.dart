import 'package:get_it/get_it.dart';
import 'package:zanalys/authentication/services/authentication_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys/upload_document/services/document_service.dart';
import 'package:zanalys/user/services/user_service.dart';

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

    GetIt.instance.registerSingleton<AuthService>(
      provider.authService,
    );

    GetIt.instance.registerSingleton(
      provider.authService,
    );
  }

  static StorageService get storage => GetIt.instance.get<StorageService>();

  static AuthService get auth => GetIt.instance.get<AuthService>();

  static UserService get user => GetIt.instance.get<UserService>();

  static DocumentService get document => GetIt.instance.get<DocumentService>();
}

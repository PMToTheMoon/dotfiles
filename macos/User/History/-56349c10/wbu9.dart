import 'package:get_it/get_it.dart';
import 'package:zanalys/authentication/services/authentication_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';

abstract class AppServicesProvider {
  StorageService get storage;
  AutheService get authenticationRepository;
}

class AppServices {
  const AppServices._();

  static Future<void> register(AppServicesProvider provider) async {
    GetIt.instance.registerSingletonAsync<StorageService>(() async {
      StorageService storage = provider.storage;
      await storage.init();
      return storage;
    });

    GetIt.instance.registerSingleton<AutheService>(
      provider.authenticationRepository,
    );
  }

  static StorageService get storage => GetIt.instance.get<StorageService>();

  static AutheService get auth => GetIt.instance.get<AutheService>();
}

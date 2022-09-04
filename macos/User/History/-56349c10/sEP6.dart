import 'package:get_it/get_it.dart';
import 'package:zanalys/app/app_services_provider.dart';
import 'package:zanalys/data/network/network_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys/routing/navigation_service.dart';

class AppServices {
  const AppServices._();

  static Future<void> register(AppServicesProvider provider) {
    GetIt.instance
      ..registerSingletonAsync<StorageService>(() async {
        StorageService storage = provider.storage;
        await storage.init();
        return storage;
      })
      ..registerSingletonAsync<NetworkService>(() async {
        NetworkService network = provider.network;
        await network.init();
        return network;
      }, dependsOn: [StorageService])
      ..registerSingletonAsync<NavigationService>(() async {
        NavigationService navigation = provider.navigation;
        return navigation;
      });

    return GetIt.instance.allReady();
  }

  static NetworkService get network => GetIt.instance.get<NetworkService>();

  static StorageService get storage => GetIt.instance.get<StorageService>();

  static NavigationService get navigation =>
      GetIt.instance.get<NavigationService>();
}

import 'package:get_it/get_it.dart';
import 'package:zanalys/app/app_services_provider.dart';
import 'package:zanalys/data/network/network_service.dart';
import 'package:zanalys/data/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart';

class AppServices {
  const AppServices._();

  static Future<void> register(AppServicesProvider provider) {
    GetIt.instance
      ..registerSingletonAsync<StorageService>(() async {
        StorageService storage = provider.storage;
        await storage.init();
        return storage;
      })
      ..registerSingletonAsync<ZanalysAPIClient>(() async {
        ZanalysAPIClient network = provider.network;
        await network.init();
        return network;
      }, dependsOn: [StorageService]);

    return GetIt.instance.allReady();
  }

  static ZanalysAPIClient get network => GetIt.instance.get<ZanalysAPIClient>();

  static StorageService get storage => GetIt.instance.get<StorageService>();
}

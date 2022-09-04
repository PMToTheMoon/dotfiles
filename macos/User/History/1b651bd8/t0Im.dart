import 'package:zanalys/data/network/network.dart';
import 'package:zanalys/data/storage/storage_service.dart';

abstract class AppServicesProvider {
  APIClient get apiClient;

  StorageService get storage;
}

import 'package:zanalys/data/network/network.dart';
import 'package:zanalys/data/storage/storage_service.dart';

abstract class AppEnvironment {
  String get rootURL;

  bool get isDebugBuild;

  APIClient get apiClient;

  StorageService get storage;
}

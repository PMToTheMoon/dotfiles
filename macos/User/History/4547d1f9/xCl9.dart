import 'package:zanalys/data/storage/storage_service.dart';

abstract class AppEnvironment {
  String get rootURL;

  bool get isDebugBuild;

  StorageService get storage;
}

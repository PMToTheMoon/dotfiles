import 'package:zanalys/data/storage/storage_service.dart';

import 'dart:async';

abstract class AppEnvironment {
  String get rootURL;

  bool get isDebugBuild;

  StorageService get storage;
}

abstract class AppServicesInitializer {
  FutureOr<void> init();
}

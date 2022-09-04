import 'package:zanalys/data/storage/storage_service.dart';

import 'dart:async';

AppEnvironment get env => GetIt.instance<AppEnvironment>();

abstract class AppEnvironment {
  String get rootURL;

  bool get isDebugBuild;
}

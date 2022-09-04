import 'package:get_it/get_it.dart';

AppEnvironment get env => GetIt.instance<AppEnvironment>();

abstract class AppEnvironment {
  String get rootURL;

  bool get isDebugBuild;
}

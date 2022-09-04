import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'package:common/common.dart';

import 'app.dart';
import 'environment.dart';

import 'services.dart';

class AppData {
  final AppServicesProvider services;
  final AppEnvironment environment;

  const AppData({required this.services, required this.environment});
}

Future<void> launchApp(AppData data) async {
  initializeLogger();

  WidgetsFlutterBinding.ensureInitialized();

  await _registerDependencies(data);

  await Firebase.initializeApp();
  if (kDebugMode) {
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
  }
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.transparent, // status bar color
    systemNavigationBarIconBrightness: Brightness.dark,
  ));
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  runApp(const ZanalysApp());
}

/// Register GetIt environment and services singletons
Future<void> _registerDependencies(AppData data) async {
  GetIt.instance.registerSingleton<AppEnvironment>(data.environment);
  await AppServices.register(data.services);
  return GetIt.instance.allReady();
}

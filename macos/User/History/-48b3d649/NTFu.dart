import 'package:shared_preferences/shared_preferences.dart';

typedef StorageService = SharedPreferences;

Future<StorageService> initStorageService() => SharedPreferences.getInstance();

import 'package:shared_preferences/shared_preferences.dart';

typedef StorageService = SharedPreferences;

extension StorageServiceInit on SharedPreferences {
  Future<StorageService> init() => SharedPreferences.getInstance();
}

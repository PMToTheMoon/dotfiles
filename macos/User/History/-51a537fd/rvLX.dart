import 'package:shared_preferences/shared_preferences.dart';
import 'package:tech_by_tech/storage/storage_service.dart';

export 'storage_service.dart';

extension StorageServiceInit on SharedPreferences {
  Future<StorageService> init() => SharedPreferences.getInstance();
}

import 'package:tech_by_tech/storage/storage.dart';

class PreferencesRepository {
  Future<PreferencesRepository> init() async {
    _storage = await SharedPreferences.getInstance();
    return this;
  }

  late final StorageService _storage;
}

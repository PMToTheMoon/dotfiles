import 'package:tech_by_tech/storage/storage.dart';

const _kSaveCredentialsKey = 'save_credentials';

class PreferencesRepository {
  PreferencesRepository({
    required this.storageService,
  });

  final StorageService storageService;

  bool get saveCredentials =>
      storageService.getBool(_kSaveCredentialsKey) ?? false;
  Future<bool> setSaveCredentials(bool save) =>
      storageService.setBool(_kSaveCredentialsKey, save);
}

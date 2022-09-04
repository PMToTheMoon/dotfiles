import 'package:bonemeal_core/src/meta_object/meta_object.dart';

class MetaObjectRegistry {
  /// _registry of all meta object registered from all packages
  /// index by file suffix then meta object identifier
  static const _registry = <String, Map<String, MetaObject>>{};

  const MetaObjectRegistry._();

  static void register(
    String suffix,
    String key,
    MetaObject object,
  ) {
    _registry[suffix]?[key] = object;
  }

  static bool exists(String suffix, String key) =>
      _registry[suffix]?[key] != null;

  static bool isType(String suffix, String key) =>
      _registry[suffix]?[key] != null;

  static MetaObject? get(String suffix, String key) => _registry[suffix]?[key];
}

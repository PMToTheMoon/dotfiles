import 'package:bonemeal_core/src/meta_object/meta_object.dart';

class MetaObjectRegistry {
  /// _registry of all meta object registered from all packages
  /// index by file suffix then by meta object type
  static const _registry = <String, Map<Type, MetaObject>>{};

  const MetaObjectRegistry._();

  static void register(
    String suffix,
    Type key,
    MetaObject object,
  ) {
    _registry[suffix]?[key] = object;
  }

  static bool exists(String suffix, Type key) =>
      _registry[suffix]?[key] != null;

  /// return true if meta object suffix|key is of type t.
  /// return false otherwise
  static bool isType(String suffix, String key, Type t) =>
      _registry[suffix]?[key]?.isType(t) ?? false;

  static MetaObject? get(String suffix, Type key) => _registry[suffix]?[key];
}

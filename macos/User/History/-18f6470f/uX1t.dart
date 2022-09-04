import 'package:bonemeal_core/src/meta_object/meta_object.dart';

class MetaObjectRegistry {
  /// _registry of all meta object registered from all packages
  /// index by file suffix then by meta object type
  static final _registry = <String, Map<Type, MetaObject>>{};

  const MetaObjectRegistry._();

  static void register(
    String inputType,
    Type key,
    MetaObject object,
  ) {
    _registry.putIfAbsent(inputType, () => <Type, MetaObject>{})[key] = object;
  }

  static bool exists(String suffix, Type key) =>
      _registry[suffix]?[key] != null;

  static MetaObject? get(String suffix, Type key) => _registry[suffix]?[key];
}

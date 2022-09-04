import 'package:bonemeal_core/src/meta_object/meta_object.dart';

class MetaObjectRegistry {
  /// _registry of all meta object registered from all packages
  /// index by file suffix then by meta object type
  static final _registry = <String, Map<Type, MetaObject>>{};

  const MetaObjectRegistry._();

  static void register(
    String metaObjectType,
    Type key,
    MetaObject object,
  ) {
    _registry.putIfAbsent(metaObjectType, () => <Type, MetaObject>{})[key] =
        object;
  }

  static bool exists(String metaObjectType, Type key) =>
      _registry[metaObjectType]?[key] != null;

  static MetaObject get(String metaObjectType, Type key) {
    final object = _registry[metaObjectType]?[key];
    if (object == null) {
      throw ArgumentError('Meta-object $key isn\'t registered');
    }
    return object;
  }
}

import 'package:bonemeal_core/src/meta_object/meta_object.dart';

class MetaObjectRegistry {
  /// _registry of all meta object registered from all packages
  /// index by data format then by meta object type
  /// ex: _registry['yaml']['model_generator']
  static final _registry = <String, Map<String, MetaObject>>{};

  const MetaObjectRegistry._();

  static void register(
    String metaObjectType,
    String key,
    MetaObject object,
  ) {
    _registry.putIfAbsent(metaObjectType, () => <String, MetaObject>{})[key] =
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

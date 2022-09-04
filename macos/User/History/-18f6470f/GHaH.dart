import 'package:bonemeal_core/src/meta_object/meta_object.dart';

class MetaObjectRegistry {
  /// _registry of all meta object registered from all packages
  static const _registry = <String, Map<String, MetaObject>>{};

  const MetaObjectRegistry._();

  static void register(
    String prefix,
    String key,
    MetaObject object,
  ) {}
}

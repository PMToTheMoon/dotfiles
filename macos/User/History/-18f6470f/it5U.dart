import 'package:bonemeal_core/src/meta_object/meta_object.dart';

class MetaObjectRegistry {
  static const _registry = const <String, Map<String, MetaObject>>{};

  static void register() {}

  const MetaObjectRegistry._();
}

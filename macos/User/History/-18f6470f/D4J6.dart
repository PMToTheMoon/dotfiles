import 'package:bonemeal_core/src/meta_object/meta_object.dart';

class MetaObjectRegistry {
  static const _instance = MetaObjectRegistry._();

  static void register() {}

  const MetaObjectRegistry._();

  final _registry = const <String, Map<String, MetaObject>>{};
}

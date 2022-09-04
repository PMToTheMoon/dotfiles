import 'package:bonemeal_core/bonemeal_core.dart';

abstract class YamlMetaObject<T> extends MetaObject<Map<dynamic, dynamic>> {
  const YamlMetaObject() : super('yaml');
}

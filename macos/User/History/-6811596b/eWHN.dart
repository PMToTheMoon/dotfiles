import 'package:bonemeal_core/bonemeal_core.dart';

abstract class YamlMetaObject extends MetaObject<Map<dynamic, dynamic>> {
  const YamlMetaObject() : super('yaml');
}

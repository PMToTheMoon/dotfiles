import 'package:bonemeal_core/bonemeal_core.dart';

abstract class YamlMetaObject extends MetaObject<Map<dynamic, dynamic>> {
  YamlMetaObject(String key) : super('yaml', key);
}

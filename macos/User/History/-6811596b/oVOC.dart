import 'package:bonemeal_core/bonemeal_core.dart';

abstract class YamlMetaObject<T extends YamlMetaObject<dynamic>>
    extends MetaObject<Map<dynamic, dynamic>> {
  YamlMetaObject(String key) : super('yaml', key);
}

import 'package:bonemeal_core/bonemeal_core.dart';

abstract class YamlMetaObject<T> extends MetaObject<T> {
  const YamlMetaObject() : super('yaml');
}

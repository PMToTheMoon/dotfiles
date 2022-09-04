import 'package:bonemeal_core/bonemeal_core.dart';

abstract class YamlMetaObject<T> extends MetaObject<T> {
  const YamlMetaObject() : super('yaml');

  T dataFromYaml(Map input);

  @override
  T dataFrom(dynamic input) {
    if (input is Map) return dataFromYaml(input);
    throw UnimplementedError();
  }
}

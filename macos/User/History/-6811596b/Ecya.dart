import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:checked_yaml/checked_yaml.dart';

abstract class YamlMetaObject<T> extends MetaObject<T> {
  const YamlMetaObject() : super('yaml');

  T Function(Map input) get dataFactory;

  @override
  T dataFromFile(String path, String content) {
    return checkedYamlDecode(
      content,
      (json) => dataFactory(json!),
      sourceUrl: Uri.parse(path),
    );
  }
}

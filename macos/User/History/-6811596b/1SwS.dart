import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:checked_yaml/checked_yaml.dart';

abstract class YamlMetaObject<T> extends MetaObject<T> {
  const YamlMetaObject() : super('yaml');

  T dataFactory(Map input);

  @override
  T dataFromFile(String path, String content) {
    return checkedYamlDecode(
      content,
      (json) => dataFactory(json!),
      sourceUrl: Uri.parse(path),
    );
  }
}

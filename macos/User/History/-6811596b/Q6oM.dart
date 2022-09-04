import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:checked_yaml/checked_yaml.dart';

abstract class YamlMetaObject<T> extends MetaObject<T> {
  const YamlMetaObject() : super('yaml');

  T dataFromYaml(Map input);

  @override
  T dataFromFile(String path, String content) {
    return checkedYamlDecode(
      input,
      (json) => dataFromYaml(json!),
      sourceUrl: Uri.parse(path),
    );
  }
}

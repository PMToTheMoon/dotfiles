import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:checked_yaml/checked_yaml.dart';

abstract class YamlMetaObject<T> extends MetaObject<T> {
  const YamlMetaObject(this.dataFactory) : super('yaml');

  final T Function(Map input) dataFactory;

  @override
  T dataFromFile(String path, String content) {
    return checkedYamlDecode(
      content,
      (json) => dataFactory(json!),
      sourceUrl: Uri.parse(path),
    );
  }
}

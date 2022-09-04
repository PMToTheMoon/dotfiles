import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_yaml/src/meta_object/yaml_meta_object.dart';
import 'package:meta/meta.dart';
import 'package:checked_yaml/checked_yaml.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
class YamlGenerator<T extends YamlMetaObject<dynamic>> extends Generator {
  YamlGenerator(String key)
      : assert(MetaObjectRegistry.isType('yaml', key, Map<dynamic, dynamic>)),
        _root = MetaObjectRegistry.get('yaml', key)
            as MetaObject<Map<dynamic, dynamic>>;

  final MetaObject<Map<dynamic, dynamic>> _root;

  @override
  @nonVirtual
  FutureOr<void> build(BuildStep step) async {
    for (final id in step.inputs) {
      final input = await step.readAsString(id);
      final map = checkedYamlDecode(
        input,
        (json) => json!,
        sourceUrl: Uri.parse(id.path),
      );
      await step.buildMetaObject(_root, id, map);
    }
  }
}

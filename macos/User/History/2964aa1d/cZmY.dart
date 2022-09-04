import 'dart:async';

import 'package:meta/meta.dart';
import 'package:checked_yaml/checked_yaml.dart';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_yaml/src/meta_object/yaml_meta_object.dart';

/// ! Only needed for generator that use a specific file name (other tha .yaml)
///
/// A generator that used source file content to determine
/// what meta_object generator should run on it
class YamlGenerator<Obj extends YamlMetaObject, Data> extends Generator {
  YamlGenerator(this.factory)
      : assert(MetaObjectRegistry.exists('yaml', Obj)),
        _root = MetaObjectRegistry.get('yaml', Obj) as YamlMetaObject<Data>;

  final MetaObject<Data> _root;
  final Data Function(Map) factory;

  @override
  @nonVirtual
  FutureOr<void> build(BuildStep step) async {
    for (final id in step.inputs) {
      final input = await step.readAsString(id);
      final data = checkedYamlDecode(
        input,
        (json) => factory(json!),
        sourceUrl: Uri.parse(id.path),
      );
      await step.buildMetaObject(_root, id, data);
    }
  }
}

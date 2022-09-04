import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:checked_yaml/checked_yaml.dart';


import 'dart:async';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:meta/meta.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
class YamlGenerator extends Generator {
  YamlGenerator(String key, {
    String suffix = '.yaml',
  })
      : assert(MetaObjectRegistry.isType('yaml', key, )),
        _root = MetaObjectRegistry.get('.yaml', key) as MetaObject<Map<dynamic, dynamic>>;

  final MetaObject<Map<dynamic, dynamic>> _root;

  @override
  @nonVirtual
  FutureOr<void> build(BuildStep step) async {
    for (final id in step.inputs) {
      final input = await step.readAsString(id);
      step.buildMetaObject(object, source, )
    }
  }
}

abstract class YamlMetaObjecGenerator<T> implements MetaObjectGenerator {
  T metaObjectFromJson(Map<dynamic, dynamic> json);

  FutureOr<void> buildObject(BuildStep step, T metaObject);

  @override
  FutureOr<void> build(BuildStep step, AssetId id, String input) {
    final metaObject = checkedYamlDecode(
      input,
      (json) => metaObjectFromJson(json!),
      sourceUrl: Uri.parse(id.path),
    );
    return buildObject(step, metaObject);
  }
}

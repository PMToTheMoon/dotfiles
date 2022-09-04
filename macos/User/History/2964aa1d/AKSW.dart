import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:meta/meta.dart';
import 'package:checked_yaml/checked_yaml.dart';

import 'package:bonemeal_core/bonemeal_core.dart';

/// A generator that used source file content to determine
/// what meta_object generator should run on it
class YamlGenerator<O extends YamlMetaObject, D> extends Generator {
  YamlGenerator(this.factory);

  final D Function(Map) factory;

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
      await step.buildMetaObject(metaObject, id, data);
    }
  }
}

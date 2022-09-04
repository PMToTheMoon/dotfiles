import 'dart:async';

import 'package:meta/meta.dart';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_yaml/src/meta_object/yaml_meta_object.dart';

/// ! Only needed for generator that use a specific file name (other tha .yaml)
///
/// A generator that used source file content to determine
/// what meta_object generator should run on it
class YamlMetaObjectWrapperGenerator<Obj extends YamlMetaObject> extends Generator {
  YamlGenerator(this._root);

  final YamlMetaObject _root;

  @override
  @nonVirtual
  FutureOr<void> build(BuildStep step) async {
    for (final id in step.inputs) {
      await step.buildMetaObjectFromAsset(_root, id);
    }
  }
}

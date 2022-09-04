import 'dart:async';

import 'package:meta/meta.dart';

import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_yaml/src/meta_object/yaml_meta_object.dart';

/// A generator that use delegate the generation to a given meta-object.
class MetaObjectWrapperGenerator<Obj extends YamlMetaObject> extends Generator {
  MetaObjectWrapperGenerator(this._root);

  final YamlMetaObject _root;

  @override
  @nonVirtual
  FutureOr<void> build(BuildStep step) async {
    for (final id in step.inputs) {
      await step.buildMetaObjectFromAsset(_root, id);
    }
  }
}

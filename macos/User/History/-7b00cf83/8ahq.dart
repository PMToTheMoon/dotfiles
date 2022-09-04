import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal_yaml/src/utils/utils.dart';

ContentBasedGenerator contentBasedGeneratorFactory(GeneratorOptions options) =>
    ContentBasedGenerator();

/// A generator that runs on every yaml file and dynamically delegate the
/// generation to appropriate meta-object, if found.
///
/// Yaml should respect the [loadYamlWithHeader] format and declare a valid yaml
/// meta-object type - otherwise they will be ignored.
class ContentBasedGenerator extends Generator {
  @override
  Future<void> build(BuildStep step) async {
    for (final id in step.inputs) {
      final yaml = await step.readAsString(id);
      try {
        final yamlWithHeader = loadYamlWithHeader(yaml);
        final object =
            MetaObjectRegistry.get('yaml', yamlWithHeader.header.type);
        await step.buildMetaObjectFromData(
          object,
          id,
          yamlWithHeader.body,
        );
      } catch (e) {
        continue;
      }
    }
  }
}

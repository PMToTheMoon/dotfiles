import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal_yaml/src/utils/utils.dart';

/// A generator that runs on every yaml file and dynamically delagate the generation to appropriate meta-object
///
///  appropriate
/// meta-object based
class YamlContentBasedGenerator extends Generator {
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

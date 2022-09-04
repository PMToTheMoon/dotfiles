import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal_yaml/src/utils/utils.dart';

class ContentBasedYamlGenerator extends Generator {
  @override
  Future<void> build(BuildStep step) async {
    for (final id in step.inputs) {
      try {
        final yaml = await step.readAsString(id);
        final yamlWithHeader = loadYamlWithHeader(yaml);
        final object =
            MetaObjectRegistry.get('yaml', yamlWithHeader.header.type);
        step.buildMetaObjectFromData(object, id, yamlWithHeader.body);
      } catch (e) {
        continue;
      }
    }
    throw UnimplementedError();
  }
}

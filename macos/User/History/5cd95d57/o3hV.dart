import 'package:bonemeal_core/src/generator/generator.dart';
import 'package:bonemeal_core/src/environment/build_environment.dart';

class BuildDefinition {
  static Future<BuildDefinition> prepareWorkspace(
    BuildEnvironment environment,
    GeneratorOptions options,
  ) =>
      _Loader(environment, options, buildPhases).prepareWorkspace();
}

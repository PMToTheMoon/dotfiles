import 'package:bonemeal_core/src/generator/generator.dart';

class BuildDefinition {
  static Future<BuildDefinition> prepareWorkspace(BuildEnvironment environment,
          GeneratorOptions options, List<BuildPhase> buildPhases) =>
      _Loader(environment, options, buildPhases).prepareWorkspace();
}

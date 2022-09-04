import 'options.dart';

class BuildRunner {
  static Future<BuildRunner> create(
      GeneratorOptions options,
      BuildEnvironment environment,
      List<BuilderApplication> builders,
      Map<String, Map<String, dynamic>> builderConfigOverrides,
      {bool isReleaseBuild = false}) async {}
}

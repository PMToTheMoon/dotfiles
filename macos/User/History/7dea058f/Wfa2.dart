import 'package:file/file.dart';
import 'package:path/path.dart' as p;

import 'build_target.dart';

export 'input_set.dart';
export 'build_target.dart';

class BuildConfig {
  BuildConfig({
    required this.buildTargets,
  });

  /// Returns a parsed [BuildConfig] file in [path], if one exists, otherwise a
  /// default config.
  ///
  /// [path] should the path to a directory which may contain a `build.yaml`.
  static Future<BuildConfig> fromBuildConfigDir(
      String packageName, Iterable<String> dependencies, String path) async {
    final configPath = path.join(path, 'build.yaml');
    final file = File(configPath);
    if (await file.exists()) {
      return BuildConfig.parse(
        packageName,
        dependencies,
        await file.readAsString(),
        configYamlPath: file.path,
      );
    } else {
      return BuildConfig.useDefault(packageName, dependencies);
    }
  }

  final Map<String, BuildTarget> buildTargets;
}

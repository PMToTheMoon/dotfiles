import 'dart:io';
import 'package:checked_yaml/checked_yaml.dart';
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
    final configPath = p.join(path, 'build.yaml');
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

  /// Create a [BuildConfig] by parsing [configYaml].
  ///
  /// If [configYamlPath] is passed, it's used as the URL from which
  /// [configYaml] for error reporting.
  factory BuildConfig.parse(
    String packageName,
    Iterable<String> dependencies,
    String configYaml, {
    String? configYamlPath,
  }) {
    try {
      return checkedYamlDecode(
        configYaml,
        (map) =>
            BuildConfig.fromMap(packageName, dependencies, map ?? const {}),
        allowNull: true,
        sourceUrl: configYamlPath == null ? null : Uri.file(configYamlPath),
      );
    } on ParsedYamlException catch (e) {
      throw ArgumentError(e.formattedMessage);
    }
  }

  /// Create a [BuildConfig] read a map which was already parsed.
  factory BuildConfig.fromMap(
      String packageName, Iterable<String> dependencies, Map config) {
    return runInBuildConfigZone(() => BuildConfig._fromJson(config),
        packageName, dependencies.toList());
  }

  final Map<String, BuildTarget> buildTargets;
}

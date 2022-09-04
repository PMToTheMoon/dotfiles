import 'dart:io';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:path/path.dart' as p;

import 'build_target.dart';
import 'common.dart';

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

  /// The default config if you have no `build.yaml` file.
  factory BuildConfig.useDefault(
      String packageName, Iterable<String> dependencies) {
    return runInBuildConfigZone(() {
      final key = '$packageName:$packageName';
      final target = BuildTarget(
        dependencies: dependencies
            .map((dep) => normalizeTargetKeyUsage(dep, packageName))
            .toList(),
        sources: InputSet.anything,
      );
      return BuildConfig(
        packageName: packageName,
        buildTargets: {key: target},
        globalOptions: {},
      );
    }, packageName, dependencies.toList());
  }

  BuildConfig({
    String? packageName,
    required Map<String, BuildTarget> buildTargets,
    Map<String, GlobalBuilderConfig>? globalOptions,
    Map<String, BuilderDefinition>? builderDefinitions,
    Map<String, PostProcessBuilderDefinition>? postProcessBuilderDefinitions =
        const {},
    this.additionalPublicAssets = const [],
  })  : buildTargets =
            identical(buildTargets, BuildConfig._placeholderBuildTarget)
                ? {
                    _defaultTarget(packageName ?? currentPackage): BuildTarget(
                      dependencies: currentPackageDefaultDependencies,
                    )
                  }
                : buildTargets,
        globalOptions = (globalOptions ?? const {}).map((key, config) =>
            MapEntry(normalizeBuilderKeyUsage(key, currentPackage), config)),
        builderDefinitions = _normalizeBuilderDefinitions(
            builderDefinitions ?? const {}, packageName ?? currentPackage),
        postProcessBuilderDefinitions = _normalizeBuilderDefinitions(
            postProcessBuilderDefinitions ?? const {},
            packageName ?? currentPackage),
        packageName = packageName ?? currentPackage {
    // Set up the expandos for all our build targets and definitions so they
    // can know which package and builder key they refer to.
    this.buildTargets.forEach((key, target) {
      packageExpando[target] = this.packageName;
      builderKeyExpando[target] = key;
    });
    this.builderDefinitions.forEach((key, definition) {
      packageExpando[definition] = this.packageName;
      builderKeyExpando[definition] = key;
    });
    this.postProcessBuilderDefinitions.forEach((key, definition) {
      packageExpando[definition] = this.packageName;
      builderKeyExpando[definition] = key;
    });
  }

  factory BuildConfig._fromJson(Map json) => _$BuildConfigFromJson(json);
}

  final Map<String, BuildTarget> buildTargets;
}

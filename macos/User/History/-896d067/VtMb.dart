import 'dart:async';
import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;

part 'bonemeal_config.g.dart';

@JsonSerializable()
class BonemealConfig {
  /// Returns a parsed [BuildConfig] file in [path], if one exists, otherwise a
  /// default config.
  ///
  /// [path] should the path to a directory which may contain a `bonemeal.yaml`.
  static Future<BonemealConfig> fromBuildConfigDir(
      String packageName, Iterable<String> dependencies, String path) async {
    final configPath = p.join(path, 'bonemeal.yaml');
    final file = File(configPath);
    if (await file.exists()) {
      return BonemealConfig.parse(
        packageName,
        await file.readAsString(),
        configYamlPath: file.path,
      );
    } else {
      return BonemealConfig.useDefault(packageName);
    }
  }

  // Generator output directory path
  final String? target;

  /// Global bonemeal config
  @JsonKey(name: 'bonemeal')
  final GlobalBonemealConfig globalConfig;

  // final Map<String, GlobalBuilderConfig> globalOptions;

  /// The default config if you have no `bonemeal` file.
  factory BonemealConfig.useDefault() {
    return BonemealConfig();
  }

  /// Create a [BonemealConfig] by parsing [configYaml].
  ///
  /// If [configYamlPath] is passed, it's used as the URL from which
  /// [configYaml] for error reporting.
  factory BonemealConfig.parse(
    String packageName,
    String configYaml, {
    String? configYamlPath,
  }) {
    try {
      return checkedYamlDecode(
        configYaml,
        (map) => BonemealConfig.fromMap(map ?? const {}),
        allowNull: true,
        sourceUrl: configYamlPath == null ? null : Uri.file(configYamlPath),
      );
    } on ParsedYamlException catch (e) {
      throw ArgumentError(e.formattedMessage);
    }
  }

  /// Create a [BonemealConfig] read a map which was already parsed.
  factory BonemealConfig.fromMap(Map config) {
    return BonemealConfig._fromJson(config);
  }

  BonemealConfig({
    this.target,
    GlobalBonemealConfig? globalConfig,
  }) : globalConfig = globalConfig ?? GlobalBonemealConfig();

  factory BonemealConfig._fromJson(Map json) => _$BonemealConfigFromJson(json);
}

@JsonSerializable()
class GlobalBonemealConfig {
  /// Create [GlobalBonemealConfig] with sane default
  GlobalBonemealConfig();

  factory GlobalBonemealConfig.fromJson(Map json) =>
      _$GlobalBonemealConfigFromJson(json);
}

import 'dart:io';

import 'package:bonemeal/src/config/exceptions.dart';
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
  static Future<BonemealConfig> fromRoot() async {
    final path = p.current;
    final configPath = p.join(path, 'bonemeal.yaml');
    final file = File(configPath);
    if (await file.exists()) {
      try {
        return BonemealConfig.parse(
          await file.readAsString(),
          configYamlPath: file.path,
        );
      } catch (e) {
        throw InvalidConfigFile(e.toString());
      }
    } else {
      throw ConfigFileNotFound(path);
    }
  }

  /// Create a [BonemealConfig] by parsing [configYaml].
  ///
  /// If [configYamlPath] is passed, it's used as the URL from which
  /// [configYaml] for error reporting.
  factory BonemealConfig.parse(
    String configYaml, {
    String? configYamlPath,
  }) {
    try {
      return checkedYamlDecode(
        configYaml,
        (map) => BonemealConfig.fromJson(map ?? const {}),
        allowNull: true,
        sourceUrl: configYamlPath == null ? null : Uri.file(configYamlPath),
      );
    } on ParsedYamlException catch (e) {
      throw ArgumentError(e.formattedMessage);
    }
  }

  const BonemealConfig({
    required this.outputDir,
  });

  final String outputDir;

  factory BonemealConfig.fromJson(Map json) => _$BonemealConfigFromJson(json);
}

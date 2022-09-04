import 'package:json_annotation/json_annotation.dart';

part 'bonemeal_config.g.dart';

@JsonSerializable()
class BonemealConfig {
  /// Returns a parsed [BuildConfig] file in [path], if one exists, otherwise a
  /// default config.
  ///
  /// [path] should the path to a directory which may contain a `bonemeal.yaml`.
  static Future<BonemealConfig> fromBuildConfigDir(String path) async {
    final configPath = p.join(path, 'bonemeal.yaml');
    final file = File(configPath);
    if (await file.exists()) {
      return BonemealConfig.parse(
        await file.readAsString(),
        configYamlPath: file.path,
      );
    } else {
      return BonemealConfig.useDefault();
    }
  }

  const BonemealConfig({
    required this.outputDir,
  });

  final String outputDir;

  factory BonemealConfig.fromJson(Map<String, dynamic> json) =>
      _$BonemealConfigFromJson(json);
}

import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'generator_definition.dart';

import 'common.dart';
import 'key_normalization.dart';

part 'bonemeal_config.g.dart';

@JsonSerializable()
class BonemealConfig {
  @JsonKey(ignore: true)
  final String packageName;

  /// All the `builders` defined in a `build.yaml` file.
  @JsonKey(name: 'generators')
  final Map<String, GeneratorDefinition> generatorDefinitions;

  // final Map<String, GlobalBuilderConfig> globalOptions;

  /// The default config if you have no `build.yaml` file.
  factory BonemealConfig.useDefault(
      String packageName, Iterable<String> dependencies) {
    return runInBuildConfigZone(() {
      final key = '$packageName:$packageName';

      return BonemealConfig(
        packageName: packageName,
        // globalOptions: {},
      );
    }, packageName, dependencies.toList());
  }

  /// Create a [BonemealConfig] by parsing [configYaml].
  ///
  /// If [configYamlPath] is passed, it's used as the URL from which
  /// [configYaml] for error reporting.
  factory BonemealConfig.parse(
    String packageName,
    Iterable<String> dependencies,
    String configYaml, {
    String? configYamlPath,
  }) {
    try {
      return checkedYamlDecode(
        configYaml,
        (map) =>
            BonemealConfig.fromMap(packageName, dependencies, map ?? const {}),
        allowNull: true,
        sourceUrl: configYamlPath == null ? null : Uri.file(configYamlPath),
      );
    } on ParsedYamlException catch (e) {
      throw ArgumentError(e.formattedMessage);
    }
  }

  /// Create a [BonemealConfig] read a map which was already parsed.
  factory BonemealConfig.fromMap(
      String packageName, Iterable<String> dependencies, Map config) {
    return runInBuildConfigZone(() => BonemealConfig._fromJson(config),
        packageName, dependencies.toList());
  }

  BonemealConfig({
    String? packageName,
    Map<String, GeneratorDefinition>? generatorDefinitions,
  })  : packageName = packageName ?? currentPackage,
        generatorDefinitions = _normalizeGeneratorDefinitions(
            generatorDefinitions ?? const {}, packageName ?? currentPackage) {
    this.generatorDefinitions.forEach((key, definition) {
      packageExpando[definition] = this.packageName;
      builderKeyExpando[definition] = key;
    });
  }

  factory BonemealConfig._fromJson(Map json) => _$BonemealConfigFromJson(json);
}

Map<String, T> _normalizeGeneratorDefinitions<T>(
        Map<String, T> builderDefinitions, String packageName) =>
    builderDefinitions.map((key, definition) => MapEntry(
        normalizeGeneratorKeyDefinition(key, packageName), definition));

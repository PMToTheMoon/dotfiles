import 'dart:async';
import 'dart:io';

import 'package:bonemeal_config/src/exceptions.dart';
import 'package:bonemeal_config/src/meta_object_definition.dart';
import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:pubspec_parse/pubspec_parse.dart';
import 'package:path/path.dart' as p;

import 'common.dart';
import 'key_normalization.dart';
import 'expandos.dart';
import 'generator_definition.dart';

part 'bonemeal_config.g.dart';

@JsonSerializable()
class BonemealConfig {
  /// Returns a parsed [BuildConfig] file in [path], if one exist, otherwise a
  /// default config.
  ///
  /// [path] must be a directory which contains a `pubspec.yaml` file and
  /// optionally a `bonemeal.yaml`.
  static Future<BonemealConfig> fromPackageDir(String path) async {
    final pubspec = await _fromPackageDir(path);
    return fromBuildConfigDir(pubspec.name, pubspec.dependencies.keys, path);
  }

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
        dependencies,
        await file.readAsString(),
        configYamlPath: file.path,
      );
    }
    throw const InvalidConfigException('bonemeal.yaml file does not exists.');
  }

  @JsonKey(ignore: true)
  final String packageName;

  // Generator output directory path
  final String target;

  /// All the `builders` defined in a `bonemeal.yaml` file.
  @JsonKey(name: 'generators')
  final Map<String, GeneratorDefinition> generatorDefinitions;

  @JsonKey(name: 'meta_objects')
  final Map<String, MetaObjectDefinition> metaObjectDefinitions;

  /// Global bonemeal config
  @JsonKey(name: 'bonemeal')
  final GlobalBonemealConfig globalConfig;

  // final Map<String, GlobalBuilderConfig> globalOptions;

  /// The default config if you have no `bonemeal` file.
  factory BonemealConfig.useDefault(
    String target,
    String packageName,
    Iterable<String> dependencies,
  ) {
    return runInBuildConfigZone(() {
      final key = '$packageName:$packageName';

      return BonemealConfig(
        packageName: packageName,
        target: target,
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
    required this.target,
    Map<String, GeneratorDefinition>? generatorDefinitions,
    Map<String, MetaObjectDefinition>? metaObjectDefinitions,
    GlobalBonemealConfig? globalConfig,
  })  : packageName = packageName ?? currentPackage,
        globalConfig = globalConfig ?? GlobalBonemealConfig(),
        generatorDefinitions = _normalizeGeneratorDefinitions(
          generatorDefinitions ?? const {},
          packageName ?? currentPackage,
        ),
        metaObjectDefinitions = metaObjectDefinitions ?? const {} {
    // Set up the expandos for all our meta objects definitions so they
    // can know which package and builder key they refer to.
    this.metaObjectDefinitions.forEach((key, definition) {
      packageExpando[definition] = this.packageName;
      metaObjectKeyExpando[definition] = key;
    });

    // Set up the expandos for all our generator definitions so they
    // can know which package and builder key they refer to.
    this.generatorDefinitions.forEach((key, definition) {
      packageExpando[definition] = this.packageName;
      generatorKeyExpando[definition] = key;
    });
  }

  factory BonemealConfig._fromJson(Map json) => _$BonemealConfigFromJson(json);
}

Map<String, T> _normalizeGeneratorDefinitions<T>(
        Map<String, T> builderDefinitions, String packageName) =>
    builderDefinitions.map((key, definition) => MapEntry(
        normalizeGeneratorKeyDefinition(key, packageName), definition));

Future<Pubspec> _fromPackageDir(String path) async {
  final pubspec = p.join(path, 'pubspec.yaml');
  final file = File(pubspec);
  if (await file.exists()) {
    return Pubspec.parse(await file.readAsString());
  }
  throw FileSystemException('No file found', p.absolute(pubspec));
}

@JsonSerializable()
class GlobalBonemealConfig {
  final Map<String, GeneratorConfig> generators;

  final Map<String, MetaObjectConfig> metaObjects;

  /// Create [GlobalBonemealConfig] with sane default
  GlobalBonemealConfig({
    Map<String, GeneratorConfig>? generators,
    Map<String, MetaObjectConfig>? metaObjects,
  })  : generators = generators?.map((key, value) => MapEntry(
                normalizeGeneratorKeyUsage(key, currentPackage), value)) ??
            const {},
        metaObjects = metaObjects ?? const {};

  factory GlobalBonemealConfig.fromJson(Map json) =>
      _$GlobalBonemealConfigFromJson(json);
}

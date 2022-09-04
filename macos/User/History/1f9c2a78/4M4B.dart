// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';
import 'dart:io';

import 'package:checked_yaml/checked_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:path/path.dart' as p;
import 'package:pubspec_parse/pubspec_parse.dart';

import 'build_target.dart';
import 'generator_definition.dart';
import 'common.dart';
import 'expandos.dart';
import 'input_set.dart';
import 'key_normalization.dart';

part 'bonemeal_config.g.dart';

/// The parsed values from a `build.yaml` file.
@JsonSerializable()
class BonemealConfig {
  /// Returns a parsed [BonemealConfig] file in [path], if one exist, otherwise a
  /// default config.
  ///
  /// [path] must be a directory which contains a `pubspec.yaml` file and
  /// optionally a `build.yaml`.
  static Future<BonemealConfig> fromPackageDir(String path) async {
    final pubspec = await _fromPackageDir(path);
    return fromBuildConfigDir(pubspec.name, pubspec.dependencies.keys, path);
  }

  /// Returns a parsed [BonemealConfig] file in [path], if one exists, otherwise a
  /// default config.
  ///
  /// [path] should be the path to a directory which may contain a `bonemeal.yaml`.
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
    } else {
      return BonemealConfig.useDefault(packageName, dependencies);
    }
  }

  @JsonKey(ignore: true)
  final String packageName;

  /// All the `generators` defined in a `bonemeal.yaml` file.
  @JsonKey(name: 'generators')
  final Map<String, GeneratorDefinition> generatorDefinitions;

  /// All the `targets` defined in a `bonemeal.yaml` file.
  @JsonKey(name: 'targets', fromJson: _buildTargetsFromJson)
  final Map<String, BuildTarget> buildTargets;

  final String myKey;

  /// Used to represent no build target supplied, returned from
  /// [_buildTargetsFromJson].
  static final _placeholderBuildTarget = <String, BuildTarget>{};

  final Map<String, GlobalBonemealConfig> globalOptions;

  final List<String> additionalPublicAssets;

  /// The default config if you have no `build.yaml` file.
  factory BonemealConfig.useDefault(
      String packageName, Iterable<String> dependencies) {
    return runInBuildConfigZone(() {
      final key = '$packageName:$packageName';
      final target = BuildTarget(
        dependencies: dependencies
            .map((dep) => normalizeTargetKeyUsage(dep, packageName))
            .toList(),
        sources: InputSet.anything,
      );
      return BonemealConfig(
        packageName: packageName,
        buildTargets: {key: target},
        globalOptions: {},
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
    this.myKey,
    String? packageName,
    required Map<String, BuildTarget> buildTargets,
    Map<String, GlobalBonemealConfig>? globalOptions,
    Map<String, GeneratorDefinition>? builderDefinitions,
    this.additionalPublicAssets = const [],
  })  : buildTargets =
            identical(buildTargets, BonemealConfig._placeholderBuildTarget)
                ? {
                    _defaultTarget(packageName ?? currentPackage): BuildTarget(
                      dependencies: currentPackageDefaultDependencies,
                    )
                  }
                : buildTargets,
        globalOptions = (globalOptions ?? const {}).map((key, config) =>
            MapEntry(normalizeBuilderKeyUsage(key, currentPackage), config)),
        generatorDefinitions = _normalizeBuilderDefinitions(
            builderDefinitions ?? const {}, packageName ?? currentPackage),
        packageName = packageName ?? currentPackage {
    // Set up the expandos for all our build targets and definitions so they
    // can know which package and builder key they refer to.
    this.buildTargets.forEach((key, target) {
      packageExpando[target] = this.packageName;
      generatorKeyExpando[target] = key;
    });
    this.generatorDefinitions.forEach((key, definition) {
      packageExpando[definition] = this.packageName;
      generatorKeyExpando[definition] = key;
    });
  }

  factory BonemealConfig._fromJson(Map json) => _$BonemealConfigFromJson(json);
}

String _defaultTarget(String package) => '$package:$package';

Map<String, T> _normalizeBuilderDefinitions<T>(
        Map<String, T> builderDefinitions, String packageName) =>
    builderDefinitions.map((key, definition) =>
        MapEntry(normalizeBuilderKeyDefinition(key, packageName), definition));

Map<String, BuildTarget> _buildTargetsFromJson(Map? json) {
  if (json == null) {
    return BonemealConfig._placeholderBuildTarget;
  }
  var targets = json.map((key, target) => MapEntry(
      normalizeTargetKeyDefinition(key as String, currentPackage),
      BuildTarget.fromJson(target as Map)));

  if (!targets.containsKey(_defaultTarget(currentPackage))) {
    throw ArgumentError('Must specify a target with the name '
        '`$currentPackage` or `\$default`.');
  }

  return targets;
}

Future<Pubspec> _fromPackageDir(String path) async {
  final pubspec = p.join(path, 'pubspec.yaml');
  final file = File(pubspec);
  if (await file.exists()) {
    return Pubspec.parse(await file.readAsString());
  }
  throw FileSystemException('No file found', p.absolute(pubspec));
}

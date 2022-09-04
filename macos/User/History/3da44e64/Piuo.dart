// Copyright (c) 2017, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:async';

import 'package:analyzer/dart/analysis/features.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:bonemeal_core/bonemeal_core.dart';
import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_runner/src/asset/file_based.dart';
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';
import 'package:graphs/graphs.dart';
import 'package:logging/logging.dart';
import 'package:package_config/package_config.dart' show LanguageVersion;
import 'package:path/path.dart' as p;
import 'package:pub_semver/pub_semver.dart';

import 'package:bonemeal_runner/src/generate/exceptions.dart';
import 'package:bonemeal_runner/src/package_graph/package_graph.dart';
import 'package:bonemeal_runner/src/utils/constants.dart';
import 'package:bonemeal_runner/src/logging/logging.dart';

// import 'package:bonemeal_config/bonemeal_config.dart';

import 'builder_ordering.dart';

const scriptLocation = '$entryPointDir/bonemeal_build.dart';
const scriptKernelLocation = '$scriptLocation$scriptKernelSuffix';
const scriptKernelSuffix = '.dill';
const scriptKernelCachedLocation =
    '$scriptKernelLocation$scriptKernelCachedSuffix';
const scriptKernelCachedSuffix = '.cached';

final _log = Logger('Entrypoint');

Future<String> generateBuildScript() =>
    logTimedAsync(_log, 'Generating build script', _generateBuildScript);

Future<String> _generateBuildScript() async {
  final info = await findBuildScriptOptions();

  final library = Library((b) => b.body.addAll([
        literalList(
                info.generatorApplications,
                info.generatorApplications,
                refer('GeneratorApplication',
                    'package:bonemeal_runner/bonemeal_runner.dart'))
            .assignFinal('_generators')
            .statement,
        _main()
      ]));
  final emitter = DartEmitter(
      allocator: Allocator.simplePrefixing(),
      useNullSafetySyntax: info.canRunWithSoundNullSafety);
  try {
    final content = StringBuffer();
    if (!info.canRunWithSoundNullSafety) {
      content.writeln('''
        // Ensure that the build script itself is not opted in to null safety,
        // instead of taking the language version from the current package.
        //
        // @dart=2.9
        //''');
    }
    content
      ..writeln('// ignore_for_file: directives_ordering')
      ..writeln(
          '// ignore_for_file: no_leading_underscores_for_library_prefixes')
      ..writeln(library.accept(emitter));

    return DartFormatter().format(content.toString());
  } on FormatterException {
    _log.severe('Generated build script could not be parsed.\n'
        'This is likely caused by a misconfigured builder definition.');
    throw CannotBuildException();
  }
}

Future<BuildScriptInfo> findBuildScriptOptions() async {
  final packageGraph = await PackageGraph.forThisPackage();
  final orderedPackages = stronglyConnectedComponents<PackageNode>(
    [packageGraph.root],
    (node) => node.dependencies,
    equals: (a, b) => a.name == b.name,
    hashCode: (n) => n.name.hashCode,
  ).expand((c) => c);
  var reader = FileBasedAssetReader(packageGraph);
  Future<BonemealConfig> _packageBuildConfig(PackageNode package) async {
    try {
      return await BonemealConfig.fromBuildConfigDir(
          package.name, package.dependencies.map((n) => n.name), package.path);
    } on ArgumentError catch (e) {
      _log.severe(e.message);
      return BonemealConfig.useDefault(
          package.name, package.dependencies.map((n) => n.name));
    }
  }

  bool _isValidDefinition(dynamic definition) {
    // Filter out generatorDefinitions with relative imports that aren't
    // from the root package, because they will never work.
    if (definition.import.startsWith('package:') as bool) return true;
    return definition.package == packageGraph.root.name;
  }

  final orderedConfigs =
      await Future.wait(orderedPackages.map(_packageBuildConfig));
  final generatorDefinitions = orderedConfigs
      .expand((c) => c.generatorDefinitions.values)
      .where(_isValidDefinition);
  final metaObjectDefinitions = orderedConfigs
      .expand((c) => c.metaObjectDefinitions.values)
      .where(_isValidDefinition);

  final orderedBuilders = findBuilderOrder(generatorDefinitions).toList();

  final metaObjectApplications = [
    for (var def in metaObjectDefinitions) _applyMetaObject(def),
  ];

  final generatorApplications = [
    for (var builder in orderedBuilders) _applyBuilder(builder),
  ];

  final canRunWithSoundNullSafety = await _allMigratedToNullSafety(
      packageGraph, reader, orderedBuilders.map((e) => e.import));

  return BuildScriptInfo(
    generatorApplications: generatorApplications,
    metaObjectApplications: metaObjectApplications,
    canRunWithSoundNullSafety: canRunWithSoundNullSafety,
  );
}

Future<bool> _allMigratedToNullSafety(PackageGraph packageGraph,
    AssetReader reader, Iterable<String> imports) async {
  final baseForRelative = AssetId.input(scriptLocation);

  // Regardless of imports, the root package must have support for null safety
  // since the build script will run in its context.
  final rootPackageVersion = packageGraph.root.languageVersion;
  if (rootPackageVersion == null) return false;
  final rootPackageFeatures = FeatureSet.fromEnableFlags2(
      sdkLanguageVersion: rootPackageVersion.asVersion, flags: const []);
  if (!rootPackageFeatures.isEnabled(Feature.non_nullable)) {
    return false;
  }

  for (final import in imports.toSet()) {
    final id = AssetId.resolve(Uri.parse(_buildScriptImport(import)),
        from: baseForRelative);
    String content;
    try {
      content = await reader.readAsString(id);
    } on AssetNotFoundException {
      // Build is likely to be invalid, so the language version shouldn't
      // matter. Still, don't assume null safety.
      return false;
    }

    final parsedFile = parseString(
      content: content,
      throwIfDiagnostics: false,
    );
    if (parsedFile.errors.isNotEmpty) {
      // Don't try to assume a language version if the imported file is invalid
      return false;
    }

    if (!parsedFile.unit.featureSet.isEnabled(Feature.non_nullable)) {
      // An import does not support null-safety, so the build script can't opt
      // in either.
      return false;
    }
  }

  return true;
}

class BuildScriptInfo {
  final Iterable<Expression> generatorApplications;
  final Iterable<Expression> metaObjectApplications;
  final bool canRunWithSoundNullSafety;

  BuildScriptInfo({
    required this.generatorApplications,
    required this.metaObjectApplications,
    required this.canRunWithSoundNullSafety,
  });
}

/// A method forwarding to `run`.
Method _main() => Method((b) => b
  ..name = 'main'
  ..returns = refer('void')
  ..modifier = MethodModifier.async
  ..requiredParameters.add(Parameter((b) => b
    ..name = 'args'
    ..type = TypeReference((b) => b
      ..symbol = 'List'
      ..types.add(refer('String')))))
  ..optionalParameters.add(Parameter((b) => b
    ..name = 'sendPort'
    ..type = TypeReference((b) => b
      ..symbol = 'SendPort'
      ..url = 'dart:isolate'
      ..isNullable = true)))
  ..body = Block.of([
    refer('run', 'package:bonemeal_runner/bonemeal_runner.dart')
        .call([refer('args'), refer('_generators')])
        .awaited
        .assignVar('result')
        .statement,
    refer('sendPort')
        .nullSafeProperty('send')
        .call([refer('result')]).statement,
    refer('exitCode', 'dart:io').assign(refer('result')).statement,
  ]));

/// An expression calling `apply` with appropriate setup for a MetaObject.
Expression _applyMetaObject(MetaObjectDefinition definition) {
  final namedArgs = {
    if (definition.defaults.options.isNotEmpty)
      'defaultOptions': _constructBuilderOptions(definition.defaults.options),
    if (definition.defaults.devOptions.isNotEmpty)
      'defaultDevOptions':
          _constructBuilderOptions(definition.defaults.devOptions),
    if (definition.defaults.releaseOptions.isNotEmpty)
      'defaultReleaseOptions':
          _constructBuilderOptions(definition.defaults.releaseOptions),
  };
  var import = _buildScriptImport(definition.import);
  return refer(
          'applyMetaObject', 'package:bonemeal_runner/bonemeal_runner.dart')
      .call([
    literalString(definition.key, raw: true),
    refer(definition.metaObjectFactory, import),
  ], namedArgs);
}

/// An expression calling `apply` with appropriate setup for a Builder.
Expression _applyBuilder(GeneratorDefinition definition) {
  final namedArgs = {
    'consumeInputs':
        definition.defaults.consumeInputs ? literalTrue : literalFalse,
    'hideOutputs': definition.defaults.hideOutputs ? literalTrue : literalFalse,
    if (!identical(definition.defaults.generateFor, InputSet.anything))
      'defaultGenerateFor':
          refer('InputSet', 'package:bonemeal_config/bonemeal_config.dart')
              .constInstance([], {
        if (definition.defaults.generateFor?.include != null)
          'include': _rawStringList(definition.defaults.generateFor!.include!),
        if (definition.defaults.generateFor?.exclude != null)
          'exclude': _rawStringList(definition.defaults.generateFor!.exclude!),
      }),
    if (definition.defaults.options.isNotEmpty)
      'defaultOptions': _constructBuilderOptions(definition.defaults.options),
    if (definition.defaults.devOptions.isNotEmpty)
      'defaultDevOptions':
          _constructBuilderOptions(definition.defaults.devOptions),
    if (definition.defaults.releaseOptions.isNotEmpty)
      'defaultReleaseOptions':
          _constructBuilderOptions(definition.defaults.releaseOptions),
  };
  var import = _buildScriptImport(definition.import);
  return refer('apply', 'package:bonemeal_runner/bonemeal_runner.dart').call([
    literalString(definition.key, raw: true),
    literalList(
        [for (var f in definition.generatorFactories) refer(f, import)]),
  ], namedArgs);
}

Expression _rawStringList(List<String> strings) =>
    literalConstList([for (var s in strings) literalString(s, raw: true)]);

/// Returns the actual import to put in the generated script based on an import
/// found in the build.yaml.
String _buildScriptImport(String import) {
  if (import.startsWith('package:')) {
    return import;
  } else if (import.startsWith('../') || import.startsWith('/')) {
    _log.warning('The `../` import syntax in bonemeal.yaml is now deprecated, '
        'instead do a normal relative import as if it was from the root of '
        'the package. Found `$import` in your `build.yaml` file.');
    return import;
  } else {
    return p.url.relative(import, from: p.url.dirname(scriptLocation));
  }
}

/// An expression creating a [GeneratorOptions] from a json string.
Expression _constructBuilderOptions(Map<String, dynamic> options) =>
    refer('GeneratorOptions', 'package:bonemeal_core/bonemeal_core.dart')
        .constInstance([options.toExpression()]);

extension on LanguageVersion {
  Version get asVersion => Version(major, minor, 0);
}

/// Converts a Dart object to a source code representation.
///
/// This is similar to [literal] from `package:code_builder`, except that it
/// always writes raw string literals.
extension ConvertToExpression on Object? {
  Expression toExpression() {
    final $this = this;

    if ($this is Map) {
      return literalMap({
        for (final entry in $this.cast<Object?, Object?>().entries)
          entry.key.toExpression(): entry.value.toExpression()
      }, refer('String'), refer('dynamic'));
    } else if ($this is List) {
      return literalList(
          [for (final entry in $this.cast<Object?>()) entry.toExpression()],
          refer('dynamic'));
    } else if ($this is String) {
      return literalString($this, raw: true);
    } else {
      return literal(this);
    }
  }
}

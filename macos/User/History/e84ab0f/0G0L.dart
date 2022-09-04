import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_config/bonemeal_config.dart';
import 'input_matcher.dart';
import 'package:collection/collection.dart';

/// A "phase" in the build graph, which represents running a one or more
/// generators on a set of sources.
abstract class BuildPhase {
  /// Whether to run lazily when an output is read.
  ///
  /// An optional build action will only run if one of its outputs is read by
  /// a later [Generator], or is used as a primary input to a later [Generator].
  ///
  /// If no build actions read the output of an optional action, then it will
  /// never run.
  bool get isOptional;

  /// Whether generated assets should be placed in the build cache.
  ///
  /// When this is `false` the Generator may not run on any package other than
  /// the root.
  bool get hideOutput;

  /// The identity of this action in terms of a build graph. If the identity of
  /// any action changes the build will be invalidated.
  ///
  /// This should take into account everything except for the generatorOptions,
  /// which are tracked separately via a `GeneratorOptionsNode` which supports
  /// more fine grained invalidation.
  int get identity;
}

/// An "action" in the build graph which represents running a single generator
/// on a set of sources.
abstract class BuildAction {
  /// Either a [Generator] or a [PostProcessGenerator].
  dynamic get generator;
  String get generatorLabel;
  GeneratorOptions get generatorOptions;
  InputMatcher get generateFor;
  String get package;
  InputMatcher get targetSources;
}

/// A [BuildPhase] that uses a single [Generator] to generate files.
class InBuildPhase extends BuildPhase implements BuildAction {
  @override
  final Generator generator;
  @override
  final String generatorLabel;
  @override
  final GeneratorOptions generatorOptions;
  @override
  final InputMatcher generateFor;
  @override
  final String package;

  @override
  final bool isOptional;
  @override
  final bool hideOutput;

  InBuildPhase._(this.package, this.generator, this.generatorOptions,
      {required this.generateFor,
      required this.generatorLabel,
      this.isOptional = false,
      this.hideOutput = false});

  /// Creates an [BuildPhase] for a normal [Generator].
  ///
  /// The build target is defined by [package] as well as [targetSources]. By
  /// default all sources in the target are used as primary inputs to the
  /// generator, but it can be further filtered with [generateFor].
  ///
  /// [isOptional] specifies that a Generator may not be run unless some other
  /// Generator in a later phase attempts to read one of the potential outputs.
  ///
  /// [hideOutput] specifies that the generated asses should be placed in the
  /// build cache rather than the source tree.
  InBuildPhase(
    Generator generator,
    String package, {
    String? generatorKey,
    InputSet generateFor = const InputSet(),
    GeneratorOptions generatorOptions = const GeneratorOptions({}),
    bool isOptional = false,
    bool hideOutput = false,
  }) : this._(package, generator, generatorOptions,
            generateFor: InputMatcher(generateFor),
            generatorLabel: generatorKey == null || generatorKey.isEmpty
                ? _generatorLabel(generator)
                : _simpleGeneratorKey(generatorKey),
            isOptional: isOptional,
            hideOutput: hideOutput);

  @override
  String toString() {
    final settings = <String>[];
    if (isOptional) settings.add('optional');
    if (hideOutput) settings.add('hidden');
    var result = '$generatorLabel on $targetSources in $package';
    if (settings.isNotEmpty) result += ' $settings';
    return result;
  }

  @override
  int get identity => _deepEquals.hash([
        generatorLabel,
        generator.buildExtensions,
        package,
        targetSources,
        generateFor,
        isOptional,
        hideOutput
      ]);
}

/// If we have no key find a human friendly name for the Generator.
String _generatorLabel(Object generator) {
  var label = '$generator';
  if (label.startsWith('Instance of \'')) {
    label = label.substring(13, label.length - 1);
  }
  return label;
}

/// Change "angular:angular" to "angular".
String _simpleGeneratorKey(String generatorKey) {
  if (!generatorKey.contains(':')) return generatorKey;
  var parts = generatorKey.split(':');
  if (parts[0] == parts[1]) return parts[0];
  return generatorKey;
}

final _deepEquals = const DeepCollectionEquality();

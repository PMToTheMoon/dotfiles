import 'package:bonemeal_config/src/expandos.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_definition.g.dart';

@JsonSerializable()
class GeneratorDefinition {
  /// The package which provides this Builder.
  String get package => packageExpando[this]!;

  /// A unique key for this Builder in `'$package:$builder'` format.
  String get key => generatorKeyExpando[this]!;

  @JsonKey(required: true, disallowNullValue: true)
  final String import;

  @JsonKey(required: true, disallowNullValue: true)
  final String generatorFactories;

  /// A list of file extensions which are required to run this builder.
  ///
  /// No builder which outputs any extension in this list is allowed to run
  /// after this builder.
  final List<String> requiredInputs;

  /// Builder keys in `$package:$builder` format which should only be run after
  /// this Builder.
  final List<String> runsBefore;

  /// A map from input extension to the output extensions created for matching
  /// inputs.
  @JsonKey(required: true, disallowNullValue: true)
  final Map<String, List<String>> generatorExtensions;

  final GeneratorConfigDefaults defaults;

  GeneratorDefinition({
    required this.import,
    required this.generatorFactories,
    required this.generatorExtensions,
    List<String>? requiredInputs,
    List<String>? runsBefore,
    GeneratorConfigDefaults? defaults,
  }) : defaults = defaults ?? GeneratorConfigDefaults() {
    if (generatorFactories.isEmpty) {
      throw ArgumentError.value(generatorFactories, 'builderFactories',
          'Must have at least one value.');
    }
  }

  factory GeneratorDefinition.fromJson(Map json) =>
      _$GeneratorDefinitionFromJson(json);
}

/// Default values that builder authors can specify when users don't fill in the
/// corresponding key for [GeneratorConfig].
@JsonSerializable()
class GeneratorConfigDefaults {
  final Map<String, dynamic> options;

  final Map<String, dynamic> devOptions;

  final Map<String, dynamic> releaseOptions;

  const GeneratorConfigDefaults({
    Map<String, dynamic>? options,
    Map<String, dynamic>? devOptions,
    Map<String, dynamic>? releaseOptions,
  })  : options = options ?? const {},
        devOptions = devOptions ?? const {},
        releaseOptions = releaseOptions ?? const {};

  factory GeneratorConfigDefaults.fromJson(Map json) {
    ArgumentError.checkNotNull(json);
    return _$GeneratorConfigDefaultsFromJson(json);
  }
}

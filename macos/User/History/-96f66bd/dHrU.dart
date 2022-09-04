import 'package:bonemeal_config/bonemeal_config.dart';
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
  final List<String> generatorFactories;

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

  /// Overridable parameters
  final GeneratorConfig defaults;

  GeneratorDefinition({
    required this.import,
    required this.generatorFactories,
    required this.generatorExtensions,
    List<String>? requiredInputs,
    List<String>? runsBefore,
    GeneratorConfig? defaults,
  })  : requiredInputs = requiredInputs ?? [],
        runsBefore = runsBefore ?? [],
        defaults = defaults ?? const GeneratorConfig() {
    if (generatorFactories.isEmpty) {
      throw ArgumentError.value(generatorFactories, 'builderFactories',
          'Must have at least one value.');
    }
  }

  factory GeneratorDefinition.fromJson(Map json) =>
      _$GeneratorDefinitionFromJson(json);

  @override
  String toString() => {
        'import': import,
        'requiredInputs': requiredInputs,
        'runsBefore': runsBefore,
        'defaults': defaults,
      }.toString();
}

/// Default values that builder authors can specify when users don't fill in the
/// corresponding key for [GeneratorConfig].
@JsonSerializable()
class GeneratorConfig {
  final bool consumeInputs;

  ///
  final bool hideOutputs;

  /// override default generate_for if specified
  @JsonKey(name: 'generate_for')
  final InputSet? generateFor;

  final Map<String, dynamic> options;

  final Map<String, dynamic> devOptions;

  final Map<String, dynamic> releaseOptions;

  const GeneratorConfig({
    bool? consumeInputs,
    bool? hideOutputs,
    this.generateFor,
    Map<String, dynamic>? options,
    Map<String, dynamic>? devOptions,
    Map<String, dynamic>? releaseOptions,
  })  : consumeInputs = consumeInputs ?? false,
        hideOutputs = hideOutputs ?? false,
        options = options ?? const {},
        devOptions = devOptions ?? const {},
        releaseOptions = releaseOptions ?? const {};

  factory GeneratorConfig.fromJson(Map json) {
    ArgumentError.checkNotNull(json);
    return _$GeneratorConfigFromJson(json);
  }
}

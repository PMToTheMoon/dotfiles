import 'package:bonemeal_config/bonemeal_config.dart';
import 'package:bonemeal_config/src/expandos.dart';
import 'package:json_annotation/json_annotation.dart';

part 'generator_definition.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum AutoApply { none, dependents, allPackages, rootPackage }

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

  /// Which packages should have this builder applied automatically.
  final AutoApply autoApply;

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
    AutoApply? autoApply,
    List<String>? requiredInputs,
    List<String>? runsBefore,
    GeneratorConfigDefaults? defaults,
  })  : autoApply = autoApply ?? AutoApply.none,
        requiredInputs = requiredInputs ?? [],
        runsBefore = runsBefore ?? [],
        defaults = defaults ?? GeneratorConfigDefaults() {
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
  @JsonKey(name: 'generate_for')
  final InputSet? generateFor;

  final Map<String, dynamic> options;

  final Map<String, dynamic> devOptions;

  final Map<String, dynamic> releaseOptions;

  const GeneratorConfig({
    this.generateFor,
    Map<String, dynamic>? options,
    Map<String, dynamic>? devOptions,
    Map<String, dynamic>? releaseOptions,
  })  : options = options ?? const {},
        devOptions = devOptions ?? const {},
        releaseOptions = releaseOptions ?? const {};

  factory GeneratorConfig.fromJson(Map json) {
    ArgumentError.checkNotNull(json);
    return _$GeneratorConfigFromJson(json);
  }
}

/// Default values that builder authors can specify when users don't fill in the
/// corresponding key for [GeneratorConfig].
@JsonSerializable()
class GeneratorConfigDefaults {
  @JsonKey(name: 'generate_for')
  final InputSet generateFor;

  final Map<String, dynamic> options;

  final Map<String, dynamic> devOptions;

  final Map<String, dynamic> releaseOptions;

  const GeneratorConfigDefaults({
    InputSet? generateFor,
    Map<String, dynamic>? options,
    Map<String, dynamic>? devOptions,
    Map<String, dynamic>? releaseOptions,
  })  : generateFor = generateFor ?? InputSet.anything,
        options = options ?? const {},
        devOptions = devOptions ?? const {},
        releaseOptions = releaseOptions ?? const {};

  factory GeneratorConfigDefaults.fromJson(Map json) {
    ArgumentError.checkNotNull(json);
    return _$GeneratorConfigDefaultsFromJson(json);
  }
}

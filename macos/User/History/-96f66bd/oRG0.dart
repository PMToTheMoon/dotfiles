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
  final String buildFactories;

  @JsonKey(required: true, disallowNullValue: true)
  final List<String> buildExtensions;

  final GeneratorConfigDefaults defaults;

  GeneratorDefinition({
    required this.import,
    required this.buildFactories,
    required this.buildExtensions,
    GeneratorConfigDefaults? defaults,
  }) : defaults = defaults ?? GeneratorConfigDefaults() {
    if (generatorFactories.isEmpty) {
      throw ArgumentError.value(builderFactories, 'builderFactories',
          'Must have at least one value.');
    }
    if (buildExtensions.entries.any((e) => e.value.contains(e.key))) {
      throw ArgumentError.value(
          buildExtensions,
          'buildExtensions',
          'May not overwrite an input, '
              'the output extensions must not contain the input extension');
    }
  }

  factory GeneratorDefinition.fromJson(Map json) =>
      _$GeneratorDefinitionFromJson(json);
}

/// Default values that builder authors can specify when users don't fill in the
/// corresponding key for [GeneratorConfig].
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

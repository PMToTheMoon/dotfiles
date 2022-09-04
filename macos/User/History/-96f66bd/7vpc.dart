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

  GeneratorDefinition();

  factory GeneratorDefinition.fromJson(Map json) =>
      _$GeneratorDefinitionFromJson(json);
}

class GeneratorConfigDefaults {}

import 'package:json_annotation/json_annotation.dart';

import 'expandos.dart';
import 'input_set.dart';

part 'meta_object_definition.g.dart';

@JsonEnum(fieldRename: FieldRename.snake)
enum AutoApply { none, dependents, allPackages, rootPackage }

@JsonSerializable()
class MetaObjectDefinition {
  /// The package which provides this Builder.
  String get package => packageExpando[this]!;

  /// A unique key for this Builder in `'$package:$builder'` format.
  String get key => metaObjectKeyExpando[this]!;

  @JsonKey(required: true, disallowNullValue: true)
  final String import;

  @JsonKey(required: true, disallowNullValue: true)
  final List<String> metaObjectFactories;

  /// Overridable parameters
  final MetaObjectConfig defaults;

  MetaObjectDefinition({
    required this.import,
    required this.metaObjectFactories,
    AutoApply? autoApply,
    List<String>? requiredInputs,
    List<String>? runsBefore,
    MetaObjectConfig? defaults,
  }) : defaults = defaults ?? const MetaObjectConfig() {
    if (metaObjectFactories.isEmpty) {
      throw ArgumentError.value(metaObjectFactories, 'builderFactories',
          'Must have at least one value.');
    }
  }

  factory MetaObjectDefinition.fromJson(Map json) =>
      _$MetaObjectDefinitionFromJson(json);

  @override
  String toString() => {
        'import': import,
        'defaults': defaults,
      }.toString();
}

/// Default values that builder authors can specify when users don't fill in the
/// corresponding key for [MetaObjectConfig].
@JsonSerializable()
class MetaObjectConfig {
  final Map<String, dynamic> options;

  final Map<String, dynamic> devOptions;

  final Map<String, dynamic> releaseOptions;

  const MetaObjectConfig({
    bool? consumeInputs,
    bool? hideOutputs,
    Map<String, dynamic>? options,
    Map<String, dynamic>? devOptions,
    Map<String, dynamic>? releaseOptions,
  })  : options = options ?? const {},
        devOptions = devOptions ?? const {},
        releaseOptions = releaseOptions ?? const {};

  factory MetaObjectConfig.fromJson(Map json) {
    ArgumentError.checkNotNull(json);
    return _$MetaObjectConfigFromJson(json);
  }
}

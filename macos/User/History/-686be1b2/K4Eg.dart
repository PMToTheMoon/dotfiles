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
  final Map<String, List<String>> metaObjectExtensions;

  /// Overridable parameters
  final MetaObjectConfig defaults;

  MetaObjectDefinition({
    required this.import,
    required this.metaObjectFactories,
    required this.metaObjectExtensions,
    AutoApply? autoApply,
    List<String>? requiredInputs,
    List<String>? runsBefore,
    MetaObjectConfig? defaults,
  })  : autoApply = autoApply ?? AutoApply.none,
        requiredInputs = requiredInputs ?? [],
        runsBefore = runsBefore ?? [],
        defaults = defaults ?? const MetaObjectConfig() {
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
        'requiredInputs': requiredInputs,
        'runsBefore': runsBefore,
        'defaults': defaults,
      }.toString();
}

/// Default values that builder authors can specify when users don't fill in the
/// corresponding key for [MetaObjectConfig].
@JsonSerializable()
class MetaObjectConfig {
  final bool consumeInputs;

  ///
  final bool hideOutputs;

  /// override default generate_for if specified
  @JsonKey(name: 'generate_for')
  final InputSet? generateFor;

  final Map<String, dynamic> options;

  final Map<String, dynamic> devOptions;

  final Map<String, dynamic> releaseOptions;

  const MetaObjectConfig({
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

  factory MetaObjectConfig.fromJson(Map json) {
    ArgumentError.checkNotNull(json);
    return _$MetaObjectConfigFromJson(json);
  }
}

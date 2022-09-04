// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generator_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeneratorDefinition _$GeneratorDefinitionFromJson(Map json) => $checkedCreate(
      'GeneratorDefinition',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'import',
            'generator_factories',
            'auto_apply',
            'required_inputs',
            'runs_before',
            'generator_extensions',
            'defaults'
          ],
          requiredKeys: const [
            'import',
            'generator_factories',
            'generator_extensions'
          ],
          disallowNullValues: const [
            'import',
            'generator_factories',
            'generator_extensions'
          ],
        );
        final val = GeneratorDefinition(
          import: $checkedConvert('import', (v) => v as String),
          factories: $checkedConvert('generator_factories',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          generatorExtensions: $checkedConvert(
              'generator_extensions',
              (v) => (v as Map).map(
                    (k, e) => MapEntry(k as String,
                        (e as List<dynamic>).map((e) => e as String).toList()),
                  )),
          autoApply: $checkedConvert(
              'auto_apply', (v) => $enumDecodeNullable(_$AutoApplyEnumMap, v)),
          requiredInputs: $checkedConvert('required_inputs',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          runsBefore: $checkedConvert('runs_before',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          defaults: $checkedConvert('defaults',
              (v) => v == null ? null : GeneratorConfig.fromJson(v as Map)),
        );
        return val;
      },
      fieldKeyMap: const {
        'generatorFactories': 'generator_factories',
        'generatorExtensions': 'generator_extensions',
        'autoApply': 'auto_apply',
        'requiredInputs': 'required_inputs',
        'runsBefore': 'runs_before'
      },
    );

const _$AutoApplyEnumMap = {
  AutoApply.none: 'none',
  AutoApply.dependents: 'dependents',
  AutoApply.allPackages: 'all_packages',
  AutoApply.rootPackage: 'root_package',
};

GeneratorConfig _$GeneratorConfigFromJson(Map json) => $checkedCreate(
      'GeneratorConfig',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'consume_inputs',
            'hide_outputs',
            'generate_for',
            'options',
            'dev_options',
            'release_options'
          ],
        );
        final val = GeneratorConfig(
          consumeInputs: $checkedConvert('consume_inputs', (v) => v as bool?),
          hideOutputs: $checkedConvert('hide_outputs', (v) => v as bool?),
          generateFor: $checkedConvert(
              'generate_for', (v) => v == null ? null : InputSet.fromJson(v)),
          options: $checkedConvert(
              'options',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e),
                  )),
          devOptions: $checkedConvert(
              'dev_options',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e),
                  )),
          releaseOptions: $checkedConvert(
              'release_options',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e),
                  )),
        );
        return val;
      },
      fieldKeyMap: const {
        'consumeInputs': 'consume_inputs',
        'hideOutputs': 'hide_outputs',
        'generateFor': 'generate_for',
        'devOptions': 'dev_options',
        'releaseOptions': 'release_options'
      },
    );

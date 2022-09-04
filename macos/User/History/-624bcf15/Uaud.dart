// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bonemeal_config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BonemealConfig _$BonemealConfigFromJson(Map json) => $checkedCreate(
      'BonemealConfig',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['generators', 'bonemeal'],
        );
        final val = BonemealConfig(
          generatorDefinitions: $checkedConvert(
              'generators',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(
                        k as String, GeneratorDefinition.fromJson(e as Map)),
                  )),
          globalConfig: $checkedConvert(
              'bonemeal',
              (v) =>
                  v == null ? null : BonemealOverrideConfig.fromJson(v as Map)),
        );
        return val;
      },
      fieldKeyMap: const {
        'generatorDefinitions': 'generators',
        'globalConfig': 'bonemeal'
      },
    );

BonemealOverrideConfig _$GlobalBonemealConfigFromJson(Map json) =>
    $checkedCreate(
      'GlobalBonemealConfig',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['generators'],
        );
        final val = BonemealOverrideConfig(
          generators: $checkedConvert(
              'generators',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(
                        k as String, GeneratorConfig.fromJson(e as Map)),
                  )),
        );
        return val;
      },
    );

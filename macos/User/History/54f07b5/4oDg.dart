// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meta_object_definition.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaObjectDefinition _$MetaObjectDefinitionFromJson(Map json) => $checkedCreate(
      'MetaObjectDefinition',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['import', 'meta_object_factories', 'defaults'],
          requiredKeys: const ['import', 'meta_object_factories'],
          disallowNullValues: const ['import', 'meta_object_factories'],
        );
        final val = MetaObjectDefinition(
          import: $checkedConvert('import', (v) => v as String),
          metaObjectFactory: $checkedConvert('meta_object_factories',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          defaults: $checkedConvert('defaults',
              (v) => v == null ? null : MetaObjectConfig.fromJson(v as Map)),
        );
        return val;
      },
      fieldKeyMap: const {'metaObjectFactories': 'meta_object_factories'},
    );

MetaObjectConfig _$MetaObjectConfigFromJson(Map json) => $checkedCreate(
      'MetaObjectConfig',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['options', 'dev_options', 'release_options'],
        );
        final val = MetaObjectConfig(
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
        'devOptions': 'dev_options',
        'releaseOptions': 'release_options'
      },
    );

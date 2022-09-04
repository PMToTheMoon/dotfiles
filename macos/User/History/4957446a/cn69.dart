// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ModelData _$ModelDataFromJson(Map json) => $checkedCreate(
      'ModelData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'import', 'fields'],
        );
        final val = ModelData(
          name: $checkedConvert('type', (v) => v as String),
          import: $checkedConvert('import', (v) => v as String?),
          fields: $checkedConvert(
              'fields',
              (v) => (v as Map?)?.map(
                    (k, e) => MapEntry(k as String, e),
                  )),
        );
        return val;
      },
    );

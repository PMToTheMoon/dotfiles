// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'input_set.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DataSet _$DataSetFromJson(Map json) => $checkedCreate(
      'DataSet',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['include', 'exclude'],
        );
        final val = DataSet(
          include: $checkedConvert('include',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
          exclude: $checkedConvert('exclude',
              (v) => (v as List<dynamic>?)?.map((e) => e as String).toList()),
        );
        return val;
      },
    );

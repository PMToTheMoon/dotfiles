// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_sm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaFetchSmbData _$MetaFetchBlocDataFromJson(Map json) => $checkedCreate(
      'MetaFetchBlocData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [],
        );
        final val = MetaFetchSmbData();
        return val;
      },
    );

_Source _$SourceFromJson(Map json) => $checkedCreate(
      '_Source',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'fetch_function'],
        );
        final val = _Source(
          type: $checkedConvert('type', (v) => v as String),
          fetchFunction: $checkedConvert('fetch_function', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'fetchFunction': 'fetch_function'},
    );

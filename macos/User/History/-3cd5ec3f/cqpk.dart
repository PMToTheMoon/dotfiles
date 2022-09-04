// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaFetchBlocData _$MetaFetchSmbDataFromJson(Map json) => $checkedCreate(
      'MetaFetchSmbData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [],
        );
        final val = MetaFetchBlocData();
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

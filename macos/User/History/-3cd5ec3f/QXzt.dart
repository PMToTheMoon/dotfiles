// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MetaFetchBlocData _$MetaFetchBlocDataFromJson(Map json) => $checkedCreate(
      'MetaFetchBlocData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['subject', 'source'],
        );
        final val = MetaFetchBlocData(
          subject: $checkedConvert('subject', (v) => v as String),
          source: $checkedConvert('source', (v) => _Source.fromJson(v as Map)),
        );
        return val;
      },
    );

_Source _$SourceFromJson(Map json) => $checkedCreate(
      'Source',
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

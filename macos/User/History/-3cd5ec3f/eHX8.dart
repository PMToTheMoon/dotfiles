// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fetch_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FetchBlocOptions _$MetaFetchBlocDataFromJson(Map json) => $checkedCreate(
      'MetaFetchBlocData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['subject', 'source', 'data'],
        );
        final val = FetchBlocOptions(
          subject: $checkedConvert('subject', (v) => v as String),
          source: $checkedConvert(
              'source', (v) => FetchBlocSource.fromJson(v as Map)),
          data: $checkedConvert('data', (v) => Data.fromJson(v as Map)),
        );
        return val;
      },
    );

FetchBlocSource _$SourceFromJson(Map json) => $checkedCreate(
      'Source',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'fetch_function'],
        );
        final val = FetchBlocSource(
          type: $checkedConvert('type', (v) => v as String),
          fetchFunction: $checkedConvert('fetch_function', (v) => v as String),
        );
        return val;
      },
      fieldKeyMap: const {'fetchFunction': 'fetch_function'},
    );

Data _$DataFromJson(Map json) => $checkedCreate(
      'Data',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type'],
        );
        final val = Data(
          type: $checkedConvert('type', (v) => v as String),
        );
        return val;
      },
    );

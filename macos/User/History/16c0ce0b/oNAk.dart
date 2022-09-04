// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_view_bloc.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamViewBlocData _$StreamViewBlocDataFromJson(Map json) => $checkedCreate(
      'StreamViewBlocData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['subject', 'state', 'source', 'hooks'],
        );
        final val = StreamViewBlocData(
          subject: $checkedConvert('subject', (v) => v as String),
          state:
              $checkedConvert('state', (v) => YamlMetaObjectSlot.fromJson(v)),
          source: $checkedConvert(
              'source',
              (v) => v == null
                  ? null
                  : StreamViewBlocSourceData.fromJson(v as Map)),
          hooks: $checkedConvert('hooks', (v) => v as String?),
        );
        return val;
      },
    );

StreamViewBlocStateData _$StreamViewBlocStateDataFromJson(Map json) =>
    $checkedCreate(
      'StreamViewBlocStateData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'import'],
        );
        final val = StreamViewBlocStateData(
          type: $checkedConvert('type', (v) => v as String),
          import: $checkedConvert('import', (v) => v as String?),
        );
        return val;
      },
    );

StreamViewBlocSourceData _$StreamViewBlocSourceDataFromJson(Map json) =>
    $checkedCreate(
      'StreamViewBlocSourceData',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['type', 'import', 'transformer'],
        );
        final val = StreamViewBlocSourceData(
          type: $checkedConvert('type', (v) => v as String),
          import: $checkedConvert('import', (v) => v as String?),
          transformer: $checkedConvert('transformer', (v) => v as String),
        );
        return val;
      },
    );

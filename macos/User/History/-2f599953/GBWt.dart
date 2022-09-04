part of 'stream_view_bloc.dart';

@JsonSerializable()
class StreamViewBlocData with BlocData {
  const StreamViewBlocData({
    required this.subject,
    required this.state,
    required this.source,
  });

  @override
  final String subject;

  final StreamViewBlocStateData state;
  final StreamViewBlocSourceData? source;

  Future<Map<String, dynamic>> toParams(BuildContext context) async => {
        'bloc': {
          ...baseParams,
          'state': state.toParams(),
          'listener': source?.listener ?? 'emit',
        },
        'source': await source?.toParams(context),
      };

  factory StreamViewBlocData.fromJson(Map json) =>
      _$StreamViewBlocDataFromJson(json);
}

@JsonSerializable()
class StreamViewBlocStateData {
  const StreamViewBlocStateData({
    required this.type,
    required this.import,
  });

  final String type;
  final String? import;

  Map<String, dynamic> toParams() => {
        'type': type,
        'import': import ?? '',
      };

  factory StreamViewBlocStateData.fromJson(Map json) =>
      _$StreamViewBlocStateDataFromJson(json);
}

@JsonSerializable()
class StreamViewBlocSourceData {
  const StreamViewBlocSourceData({
    required this.type,
    required this.import,
    required this.transformer,
  });

  final String type;
  final String? import;
  final Hook transformer;

  String get listener => '(data) => emit(${transformer.name}(data),)';

  Future<Map<String, dynamic>> toParams(BuildContext context) async {
    final transformerDeclaration =
        await HookResolver(transformer).resolve(context);

    return {
      'type': type,
      'import': import ?? '',
      'transformer': transformerDeclaration,
    };
  }

  factory StreamViewBlocSourceData.fromJson(Map json) =>
      _$StreamViewBlocSourceDataFromJson(json);
}

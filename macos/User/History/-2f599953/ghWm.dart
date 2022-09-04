part of 'stream_view_bloc.dart';

@JsonSerializable()
class StreamViewBlocData with BlocData {
  const StreamViewBlocData({
    required this.subject,
    required this.state,
    required this.source,
    required this.hooks,
  });

  @override
  final String subject;

  final YamlMetaObjectSlot state;
  final StreamViewBlocSourceData? source;
  final Hook hooks;

  Future<Map<String, dynamic>> toParams(
    BuildContext context,
    ModelBuildMetaData state,
  ) async {
    final hookDeclarations = await HookResolver(hooks).resolve(context);
    return {
      'bloc': {
        ...baseParams,
        'state': {
          'import': state.import,
          'type': state.type,
        },
        'hooks': hookDeclarations,
        'subscription': '_streamSubscription'
      },
      'source': await source?.toParams() ??
          StreamViewBlocSourceData.defaultSource(state.type),
    };
  }

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
  static Map<String, dynamic> defaultSource(String defaultType) => {
        'type': defaultType,
        'import': '',
        'transformer': '',
        'listener': 'emit',
      };

  const StreamViewBlocSourceData({
    required this.type,
    required this.import,
    required this.transformer,
  });

  final String type;
  final String? import;
  final String transformer;

  Future<Map<String, dynamic>> toParams() async {
    return {
      'type': type,
      'import': import ?? '',
      'transformer': transformer,
      'listener': '(data) => emit($transformer(data),)',
    };
  }

  factory StreamViewBlocSourceData.fromJson(Map json) =>
      _$StreamViewBlocSourceDataFromJson(json);
}

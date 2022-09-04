part of 'stream_view_bloc.dart';

@JsonSerializable()
class StreamViewBlocData with BlocData {
  const StreamViewBlocData({
    required this.subject,
    required this.state,
    required this.source,
    this.hooks,
  });

  @override
  final String subject;

  final ModelData state;
  final StreamViewBlocSourceData? source;
  final String? hooks;

  Future<Map<String, dynamic>> toParams(
    BuildStep context,
  ) async {
    final hookDeclarations =
        hooks != null ? await HookResolver(hooks!).resolve(context) : null;
    return {
      'bloc': {
        ...baseParams,
        'state': {
          'import': state.import ?? '',
          'type': state.type,
        },
        'subscription': '_streamSubscription'
      },
      'hooks': hookDeclarations ?? '',
      'source': await source?.toParams() ??
          StreamViewBlocSourceData.defaultSource(state.type),
    };
  }
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

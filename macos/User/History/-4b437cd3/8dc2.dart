part of 'stream_sub_cubit.dart';

@JsonSerializable()
class StreamSubCubitData {
  const StreamSubCubitData({
    required this.subject,
    required this.source,
    this.state,
  });

  final String subject;
  final StreamSubCubitSourceData source;
  final StreamSubCubitStateData? state;

  String get fileName => '${subject.snakeCase}_bloc.dart';
  String get freezedFileName => '${subject.snakeCase}_bloc.freezed.dart';
  String get jsonSerializableFileName => '${subject.snakeCase}_bloc.g.dart';

  Future<Map<String, dynamic>> toParams(BuildContext context) async => {
        'bloc': {
          'class': '${subject.pascalCase}Bloc',
          'file': fileName,
          'freezed_file': freezedFileName,
          'json_serializable_file': jsonSerializableFileName,
          'state': state?.toParams() ??
              StreamSubCubitStateData(type: source.type).toParams()
        },
        'source': await source.toParams(context, fileName),
      };

  factory StreamSubCubitData.fromJson(Map json) =>
      _$StreamSubCubitDataFromJson(json);
}

@JsonSerializable()
class StreamSubCubitStateData {
  const StreamSubCubitStateData({
    required this.type,
    this.import,
  });

  final String type;
  final String? import;

  factory StreamSubCubitStateData.fromJson(Map<String, dynamic> json) =>
      _$StreamSubCubitStateDataFromJson(json);

  Map<String, dynamic> toParams() => {
        'type': type,
        'import': import,
      };
}

@JsonSerializable()
class StreamSubCubitSourceData {
  const StreamSubCubitSourceData({
    required this.type,
    required this.import,
    this.transformer,
  });

  final String type;
  final String import;
  final String? transformer;

  factory StreamSubCubitSourceData.fromJson(Map json) =>
      _$StreamSubCubitSourceDataFromJson(json);

  Future<Map<String, dynamic>> toParams(
    BuildContext context,
    String filename,
  ) async {
    String transformerName = transformer;
    String? transformerHook;
    if (transformer != null) {
      final hook = Hook(filename, transformer!);
      transformerHook = await hook.read(context);
    }

    final streamSub = transformer != null ?
      'stream.listen(emit);' :
      'stream.listen((data) => );'

    return {
      'type': type,
      'import': import,
      'transformer': transformerHook,
      'subscription': streamSub;
    };
  }
}

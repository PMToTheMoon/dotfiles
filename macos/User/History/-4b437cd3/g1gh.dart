part of 'stream_sub_cubit.dart';

@JsonSerializable()
class StreamSubCubitData {
  const StreamSubCubitData({
    required this.subject,
    required this.source,
  });

  final String subject;
  final StreamSubCubitSourceData source;

  String get fileName => '${subject.snakeCase}_bloc.dart';
  String get freezedFileName => '${subject.snakeCase}_bloc.freezed.dart';
  String get jsonSerializableFileName => '${subject.snakeCase}_bloc.g.dart';

  Map<String, dynamic> toJson() => {
        'bloc': {
          'class': '${subject.pascalCase}Bloc',
          'file': fileName,
          'freezed_file': freezedFileName,
          'json_serializable_file': jsonSerializableFileName,
        },
        'source': source.toJson(),
      };

  factory StreamSubCubitData.fromJson(Map json) =>
      _$StreamSubCubitDataFromJson(json);
}

@JsonSerializable()
class StreamSubCubitSourceData {
  const StreamSubCubitSourceData({
    required this.type,
    required this.import,
  });

  final String type;
  final String import;

  factory StreamSubCubitSourceData.fromJson(Map json) =>
      _$StreamSubCubitSourceDataFromJson(json);

  Map<String, dynamic> toJson() => {
        'type': type,
        'import': import,
      };
}

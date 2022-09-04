import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:recase/recase.dart';

@JsonSerializable()
class StreamSubCubitData {
  const StreamSubCubitData();

  final String subject;
  final StreamSubCubitSourceData source;

  String get fileName => '${subject.snakeCase}_bloc.dart';

  Map<String, dynamic> toJson() => {
        'bloc': {
          'class': '${subject.pascalCase}Bloc',
          'file': 
        },
        'import': import,
      };

  factory StreamSubCubitData.fromJson(Map json) =>
      _$StreamSubCubitOptionsFromJson(json);
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

class StreamSubCubit extends YamlMetaObject<StreamSubCubitData> {
  @override
  final key = 'stream_sub_cubit';

  @override
  StreamSubCubitData dataFactory(Map input) =>
      StreamSubCubitData.fromJson(input);

  @override
  FutureOr<void> build(BuildContext context, StreamSubCubitData data) async {}
}

StreamSubCubit streamSubCubitFactory(MetaObjectOptions options) =>
    StreamSubCubit();

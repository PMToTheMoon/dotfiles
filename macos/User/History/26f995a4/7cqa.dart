import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class StreamSubCubitOptions {
  const StreamSubCubitOptions();

  factory StreamSubCubitOptions.fromJson(Map<String, dynamic> json) =>
      _$StreamSubCubitOptionsFromJson(json);
}

class StreamSubCubit extends YamlMetaObject {}

StreamSubCubit streamSubCubitFactory(MetaObjectOptions options) =>
    StreamSubCubit();

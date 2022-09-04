import 'package:bonemeal_yaml/bonemeal_yaml.dart';

@JsonSerializable()
class StreamSubCubitOptions {
  const StreamSubCubitOptions();

  factory StreamSubCubitOptions.fromJson(Map<String, dynamic> json) =>
      _$StreamSubCubitOptionsFromJson(json);
}

class StreamSubCubit extends YamlMetaObject {}

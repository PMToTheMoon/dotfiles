import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class StreamSubCubitData {
  const StreamSubCubitData();

  factory StreamSubCubitData.fromJson(Map<String, dynamic> json) =>
      _$StreamSubCubitOptionsFromJson(json);
}

class StreamSubCubit extends YamlMetaObject {
  @override
  final key = 'stream_sub_cubit';

  @override
  StreamSubCubit dataFactory(Map input) => StreamSubCubitData.fromJson(input);

  @override
  FutureOr<void> build(BuildContext context, StreamSubCubitData data) async {}
}

StreamSubCubit streamSubCubitFactory(MetaObjectOptions options) =>
    StreamSubCubit();

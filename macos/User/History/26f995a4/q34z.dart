import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stream_sub_cubit.g.dart';
part 'stream_sub_cubit_data.dart';
part 'stream_sub_cubit_template.dart' as templates;

class StreamSubCubit extends YamlMetaObject<StreamSubCubitData> {
  @override
  final key = 'stream_sub_cubit';

  @override
  StreamSubCubitData dataFactory(Map input) =>
      StreamSubCubitData.fromJson(input);

  @override
  FutureOr<void> build(BuildContext context, StreamSubCubitData data) async {
    final params = data.toJson();
    final blocFileContent = renderDartTemplate(streamSubCubitBlocTemplate, urlb, parameters)
  }
}

StreamSubCubit streamSubCubitFactory(MetaObjectOptions options) =>
    StreamSubCubit();

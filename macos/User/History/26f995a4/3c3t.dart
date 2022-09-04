import 'dart:async';

import 'package:bonemeal_yaml/bonemeal_yaml.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stream_sub_cubit.g.dart';
part 'stream_sub_cubit_data.dart';
part 'stream_sub_cubit_template.dart';

class StreamSubCubit extends YamlMetaObject<StreamSubCubitData> {
  @override
  final key = 'stream_sub_cubit';

  @override
  StreamSubCubitData dataFactory(Map input) =>
      StreamSubCubitData.fromJson(input);

  @override
  FutureOr<void> build(BuildContext context, StreamSubCubitData data) async {
    final params = data.toJson();
    final blocFileContent = renderDartTemplate(
      blocTemplate,
      context.source.uri,
      params,
    );

    final hook = Hook(data.fileName, 'test');
    await hook.read(context);

    await context.writeAsString(
      AssetId.output('bloc/${data.fileName}'),
      blocFileContent,
    );
  }
}

StreamSubCubit streamSubCubitFactory(MetaObjectOptions options) =>
    StreamSubCubit();

import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_yaml/bonemeal_yaml.dart';

import 'package:bloc_generators/src/utils/bloc.dart';

part 'stream_view_bloc.g.dart';
part 'stream_view_bloc_data.dart';
part 'stream_view_bloc_template.dart';

class StreamViewBloc extends YamlMetaObject<StreamViewBlocData> {
  @override
  final key = 'stream_view_bloc';

  @override
  StreamViewBlocData dataFactory(Map input) =>
      StreamViewBlocData.fromJson(input);

  @override
  FutureOr<void> build(BuildContext context, StreamViewBlocData data) async {
    final Map<String, dynamic> modelMetaData =
        await context.buildMetaObjectFromSlot(data.state);

    final params = await data.toParams(context, modelMetaData);
    final blocFileContent = renderDartTemplate(
      blocTemplate,
      context.source.uri,
      params,
    );

    await context.writeAsString(
      AssetId.output('bloc/${data.fileName}'),
      blocFileContent,
    );
  }
}

StreamViewBloc streamViewBlocFactory(MetaObjectOptions options) =>
    StreamViewBloc();
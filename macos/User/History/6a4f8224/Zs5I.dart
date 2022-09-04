import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_yaml/bonemeal_yaml.dart';

import 'package:bloc_generators/src/utils/bloc.dart';
import 'package:model_generators/model_generators.dart';

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
  FutureOr<void> build(BuildStep context, StreamViewBlocData data) async {
    final ModelBuildMetaData modelMetaData =
        await context.buildMetaObjectFromSlot(data.state);

    final outputBlocFileContent = renderDartTemplate(
      blocTemplate,
      context.source.uri,
      await data.toParams(context, modelMetaData),
    );

    await context.output('bloc/${data.fileName}', outputBlocFileContent);
  }
}

StreamViewBloc streamViewBlocFactory(MetaObjectOptions options) =>
    StreamViewBloc();

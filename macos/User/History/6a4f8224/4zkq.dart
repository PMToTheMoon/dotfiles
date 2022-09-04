import 'dart:async';

import 'package:json_annotation/json_annotation.dart';
import 'package:bonemeal/bonemeal.dart';

import 'package:bloc_generators/src/utils/bloc.dart';
import 'package:model_generators/model_generators.dart';

part 'stream_view_bloc.g.dart';
part 'stream_view_bloc_data.dart';
part 'stream_view_bloc_template.dart';

class StreamViewBloc extends MetaObject<StreamViewBlocData, void> {
  const StreamViewBloc({
    required this.model,
    super.root,
  });

  final Model model;

  @override
  FutureOr<void> build(BuildStep context) async {
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

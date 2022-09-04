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
  FutureOr<void> build(BuildStep<StreamViewBlocData> context) async {
    final stateBuildData = await context.build(model, context.input.state);
    final data = context.input;

    final outputBlocFileContent = renderDartTemplate(
      blocTemplate,
      context.uri,
      await context.input.toParams(context),
    );

    await context.output('bloc/${data.fileName}', outputBlocFileContent);
    await context.writeOutput(
      'bloc/${data.fileName}',
      outputBlocFileContent,
      [
        if (stateBuildData.generated != null)
          PartDependency.fromShared(stateBuildData.generated),
      ],
    );
  }
}

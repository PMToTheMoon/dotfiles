import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';

final _repo = Class(
  ($) => $
    ..name = 'RecordRepository'
    ..methods.add(
      Method(
        (m) => m
          ..name = 'fullRecord'
          ..returns = refer('Record', 'package:models/models.dart')
          ..modifier = MethodModifier.async
          ..requiredParameters.add(Parameter(
            (p) => p
              ..type = refer('String')
              ..name = 'id',
          )),
      ),
    ),
);

// DO NOT USE !!
// generated code ahs been modified by hand in output dir
// final hubBloc = FetchBloc(
//   root: 'lib/record/hub/bloc',
//   subject: 'Hub',
//   source: BlocSource(
//     repository: _repo,
//     methodName: 'fullRecord',
//   ),
// );

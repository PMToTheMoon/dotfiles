import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';

final _repo = Class(
  ($) => $
    ..name = 'RecordRepository'
    ..methods.add(
      Method(
        (m) => m
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

final hubBloc = FetchBloc(
  subject: 'Hub',
  source: BlocSource(
    repository: _repo,
  ),
);

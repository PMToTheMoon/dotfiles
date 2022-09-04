import 'package:bloc_generators/bloc_generators.dart';
import 'package:bonemeal/bonemeal.dart';

final repo = Class(
  ($) => $
    ..name = 'RecordRepository'
    ..methods.add(
      Method(
        (m) => m..returns = refer('Record', 'package:models/models.dart'),
      ),
    ),
);
final hubBloc = FetchBloc(subject: 'Hub', source: BlocSource());

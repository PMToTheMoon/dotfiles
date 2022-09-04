import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final newRapport = Union(
  className: 'NewRapport',
  types: {
    UnionType('Multi', {
      nestedJsonField(
        'rapport',
        refer(
          'RapportGeneral',
          'package:common/common.dart',
        ),
      ),
    })
  },
);

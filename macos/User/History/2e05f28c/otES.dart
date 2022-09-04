import 'package:model_generators/model_generators.dart';

final newRapport = Union(
  className: 'NewRapport',
  types: {
    UnionType('Multi', {
      jsonField('fieldName', type),
    })
  },
);

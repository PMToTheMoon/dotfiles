import 'package:bonemeal/bonemeal.dart';
import 'package:ipr/src/utils.dart';
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
      jsonField('', refer('bool'), name: 'completedRapport'),
      jsonField(
        'recordType',
        refer('RecordType', 'package:common/common.dart'),
        name: 'typeDossier',
      ),
      jsonField('', string, name: 'referenceDossier'),
      jsonField('', EnumPrestationType, name: 'typePrestation'),
      jsonField('', EnumPresentielRdvMode, name: 'presentielRdvMode'),
    })
  },
);

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
      jsonField('completed', refer('bool'), name: 'completedRapport'),
      jsonField(
        'recordType',
        refer('RecordType', 'package:common/common.dart'),
        name: 'typeDossier',
      ),
      jsonField('recordId', refer('String'), name: 'referenceDossier'),
      jsonField(
        '',
        refer('ServiceType', 'package:common/common.dart'),
        name: 'typePrestation',
      ),
      jsonField('', refer('EnumPresentielRdvMode'), name: 'presentielRdvMode'),
    })
  },
);

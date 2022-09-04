import 'package:bonemeal/bonemeal.dart';
import 'package:ipr/src/utils.dart';
import 'package:model_generators/model_generators.dart';

final newRapport = Union(
  serializable: true,
  className: 'NewRapport',
  typePrefix: 'New',
  typeSuffix: 'Rapport',
  types: {
    UnionType('general', {
      nestedJsonField(
        'rapport',
        refer(
          'RapportGeneral',
          'package:models/models.dart',
        ),
      ),
      jsonField(
        'completed',
        refer('bool'),
        name: 'completedRapport',
      ),
      jsonField(
        'capturePayment',
        refer('bool?'),
        name: 'capturePayment',
      ),
      jsonField(
        'recordType',
        refer('RecordType', 'package:models/models.dart'),
        name: 'typeDossier',
      ),
      jsonField(
        'recordId',
        refer('String'),
        name: 'referenceDossier',
      ),
      jsonField(
        'serviceType',
        refer('ServiceType', 'package:models/models.dart'),
        name: 'typePrestation',
      ),
      jsonField(
        'inPersonConsultationMode',
        refer('InPersonConsultationMode?', 'package:models/models.dart'),
        name: 'presentielRdvMode',
      ),
      jsonField('finalTotalTTC', refer('String?'), name: 'finalTotalTTC'),
      jsonField(
        'uploadedFilesToMakeDownloadableList',
        refer('List<String>'),
        name: 'uploadedFilesToMakeDownloadableList',
      )
    })
  },
);

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
      completedRapport: boolean,
      typeDossier: EnumDossierType,
      referenceDossier: string,

      /**
     * Used only when sharing rapport.
     *   Must be set, if dossier status is EN_ATTENTE_RAPPORT to indicate if there is a next step or not.
     *   Must be null if dossier status is EN_ATTENTE_RAPPORT_COMPLET
     */
      typePrestation: EnumPrestationType,
      /**
     * Used only if typePrestation is set on PRESENTIEL
     */
      presentielRdvMode: EnumPresentielRdvMode,
    })
  },
);

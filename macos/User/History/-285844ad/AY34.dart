import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

// Excluded fields
//
// prestataireMedecin': null,
// dateEnvoiPrestataireTechnique': null,
// prestataireTechnique': null,
// hasFeuilleSoins',
// 'teletransmissionAutre': false,

final rapportGeneral = JsonSerializable('RapportMulti', {
  jsonField(
    'id',
    refer('int'),
    name: 'identifiant',
  ),
  jsonField(
    'sentDate',
    refer('int?'),
    name: 'dateEnvoiPrestataireMedecin',
  ),
  jsonField(
    'synthesis',
    refer('String?'),
    name: 'synthese',
  ),
  jsonField(
    'comment',
    refer('String?'),
    name: 'commentaire',
  ),
  jsonField(
    'teleExpertiseSynthesis',
    refer('String?'),
    name: 'syntheseTe',
  ),
  jsonField(
    'teleExpertiseComment',
    refer('String?'),
    name: 'commentaireTe',
  ),
  jsonField(
    'teleExpertiseSentDate',
    refer('int?'),
    name: 'dateEnvoiTeleexpertise',
  ),
  jsonField(
    'interpretation',
    refer('String?'),
    name: 'interpretationMulti',
  ),
});

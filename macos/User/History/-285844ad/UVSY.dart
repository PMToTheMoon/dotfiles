import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final rapportMulti = JsonSerializable('RapportMulti', {
  jsonField(
    'id',
    refer('String'),
    name: 'identifiant',
  ),
  jsonField(
    'sentDate',
    refer('int'),
    name: 'dateEnvoiPrestataireMedecin',
  ),
  jsonField(
    'synthesis',
    refer('String'),
    name: 'synthese',
  ),
  jsonField(
    'comment',
    refer('String'),
    name: 'commentaire',
  ),
  jsonField(
    'teleExpertiseSynthesis',
    refer('String'),
    name: 'syntheseTe',
  ),
  jsonField(
    'teleExpertiseComment',
    refer('String'),
    name: 'commentaireTe',
  ),
  jsonField(
    'teleExpertiseSentDate',
    refer('int'),
    name: 'dateEnvoiTeleexpertise',
  ),
  // jsonField(
  //   '',
  //   refer('String'),
  //   name: 'hasFeuilleSoins',
  // ),
  jsonField(
    '',
    refer('String'),
    name: 'teletransmissionAutre',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'interpretationMulti',
  ),
});

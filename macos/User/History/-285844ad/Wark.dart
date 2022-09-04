import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final rapportMulti = JsonSerializable('RapportMulti', {
  jsonField(
    '',
    refer('String'),
    name: 'identifiant',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'dateEnvoiPrestataireMedecin',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'prestataireMedecin',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'dateEnvoiPrestataireTechnique',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'prestataireTechnique',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'synthese',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'commentaire',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'syntheseTe',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'commentaireTe',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'dateEnvoiTeleexpertise',
  ),
  jsonField(
    '',
    refer('String'),
    name: 'hasFeuilleSoins',
  ),
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

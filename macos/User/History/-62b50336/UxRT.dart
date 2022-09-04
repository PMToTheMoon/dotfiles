import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final observationCardDataPart = Freezed(
  root: 'lib/record/hub/observations/widgets/observation_card/models/',
  className: 'ObservationCardDataPart',
  typePrefix: 'ObservationCard',
  typeSuffix: 'Data',
  types: {
    'hiddenObservation': Fields({
      field('observation', refer('String')),
    }),
    'patientObservation': Fields({
      field('observation', refer('String')),
    }),
    'close': Fields({
      field('text', refer('String')),
    }),
    'medicalHistory': Fields({
      field('items', refer('Set<String>')),
    }),
    
        'symptoms':
        Fields({
          field('items', refer('Set<String>')),
        }),
    'medicalInformation':{ 
      field('items', refer('Set<String>')),
    },
    'treatments', {
      field('items', refer('Set<String>')),
    }),
    'additionalObservation', {
      field('observation', refer('String')),
    }),
    'rapport', {
      field('observation', refer('String')),
    }),
    'appointment', {
      field('type', refer('ServiceType', 'package:models/models.dart')),
    }),
  },
);

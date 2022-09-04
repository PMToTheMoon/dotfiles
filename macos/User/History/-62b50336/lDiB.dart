import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final observationCardDataPart = Path(
  'lib/record/hub/observations/widgets/observation_card/models/',
  [
    Freezed(
      className: 'ObservationCardDataPart',
      typePrefix: 'ObservationCard',
      typeSuffix: 'Data',
      types: {
        'hiddenObservation': {
          field('observation', refer('String')),
        },
        'patientObservation': {
          field('observation', refer('String')),
        },
        'close': {
          field('text', refer('String')),
        },
        'medicalHistory': {
          field('items', refer('Set<String>')),
        },
        'symptoms': {
          field('items', refer('Set<String>')),
        },
        'medicalInformation': {
          field('items', refer('Set<String>')),
        },
        'treatments': {
          field('items', refer('Set<String>')),
        },
        'additionalObservation': {
          field('observation', refer('String')),
        },
        'rapport': {
          field('observation', refer('String')),
        },
        'appointment': {
          field('type', refer('ServiceType', 'package:models/models.dart')),
        },
      },
    ),
  ],
);

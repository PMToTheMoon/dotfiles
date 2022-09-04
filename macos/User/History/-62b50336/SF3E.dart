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
    FreezedType(
        'symptoms',
        Fields({
          field('items', refer('Set<String>')),
        })),
    FreezedType('medicalInformation', {
      field('items', refer('Set<String>')),
    }),
    FreezedType('treatments', {
      field('items', refer('Set<String>')),
    }),
    FreezedType('additionalObservation', {
      field('observation', refer('String')),
    }),
    FreezedType('rapport', {
      field('observation', refer('String')),
    }),
    FreezedType('appointment', {
      field('type', refer('ServiceType', 'package:models/models.dart')),
    }),
  },
);

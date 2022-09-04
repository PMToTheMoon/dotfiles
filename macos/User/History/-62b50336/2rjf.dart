import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final observationCardDataPart = Union(
  root: 'lib/record/hub/observations/widgets/observation_card/models/',
  className: 'ObservationCardDataPart',
  typePrefix: 'ObservationCard',
  typeSuffix: 'Data',
  types: {
    UnionType(
        'hiddenObservation',
        Fields({
          field('observation', refer('String')),
        })),
    UnionType(
        'patientObservation',
        Fields({
          field('observation', refer('String')),
        })),
    UnionType(
        'medicalHistory',
        Fields({
          field('items', refer('Set<String>')),
        })),
    UnionType(
        'symptoms',
        Fields({
          field('items', refer('Set<String>')),
        })),
    UnionType('medicalInformation', {
      field('items', refer('Set<String>')),
    }),
    UnionType('treatments', {
      field('items', refer('Set<String>')),
    }),
    UnionType('additionalObservation', {
      field('observation', refer('String')),
    }),
    UnionType('rapport', {
      field('observation', refer('String')),
    }),
    UnionType('appointment', {
      field('type', refer('ServiceType', 'package:models/models.dart')),
    }),
  },
);

import 'package:bonemeal/bonemeal.dart';
import 'package:bonemeal_runner/bonemeal_runner.dart';
import 'package:model_generators/model_generators.dart';

final observationCardDataPart = Union(
  root: 'packages/common/lib/src/widgets/observation/models',
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
    UnionType('treatments', {
      field('items', refer('Set<String>')),
    }),
    UnionType('additionalObservation', {
      field('observation', refer('String')),
    }),
  },
);

final observationCardData = Union(
    root: 'packages/common/lib/src/widgets/observation/models',
    className: 'ObservationCardData',
    typePrefix: '_ObservationCardData',
    types: {
      UnionType(null, {
        field('date', refer('DateTime')),
        field(
            'doctor',
            refer(
              'ObservationCardIdentityData',
              'observation_card_data_part.dart',
            )),
      }),
    });

Future<void> main() async {
  await build(observationCardDataPart);
}

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
        'identity',
        Fields({
          field('avatar',
              refer('ImageProvider', 'package:flutter/material.dart')),
          field('firstName', refer('String')),
          field('lastName', refer('String')),
          field('subtitle', refer('String')),
          field('specialty', refer('String')),
        })),
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
        'date',
        Fields({
          field('date', refer('DateTime')),
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
  typePrefix: '_',
  types: UnionType('date', {
    field('date', refer('DateTime')),
    field(
        'doctor',
        refer('ObservationCardIdentityData',
            'observation_card_identity_data.dart')),
  }),
);

Future<void> main() async {
  await build(observationCardDataPart);
}

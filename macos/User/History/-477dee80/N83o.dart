import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final candidateModel = JsonSerializable('Candidate', {
  field('id', refer('String')),
  field('firstName', refer('String')),
  field('lastName', refer('String')),
  field('biography', refer('String')),
});

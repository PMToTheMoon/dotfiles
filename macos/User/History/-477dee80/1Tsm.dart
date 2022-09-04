import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final candidateModel = JsonSerializable('Candidate', {
  jsonField('id', refer('String'), name: 'candidateId'),
  // jsonField('account', refer('UserAccount', 'package:models/models.dart')),
  // jsonField('lastName', refer('String')),
  // jsonField('biography', refer('String')),
});

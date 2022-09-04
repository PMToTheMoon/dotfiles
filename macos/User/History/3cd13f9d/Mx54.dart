import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final candidateModel = JsonSerializable('Candidate', {
  jsonField('id', refer('String'), name: 'candidateId'),
@JsonKey(name: 'userId')
  jsonField('id', refer('String')),
  jsonField('userType', refer('UserType')),
  jsonField('firstName', refer('String')),
  jsonField('lastName', refer('String')),
  jsonField('email', refer('String')),
  jsonField('biography', refer('String?')),
  jsonField('urlPicture', refer('String?')),
  jsonField('phoneNumber', refer('String?')),
});

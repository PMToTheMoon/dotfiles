import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final userModel = JsonSerializable('User', {
  jsonField('id', refer('String'), name: 'userId'),
  jsonField(
    'userType',
    refer('UserType', 'package:models/models.dart'),
  ),
  jsonField(
    'firstName',
    refer('String'),
  ),
  jsonField(
    'lastName',
    refer('String'),
  ),
  jsonField(
    'email',
    refer('String'),
  ),
  jsonField(
    'biography',
    refer('String?'),
  ),
  jsonField(
    'urlPicture',
    refer('String?'),
  ),
  jsonField(
    'phoneNumber',
    refer('String?'),
  ),
});

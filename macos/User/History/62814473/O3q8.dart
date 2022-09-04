import '../models/user_account_model.dart';

final userAccountInformationUpdate =
    JsonSerializable('UserAccountInformationUpdate', {
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

import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final userAccountInformationUpdate =
    JsonSerializable('UserAccountInformationUpdate', {
  jsonField(
    'firstName',
    refer('String?'),
  ),
  jsonField(
    'lastName',
    refer('String?'),
  ),
  jsonField(
    'email',
    refer('String?'),
  ),
  jsonField(
    'biography',
    refer('String?'),
  ),
  jsonField(
    'phoneNumber',
    refer('String?'),
  ),
});

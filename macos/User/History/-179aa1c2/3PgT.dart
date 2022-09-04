import 'package:models/models.dart';

import 'auth_service/json_factories.dart';

final jsonFactories = {
  ...authServiceFactories,
  User: User.fromJson,
  Candidate: Candidate.fromJson,
};

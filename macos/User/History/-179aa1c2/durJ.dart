import 'package:models/models.dart';

import 'auth_service/json_factories.dart';

final jsonFactories = {
  ...authServiceFactories,
  Candidate: Candidate.fromJson,
};

import 'package:models/models.dart';

import 'json_serializable_converter.dart';

final jsonFactories = {
  Candidate: Candidate.fromJson,
};

final jsonConverter = JsonSerializableConverter(jsonFactories);

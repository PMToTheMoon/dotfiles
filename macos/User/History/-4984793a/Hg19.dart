final jsonFactories = {
  Candidate: Candidate.fromJson,
};

final converter = JsonSerializableConverter(jsonFactories);

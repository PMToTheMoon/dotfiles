import 'package:json_annotation/json_annotation.dart';

import 'user_type.dart';
part 'candidate.g.dart';

@JsonSerializable()
class Candidate {
  const Candidate(
      {@JsonKey(name: 'candidateId') required this.id,
      required this.firstName,
      required this.lastName,
      required this.biography});

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  @JsonKey(name: 'candidateId')
  final String id;

  final String firstName;

  final String lastName;

  // final String biography;
  final String email;
  final String urlPicture;
  final UserType userType;

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}

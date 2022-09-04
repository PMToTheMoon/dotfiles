import 'package:json_annotation/json_annotation.dart';
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
    "email": "teddymeng@gmail.com",
    "urlPicture": "https://s.gravatar.com/avatar/2c67bc830f3e0dd29f11995211095e07?s=480&r=pg&d=https%3A%2F%2Fcdn.auth0.com%2Favatars%2Fte.png",
    "userType": "candidate",

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}
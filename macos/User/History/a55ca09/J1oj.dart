import 'package:json_annotation/json_annotation.dart';
part 'candidate.g.dart';

@JsonSerializable()
class Candidate {
  const Candidate(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.biography});

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  final String id;

  final String firstName;

  final String lastName;

  final String biography;

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}
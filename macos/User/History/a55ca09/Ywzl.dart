import 'package:json_annotation/json_annotation.dart';
part 'candidate.g.dart';

@JsonSerializable()
class Candidate {
  const Candidate({required this.id});

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  @JsonKey(name: 'candidateId')
  final String id;

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}

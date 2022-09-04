import 'package:json_annotation/json_annotation.dart';
part 'candidate.g.dart';

@JsonSerializable()
class UserAccount {
  const UserAccount({required this.id});

  factory UserAccount.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  @JsonKey(name: 'candidateId')
  final String id;

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}

import 'package:json_annotation/json_annotation.dart';

import 'user_type.dart';
part 'candidate.g.dart';

@JsonSerializable()
class User {
  const User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.biography,
  });

  factory Candidate.fromJson(Map<String, dynamic> json) =>
      _$CandidateFromJson(json);

  @JsonKey(name: 'userId')
  final String id;

  final UserType userType;

  final String firstName;

  final String lastName;

  final String email;

  final String? biography;

  final String? urlPicture;

  final String? phoneNumber;

  Map<String, dynamic> toJson() => _$CandidateToJson(this);
}

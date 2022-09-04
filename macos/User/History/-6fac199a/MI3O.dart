import 'package:json_annotation/json_annotation.dart';

/// An authorized user's session
@JsonSerializable()
class AuthSession {
  const AuthSession({
    required this.bearerToken,
    required this.userId,
    required this.isAdmin,
    required this.isBusinessPartner,
    required this.isTalentCoach,
    required this.isCandidate,
    required this.isClient,
    required this.isRpo,
  });

  final String bearerToken;
  final String userId;
  final bool isAdmin;
  final bool isBusinessPartner;
  final bool isTalentCoach;
  final bool isCandidate;
  final bool isClient;
  final bool isRpo;

  factory AuthSession.fromJson(Map<String, dynamic> json) =>
      _$SessionFromJson(json);

  Map<String, dynamic> toJson() => _$SessionToJson(this);
}

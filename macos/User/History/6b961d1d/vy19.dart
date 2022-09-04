import 'package:json_annotation/json_annotation.dart';

part 'login.g.dart';

@JsonSerializable()
class LoginRequest {
  const LoginRequest();

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);

  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  const LoginResponse({
    required this.userId,
    required this.email,
    required this.isAdmin,
    required this.isBusinessPartner,
    required this.isTalentCoach,
    required this.isCandidate,
    required this.isClient,
    required this.isRpo,
  });

  final String userId;
  final String email;
  final bool isAdmin;
  final bool isBusinessPartner;
  final bool isTalentCoach;
  final bool isCandidate;
  final bool isClient;
  final bool isRpo;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
}

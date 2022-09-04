// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest(
      username: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'email': instance.username,
      'password': instance.password,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      userId: json['userId'] as String,
      email: json['email'] as String,
      isAdmin: json['isAdmin'] as bool,
      isBusinessPartner: json['isBusinessPartner'] as bool,
      isTalentCoach: json['isTalentCoach'] as bool,
      isCandidate: json['isCandidate'] as bool,
      isClient: json['isClient'] as bool,
      isRpo: json['isRpo'] as bool,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'email': instance.email,
      'isAdmin': instance.isAdmin,
      'isBusinessPartner': instance.isBusinessPartner,
      'isTalentCoach': instance.isTalentCoach,
      'isCandidate': instance.isCandidate,
      'isClient': instance.isClient,
      'isRpo': instance.isRpo,
    };

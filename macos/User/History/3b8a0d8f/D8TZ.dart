import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/models/session.dart';
import 'package:zanalys_api/src/user_api/models/user.dart';

part 'authentication_api.g.dart';

@RestApi()
abstract class AuthenticationAPI {
  factory AuthenticationAPI(Dio dio, {String baseUrl}) = _AuthenticationAPI;

  @POST('/auth/login')
  @FormUrlEncoded()
  Future<String> logIn(@Field('identifiant') String identifier,
      @Field('password') String password);

  @POST('auth/loginDossier')
  @FormUrlEncoded()
  Future<User?> folderSignIn(@Field('identifiant') String identifier,
      @Field('password') String password);

  @POST('/auth/code')
  @FormUrlEncoded()
  Future<Session?> validateOTP(@Field('identifiant') String identifier,
      @Field('password') String password, @Field('code') String otp);

  @POST('/auth/refresh')
  @FormUrlEncoded()
  Future<String?> refreshToken(@Field('pRefreshToken') String token);
}

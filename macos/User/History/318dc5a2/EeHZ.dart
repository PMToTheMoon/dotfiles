import 'package:zanalys_api/model/document_type.dart';
import 'package:zanalys_api/model/session.dart';
import 'package:zanalys_api/model/user.dart';
import 'package:zanalys_api/model/user_sign_in_status.dart';

abstract class NetworkService {
  Future<void> init();

  Future<UserSignInStatus> signIn(
      {required String identifier, required String password});

  Future<User?> folderSignIn(
      {required String identifier, required String password});

  Future<Session?> validateOTP(
      {required String identifier,
      required String password,
      required String code});

  Future<String?> uploadDocument({
    required String path,
    required String accessCode,
    required DocumentType type,
  });

  Future<String?> refreshToken({required String currentToken});

  Future<void> updatePushToken({required String token});
}

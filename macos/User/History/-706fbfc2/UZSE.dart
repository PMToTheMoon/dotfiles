import 'package:zanalys_api/src/model/user_sign_in_status.dart';

class SignInMapper {
  UserSignInStatus convert(String response) {
    switch (response) {
      case 'AUTHENTIFIE':
        return UserSignInStatus.authenticated;
      case 'ERREUR':
        return UserSignInStatus.error;
      case 'COMPTE_BLOQUE':
        return UserSignInStatus.accountLocked;
      case 'COMPTE_ANONYMISE':
        return UserSignInStatus.accountAnonymous;
      case 'COMPTE_SANS_PROFIL':
        return UserSignInStatus.accountWithoutProfile;
      default:
        throw Exception('Unhandled authentication status response');
    }
  }
}

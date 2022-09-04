import 'package:zanalys_api/src/models/sign_in_status.dart';

class SignInMapper {
  SignInStatus convert(String response) {
    switch (response) {
      case 'AUTHENTIFIE':
        return SignInStatus.authenticated();
      case 'ERREUR':
        return SignInStatus.error();
      case 'COMPTE_BLOQUE':
        return SignInStatus.accountLocked();
      case 'COMPTE_ANONYMISE':
        return SignInStatus.accountAnonymous();
      case 'COMPTE_SANS_PROFIL':
        return SignInStatus.accountWithoutProfile();
      default:
        throw Exception('Unhandled authentication status response');
    }
  }
}

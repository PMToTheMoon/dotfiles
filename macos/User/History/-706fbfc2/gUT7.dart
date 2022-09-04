import 'package:zanalys_api/src/models/sign_in_status.dart';

class SignInMapper {
  SignInStatus convert(String response) {
    switch (response) {
      case 'AUTHENTIFIE':
        return const SignInStatus.authenticated();
      case 'ERREUR':
        return const SignInStatus.error();
      case 'COMPTE_BLOQUE':
        return const SignInStatus.accountLocked();
      case 'COMPTE_ANONYMISE':
        return const SignInStatus.accountAnonymous();
      case 'COMPTE_SANS_PROFIL':
        return const SignInStatus.accountWithoutProfile();
      default:
        throw Exception('Unhandled authentication status response');
    }
  }
}

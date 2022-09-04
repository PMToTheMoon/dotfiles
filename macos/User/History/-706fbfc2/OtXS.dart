import 'package:zanalys_api/src/models/sign_in_status.dart';

class SignInMapper {
  LognInStatus convert(String response) {
    switch (response) {
      case 'AUTHENTIFIE':
        return const LognInStatus.authenticated();
      case 'ERREUR':
        return const LognInStatus.error();
      case 'COMPTE_BLOQUE':
        return const LognInStatus.accountLocked();
      case 'COMPTE_ANONYMISE':
        return const LognInStatus.accountAnonymous();
      case 'COMPTE_SANS_PROFIL':
        return const LognInStatus.accountWithoutProfile();
      default:
        throw Exception('Unhandled authentication status response');
    }
  }
}

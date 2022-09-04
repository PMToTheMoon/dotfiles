import 'package:zanalys_api/src/models/sign_in_status.dart';

class SignInMapper {
  LogInStatus convert(String response) {
    switch (response) {
      case 'AUTHENTIFIE':
        return const LogInStatus.authenticated();
      case 'ERREUR':
        return const LogInStatus.error();
      case 'COMPTE_BLOQUE':
        return const LogInStatus.accountLocked();
      case 'COMPTE_ANONYMISE':
        return const LogInStatus.accountAnonymous();
      case 'COMPTE_SANS_PROFIL':
        return const LogInStatus.accountWithoutProfile();
      default:
        throw Exception('Unhandled authentication status response');
    }
  }
}

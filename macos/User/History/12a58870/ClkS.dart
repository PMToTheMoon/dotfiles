import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';

class MockAuthProvider implements BearerTokenProvider {
  final _public = TbtPublicClient();

  String? _token;

  @override
  String? get bearerToken => 'token';

  @override
  String? refreshToken() {
    final res = _public.auth.login(const LoginRequest(
      username: 'teddymeng@gmail.com',
      password: 'P@ssword123456',
    ));
  }
}

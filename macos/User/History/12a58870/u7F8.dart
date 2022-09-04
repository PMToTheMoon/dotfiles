import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';

class MockAuthProvider implements BearerTokenProvider {
  final _public = TbtPublicClient();

  String? _token;

  @override
  String? get bearerToken => 'token';

  @override
  Future<String?> refreshToken() async {
    final res = await _public.auth.login(const LoginRequest(
      username: 'teddymeng@gmail.com',
      password: 'P@ssword123456',
    ));
    _token = res.body?.authToken;
    return _token;
  }
}

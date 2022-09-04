import 'package:models/models.dart';

class MockAuthProvider implements BearerTokenProvider {
  @override
  String? get bearerToken => 'token';

  @override
  String? refreshToken() => 'token';
}

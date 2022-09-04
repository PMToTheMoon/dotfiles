import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

main() {
  final client = TbtPublicClient();
  final auth = client.auth;
  group('Auth Service', () {
    test('login', () async {
      const credentials = LoginRequest(
        email: 'teddymeng@gmail.com',
        password: 'P@ssword123456',
      );
      final response = await auth.login(credentials);
      expect(response.isSuccessful, true, reason: 'Not successful');
      expect(response.body, isNotNull, reason: 'Body null');
    });
  });
}

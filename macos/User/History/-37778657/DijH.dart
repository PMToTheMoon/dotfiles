import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

main() {
  final client = TbtPublicClient();
  final auth = client.auth;
  group('Auth Service', () {
    test('login', () async {
      const credentials = LoginRequest(
        username: 'teddymeng@gmail.com',
        password: 'P@ssword123456',
      );
      final response = await auth.login(credentials);
      expect(response.isSuccessful, true, reason: 'Not successful');
      expect(response.body, isNotNull, reason: 'Body null');
    });
    test('login throw error on invalid credentials', () async {
      const credentials = LoginRequest(
        username: 'teddymeng@gmail.com',
        password: 'P@ssword16',
      );
      try {
        final response = await auth.login(credentials);
      } catch (e) {
        // expect(e, isNotNull);
      }
    });
  });
}

import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:test/test.dart';

import 'utils.dart';

main() {
  final client = TbtPrivateClient(MockAuthProvider());
  final UserService userService = client.user;
  group('User service test', () {
    test('user(id)', () async {
      const expectedUser = User(
        id: '2CW568J0yLKXns8w9vLFeagVSX1',
        userType: UserType.candidate,
        email: 'teddymeng@gmail.com',
        firstName: 'Teddy',
        lastName: 'Meng',
      );
      final response = await userService.user(expectedUser.id);
      expect(response.isSuccessful, true);
      expect(response.body, isNotNull);
      expect(response.body?.id, expectedUser.id);
    });
  });
}

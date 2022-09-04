import 'package:models/models.dart';
import 'package:tbt_api/tbt_api.dart';
import 'package:tech_by_tech/auth/auth.dart';

class UserRepository {
  UserRepository({
    required AuthRepository authRepository,
  }) : _userApi = authRepository.tbtPrivateClient.user;

  final UserService _userApi;

  Future<UserAccount> user(String id) async {
    return _userApi
        .user(id)
        .then((r) => r.unwrapOrThrow('Unable to fetch user'));
  }
}

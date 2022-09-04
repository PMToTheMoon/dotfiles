import 'package:tech_by_tech/auth/auth.dart';

class UserRepository {
  UserRepository({
    required AuthRepository authRepository,
  });

  final UserRepository _userApi;
}

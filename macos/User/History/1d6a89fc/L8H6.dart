import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

part 'user_service.chopper.dart';

@ChopperApi()
abstract class UserService extends ChopperService {
  static UserService create([ChopperClient? client]) => _$UserService;

  @Get(path: 'user-accounts/{id}')
  Future<Response<User>> user(String id);
}

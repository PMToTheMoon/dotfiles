import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

part 'user_service.chopper.dart';

@ChopperApi()
abstract class UserService extends ChopperService {
  static UserService create([ChopperClient? client]) => _$UserService(client);

  @Get(path: 'user-accounts/{id}')
  Future<Response<UserAccount>> user(@Path('id') String id);
}

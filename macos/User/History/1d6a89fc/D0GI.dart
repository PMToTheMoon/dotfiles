import 'package:chopper/chopper.dart';
import 'package:models/models.dart';
import 'package:tbt_api/src/user_service/requests/user_account_information_update.dart';

part 'user_service.chopper.dart';

@ChopperApi()
abstract class UserService extends ChopperService {
  static UserService create([ChopperClient? client]) => _$UserService(client);

  @Get(path: 'user-accounts/{id}')
  Future<Response<UserAccount>> account(@Path('id') String id);

  @Put(path: 'user-accounts/{id}')
  Future<Response<UserAccount>> updateAccountInformation(
    @Path('id') String id,
    @Body() UserAccountInformationUpdate update,
  );
}

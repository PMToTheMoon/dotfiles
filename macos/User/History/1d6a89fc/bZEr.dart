import 'package:chopper/chopper.dart';

part 'user_service.dart';

@ChopperApi()
abstract class UserService extends ChopperService {
  static UserService create([ChopperClient? client]) => _$UserService;
}

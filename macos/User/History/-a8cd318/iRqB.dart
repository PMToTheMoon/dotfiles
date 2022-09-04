import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

part 'candidate_service.chopper.dart';

@ChopperApi()
abstract class CandidateService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static CandidateService create([ChopperClient? client]) =>
      _$CandidateService(client);

  @Get(path: '/candidates/{id}')
  Future<Response<UserAccount>> candidate(@Path() String id);
}

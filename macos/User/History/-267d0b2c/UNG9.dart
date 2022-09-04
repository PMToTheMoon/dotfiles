import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

part 'candidate_api.chopper.dart';

@ChopperApi()
abstract class CandidateService extends ChopperService {
  // A helper method that helps instantiating the service. You can omit this method and use the generated class directly instead.
  static CandidateService create([ChopperClient? client]) =>
      _$CandidateApi(client);

  @Get(path: '/candidates/{id}')
  Future<Response<Candidate>> candidate(@Path() String id);
}

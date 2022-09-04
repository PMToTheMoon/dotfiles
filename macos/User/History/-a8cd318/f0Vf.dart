import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

part 'candidate_service.chopper.dart';

@ChopperApi(baseUrl: '/candidates')
abstract class CandidateService extends ChopperService {
  static CandidateService create([ChopperClient? client]) =>
      _$CandidateService(client);

  @Get(path: '/{id}')
  Future<Response<Candidate>> candidate(@Path() String id);

  @Get(path: '/{id}/skills')
  Future<Response<Candidate>> skills(@Path() String id);

  @Get(path: '/{id}/skills')
  Future<Response<Candidate>> skills(@Path() String id);
}

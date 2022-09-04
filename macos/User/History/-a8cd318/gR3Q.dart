import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

part 'candidate_service.chopper.dart';

@ChopperApi(baseUrl: '/candidates')
abstract class CandidateService extends ChopperService {
  static CandidateService create([ChopperClient? client]) =>
      _$CandidateService(client);

  @Get(path: '/{candidateId}')
  Future<Response<Candidate>> candidate(@Path() String candidateId);

  @Get(path: '/{candidateId}/skills')
  Future<Response<List<Skill>>> skills(@Path() String candidateId);

  @Delete(path: '/{candidateId}/skills/{skill}')
  Future<Response<Skill>> deleteSkill(
    @Path() String candidateId,
    @Path() Skill skill,
  );

  @Post(path: '/{candidateId}/skills')
  Future<Response<Candidate>> setSkills(
    @Path() String id,
    @Body() List<Skill> skills,
  );
}

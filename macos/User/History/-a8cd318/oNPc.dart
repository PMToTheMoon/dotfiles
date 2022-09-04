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

  @Delete(path: '/{candidateId}/skills/{skillName}')
  Future<Response<void>> deleteSkill(
    @Path() String candidateId,
    @Path() String skillName,
  );

  @Post(path: '/{candidateId}/skills')
  Future<Response<void>> createSkills(
    @Path() String candidateId,
    @Body() List<Skill> skills,
  );
}

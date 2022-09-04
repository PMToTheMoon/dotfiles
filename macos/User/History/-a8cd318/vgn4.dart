import 'package:chopper/chopper.dart';
import 'package:models/models.dart';

part 'candidate_service.chopper.dart';

@ChopperApi(baseUrl: '/candidates')
abstract class CandidateService extends ChopperService {
  static CandidateService create([ChopperClient? client]) =>
      _$CandidateService(client);

  @Get(path: '/{candidateId}')
  Future<Response<Candidate>> candidate(@Path() String candidateId);

  @Get(path: '/{candidateId}/pro-experiences')
  Future<Response<List<ProfessionalExperience>>> professionalExperiences(
      @Path() String candidateId);

  @Delete(path: '/{candidateId}/skills/{experienceId}')
  Future<Response<void>> deleteProfessionalExperience(
    @Path() String candidateId,
    @Path() String experienceId,
  );

  @Post(path: '/{candidateId}/skills')
  Future<Response<void>> createProfessionalExperience(
    @Path() String candidateId,
    @Body() NewProfessionalExperience experience,
  );

  @Get(path: '/{candidateId}/pro-experiences')
  Future<Response<List<ProfessionalExperience>>> professionalExperiences(
      @Path() String candidateId);

  @Delete(path: '/{candidateId}/skills/{experienceId}')
  Future<Response<void>> deleteProfessionalExperience(
    @Path() String candidateId,
    @Path() String experienceId,
  );

  @Post(path: '/{candidateId}/skills')
  Future<Response<void>> createProfessionalExperience(
    @Path() String candidateId,
    @Body() NewProfessionalExperience experience,
  );

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

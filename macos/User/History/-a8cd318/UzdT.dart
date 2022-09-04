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

  @Delete(path: '/{candidateId}/pro-experiences/{experienceId}')
  Future<Response<void>> deleteProfessionalExperience(
    @Path() String candidateId,
    @Path() String experienceId,
  );

  @Post(path: '/{candidateId}/pro-experiences')
  Future<Response<void>> createProfessionalExperience(
    @Path() String candidateId,
    @Body() NewProfessionalExperience experience,
  );

  @Get(path: '/{candidateId}/educations')
  Future<Response<List<Education>>> educations(@Path() String candidateId);

  @Delete(path: '/{candidateId}/educations/{educationId}')
  Future<Response<void>> deleteEducation(
    @Path() String candidateId,
    @Path() String educationId,
  );

  @Post(path: '/{candidateId}/educations')
  Future<Response<void>> createEducation(
    @Path() String candidateId,
    @Body() NewEducation education,
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

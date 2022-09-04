part of 'candidate_professional_experiences_bloc.dart';

typedef ExpperienceId = String;

@freezed
class CandidateProfessionalExperiencesState
    with _$CandidateProfessionalExperiencesState {
  const CandidateProfessionalExperiencesState._();

  const factory CandidateProfessionalExperiencesState.initial() =
      CandidateProfessionalExperiencesInitial;

  const factory CandidateProfessionalExperiencesState.loading({
    List<ProfessionalExperience>? data,
  }) = CandidateProfessionalExperiencesLoading;

  const factory CandidateProfessionalExperiencesState.error({
    List<ProfessionalExperience>? data,
  }) = CandidateProfessionalExperiencesError;

  const factory CandidateProfessionalExperiencesState.success({
    required List<ProfessionalExperience> experiences,
    required List<String> pe,
  }) = CandidateProfessionalExperiencesSuccess;

  List<ProfessionalExperience>? get data =>
      mapOrNull<List<ProfessionalExperience>?>(
          loading: (s) => s.data, success: (s) => s.data, error: (s) => s.data);
}

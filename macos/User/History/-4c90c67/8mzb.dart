part of 'candidate_edit_education_bloc.dart';

@freezed
class CandidateEditEducationEvent with _$CandidateEditEducationEvent {
  const CandidateEditEducationEvent._();

  const factory CandidateEditEducationEvent.updated({
    required EducationUpdate data,
  }) = CandidateEditEducationUpdated;
}

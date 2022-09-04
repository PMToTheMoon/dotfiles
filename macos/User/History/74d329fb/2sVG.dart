part of 'candidate_educations_bloc.dart';

@freezed
class CandidateEducationsEvent with _$CandidateEducationsEvent {
  const CandidateEducationsEvent._();

  const factory CandidateEducationsEvent.started() = CandidateEducationsStarted;

  const factory CandidateEducationsEvent.updated({
    required EducationUpdate update,
  }) = CandidateEducationsUpdated;

  const factory CandidateEducationsEvent.deleted({
    required String id,
  }) = CandidateEducationsDeleted;
}

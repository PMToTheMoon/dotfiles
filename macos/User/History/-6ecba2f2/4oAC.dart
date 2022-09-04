part of 'candidate_new_education_bloc.dart';

@freezed
class CandidateNewEducationEvent with _$CandidateNewEducationEvent {
  const CandidateNewEducationEvent._();

  const factory CandidateNewEducationEvent.created({
    required NewEducation data,
  }) = CandidateNewEducationCreated;
}

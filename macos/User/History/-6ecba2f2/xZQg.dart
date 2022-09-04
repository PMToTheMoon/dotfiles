part of 'candidate_new_education_bloc.dart';

@freezed
class CandidateNewEductaionEvent with _$CandidateNewEductaionEvent {
  const CandidateNewEductaionEvent._();

  const factory CandidateNewEductaionEvent.created({
    required NewEductaion data,
  }) = CandidateNewEductaionCreated;
}

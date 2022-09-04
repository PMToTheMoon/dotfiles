part of 'candidate_edit_education_bloc.dart';

@freezed
class CandidateEditEductaionEvent with _$CandidateEditEductaionEvent {
  const CandidateEditEductaionEvent._();

  const factory CandidateEditEductaionEvent.updated({
    required EductaionUpdate data,
  }) = CandidateEditEductaionUpdated;
}

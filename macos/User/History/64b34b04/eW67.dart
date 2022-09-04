part of 'patient_list_bloc.dart';

@freezed
class PatientListEvent with _$PatientListEvent {
  const PatientListEvent._();

  const factory PatientListEvent.fetchRequested() = PatientListFetchRequested;
  const factory PatientListEvent.fetchFailed() = PatientListFetchFailed;
  const factory PatientListEvent.fetchSucceed({
    required List<int> data,
  }) = PatientListFetchSucceed;
}

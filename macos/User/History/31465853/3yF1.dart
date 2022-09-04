part of 'patient_list_bloc.dart';

@freezed
class PatientListEvent with _$PatientListEvent {
  const PatientListEvent._();

  const factory PatientListEvent.fetchRequested() = PatientFetchRequested;
  const factory PatientListEvent.fetchFailed() = PatientFetchFailed;
  const factory PatientListEvent.fetchSucceed() = PatientFetchSucceed;
}

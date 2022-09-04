part of 'patient_list_bloc.dart';

@freezed
class PatientListEvent with _$PatientListEvent {
  PatientListEvent._();

  factory PatientListEvent.fetchRequested(
      // query dynamic parameters
      ) = PatientFetchRequested;
  factory PatientListEvent.fetchFailed() = PatientListFetchFailed;
  factory PatientListEvent.fetchSucceed(
    int data,
  ) = PatientFetchSucceed;
}

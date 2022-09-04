part of 'patient_list_bloc.dart';

@freezed
class PatientListEvent with _$PatientListEvent {
  const PatientListEvent._();

  const factory PatientListEvent.fetchRequested(
      // query dynamic parameters
      ) = PatientFetchRequested;
  const factory PatientListEvent.fetchFailed() = PatientFetchFailed;
  const factory PatientListEvent.fetchSucceed(
    int data,
  ) = PatientFetchSucceed;
}

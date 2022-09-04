part of 'patient_list_bloc.dart';

@freezed
class PatientListState with _$PatientListState {
  const factory PatientListState.initial() = PatientListInitial;

  const factory PatientListState.fetching() = PatientListFetching;

  const factory PatientListState.ready(
    Patient patient,
  ) = PatientListReady;

  const factory PatientListState.error() = PatientListError;
}

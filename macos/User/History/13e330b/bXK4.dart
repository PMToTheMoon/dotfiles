part of 'patient_list_bloc.dart';

@freezed
class PatientListState with _$PatientListState {
  const PatientListState._();

  const factory PatientListState.initial({
    required String filter,
  }) = PatientListInitial;

  const factory PatientListState.fetching({
    required String filter,
  }) = PatientListFetching;

  const factory PatientListState.ready({
    required String filter,
    required List<Patienteu> patients,
  }) = PatientListReady;

  const factory PatientListState.error({
    required String filter,
  }) = PatientListError;
}

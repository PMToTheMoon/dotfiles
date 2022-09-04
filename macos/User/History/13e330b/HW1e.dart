part of 'patient_list_bloc.dart';

@freezed
class PatientListState with _$PatientListState {
  const PatientListState._();

  const factory PatientListState.initial() = PatientListInitial;
  const factory PatientListState.fetching() = PatientListFetching;
  const factory PatientListState.ready({
    required List<int> patients,
  }) = PatientListReady;
  const factory PatientListState.error() = PatientListError;
}

part of 'patient_list_bloc.dart';

@freezed
class PatientListState with _$PatientListState {
  const PatientListState._();

  const factory PatientListState.loading() = PatientListLoading;
  const factory PatientListState.ready() = PatientListReady;
  const factory PatientListState.error() = PatientListError;
  const factory PatientListState.empty() = PatientListEmpty;
}

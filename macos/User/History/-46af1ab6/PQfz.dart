part of 'patient_list_bloc.dart';

@freezed
class PatientListState with _$PatientListState {
  const factory PatientList.initial() = PatientListInitial;
  const factory PatientList.fetching() = PatientListFetching;
  const factory PatientList.ready() = PatientListReady;
  const factory PatientList.error() = PatientListError;
}

part of 'patient_list_bloc.dart';

// TODO: implements hash and ==

abstract class PatientListState {}

class PatientListFetching implements PatientListState {}
class PatientListReady implements PatientListState {
class PatientListError implements PatientListState {}


@freezed
class PatientListState with _$PatientListState {
  const factory PatientList.fetching() => PatientListFetching;
const factory PatientList.ready() => PatientListReady;
const factory PatientList.error() => PatientListError;
}

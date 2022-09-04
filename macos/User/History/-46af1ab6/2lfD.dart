part of 'patient_list_bloc.dart';

abstract class PatientListState extends PatientListState {}

abstract class PatientListCanFetch extends PatientListState {}

class PatientListFetching implements PatientListCanFetch {}

class PatientListReady implements PatientListCanFetch {}

class PatientListError implements PatientListCanFetch {}

class PatientListEmpty implements PatientListCanFetch {}

@freezed
class PatientListState with _$PatientListState {
  const PatientListState._();

  const factory PatientListState.fetching() = PatientListFetching;
  const factory PatientListState.ready() = PatientListReady;
  const factory PatientListState.error() = PatientListError;
  const factory PatientListState.empty() = PatientListEmpty;
}

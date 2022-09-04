part of 'patient_list_bloc.dart';

abstract class PatientListState extends PatientListState {}

abstract class PatientListCanFetch extends PatientListState {}

@freezed
class PatientListState with _$PatientListState {
  const PatientListState._();

  const factory PatientListState.fetching() = PatientListFetching;

  @Implements<PatientListCanFetch>()
  const factory PatientListState.ready() = PatientListReady;

  @Implements<PatientListCanFetch>()
  const factory PatientListState.error() = PatientListError;

  @Implements<PatientListCanFetch>()
  const factory PatientListState.empty() = PatientListEmpty;
}

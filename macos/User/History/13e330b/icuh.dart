part of 'patient_list_bloc.dart';

@freezed
class PatientListState with _$PatientListState {
  const PatientListState._();

  const factory PatientListState.initial() = _PatientListState;
  const factory PatientListState.fetching() = _PatientListState;
  const factory PatientListState.ready() = _PatientListState;
  const factory PatientListState.error() = _PatientListState;
}

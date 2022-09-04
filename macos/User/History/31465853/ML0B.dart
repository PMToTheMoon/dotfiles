part of 'patient_list_bloc.dart';

@freezed
class PatientListEvent with _$PatientListEvent {
  const PatientListEvent._();

  const factory PatientListEvent.fetchRequested() = _PatientListEvent;
  const factory PatientListEvent.fetchFailed() = _PatientListEvent;
  const factory PatientListEvent.fetchSucceed() = _PatientListEvent;
}

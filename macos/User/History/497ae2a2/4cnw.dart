part of 'patient_list_bloc.dart';

@freezed
class PatientListEvent with _$PatientListEvent {
  const PatientListEvent._();

  const factory PatientListEvent.fetchRequested({
    required String filter,
    @Default('false') bool force,
  }) = PatientListFetchRequested;
}

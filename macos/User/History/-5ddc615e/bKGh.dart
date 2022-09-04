part of 'patient_details_bloc.dart';

@freezed
class PatientDetailsEvent with _$PatientDetailsEvent {
  const PatientDetailsEvent._();

  const factory PatientDetailsEvent.fetchRequested() =
      PatientDetailsFetchRequested;
}

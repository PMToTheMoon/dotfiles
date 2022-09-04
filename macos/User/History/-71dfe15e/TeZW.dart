part of 'patient_records_bloc.dart';

@freezed
class PatientRecordsEvent with _$PatientRecordsEvent {
  const PatientRecordsEvent._();

  const factory PatientRecordsEvent.fetchRequested() =
      PatientRecordsFetchRequested;
}

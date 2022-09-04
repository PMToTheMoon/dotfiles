part of 'patient_records_bloc.dart';

@freezed
class PatientRecordsState with _$PatientRecordsState {
  const PatientRecordsState._();

  const factory PatientRecordsState.initial() = PatientRecordsInitial;

  const factory PatientRecordsState.fetching() = PatientRecordsFetching;

  const factory PatientRecordsState.ready() = PatientRecordsReady;

  const factory PatientRecordsState.error() = PatientRecordsError;
}

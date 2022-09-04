part of 'patient_details_bloc.dart';

@freezed
class PatientDetailsState with _$PatientDetailsState {
  const PatientDetailsState._();

  const factory PatientDetailsState.initial() = PatientDetailsInitial;

  const factory PatientDetailsState.fetching() = PatientDetailsFetching;

  const factory PatientDetailsState.ready({
    required List<PatientRecord> records,
  }) = PatientDetailsReady;

  const factory PatientDetailsState.error() = PatientDetailsError;
}

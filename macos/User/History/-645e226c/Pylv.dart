const classBody = '''
@freezed
class {{ class }} with _$PatientDetailsState {
  const PatientDetailsState._();

  const factory PatientDetailsState.initial() = PatientDetailsInitial;

  const factory PatientDetailsState.fetching() = PatientDetailsFetching;

  const factory PatientDetailsState.ready({
    required PatientDetails details,
  }) = PatientDetailsReady;

  const factory PatientDetailsState.error() = PatientDetailsError;
}
''';

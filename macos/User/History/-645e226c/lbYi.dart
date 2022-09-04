const constructor = r'''
const factory {{ class }}.{{ constructor.name }}() = PatientDetailsInitial;
''';

const classBody = r'''
@freezed
class {{ class }} with _${{ class }} {
  const {{ class }}._();

  const factory PatientDetailsState.initial() = PatientDetailsInitial;

  const factory PatientDetailsState.fetching() = PatientDetailsFetching;

  const factory PatientDetailsState.ready({
    required PatientDetails details,
  }) = PatientDetailsReady;

  const factory PatientDetailsState.error() = PatientDetailsError;
}
''';

@freezed
class HomeRecordsState with _$HomeRecordsState {
  const HomeRecordsState._();

  const factory HomeRecordsState.initial() = HomeRecordsInitial;

  const factory HomeRecordsState.fetching() = HomeRecordsFetching;

  const factory HomeRecordsState.ready({
    required Record data,
  }) = HomeRecordsReady;

  const factory HomeRecordsState.error() = HomeRecordsError;
}

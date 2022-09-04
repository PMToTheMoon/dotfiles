part of 'lib/home/bloc';

@freezed
class HomeRecordsState with _$HomeRecordsState {
  const HomeRecordsState._();

  const factory HomeRecordsState.test({
    required Test field,
  }) = HomeRecordsTest;
}

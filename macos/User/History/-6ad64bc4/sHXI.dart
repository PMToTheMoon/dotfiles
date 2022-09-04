part of 'home_records_bloc.dart';

@freezed
class HomeRecordsState with _$HomeRecordsState {
  const factory HomeRecordsState.initial() = HomeRecordsInitial;

  const factory HomeRecordsState.fetching() = HomeRecordsFetching;

  const factory HomeRecordsState.ready({required List<Record> data}) =
      HomeRecordsReady;

  const factory HomeRecordsState.error() = HomeRecordsError;
}

part of 'home_records_bloc.dart';

@freezed
class HomeRecordsEvent with _$HomeRecordsEvent {
  const factory HomeRecordsEvent.fetchRequested() = HomeRecordsFetchRequested;
}

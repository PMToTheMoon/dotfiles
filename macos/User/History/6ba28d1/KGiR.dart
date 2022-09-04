part of 'home_records_bloc.dart';

class HomeRecordsState {
  const HomeRecordsState(
      {required this.highPriority,
      required this.inProgress,
      required this.drafts});

  final List<CspUserRecordView> highPriority;

  final List<CspUserRecordView> inProgress;

  final List<CspUserRecordView> drafts;
}

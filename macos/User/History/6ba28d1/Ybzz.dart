part of 'home_records_bloc.dart';

class HomeRecordsState {
  const HomeRecordsState({
    required this.highPriority,
    required this.inProgress,
    required this.drafts,
    this.errored = false,
  });

  final List<CspUserRecordView> highPriority;

  final List<CspUserRecordView> inProgress;

  final List<CspUserRecordView> drafts;

  final bool errored;
}

part of 'home_records_bloc.dart';

class HomeRecordsState {
  const HomeRecordsState(
      {required this.highPriority,
      required this.inProgress,
      required this.drafts});

  final List<RecordCardData> highPriority;

  final List<RecordCardData> inProgress;

  final List<RecordCardData> drafts;
}

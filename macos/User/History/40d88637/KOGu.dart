part of 'home_records_bloc.dart';

class HomeRecordsState {
  const HomeRecordsState(
      {required this.highPriority,
      required this.inProgress,
      required this.drafts});

  final List<CspUserRecord> highPriority;

  final List<CspUserRecord> inProgress;

  final List<CspUserRecord> drafts;
}

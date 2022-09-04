import 'package:zanalys_api/zanalys_api.dart';
import 'home_records_state.dart';

HomeRecordsState _filterRecords(List<CspUserRecord> records) {
  return HomeRecordsState(
    highPriority: highPriority,
    inProgress: inProgress,
    drafts: drafts,
  );
}

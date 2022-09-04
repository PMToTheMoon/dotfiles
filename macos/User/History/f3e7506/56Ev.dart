import 'package:zanalys_api/zanalys_api.dart';
import 'home_records_state.dart';

HomeRecordsState _filterRecords(List<CspUserRecord> records) {
  records.sort((CspUserRecord a, CspUserRecord b) => a.lastModified.compareTo(b.lastModified));
  return HomeRecordsState(
    highPriority: records.where((r) {
      final priority = r.doctorID == doctorId;
    }),
    inProgress: inProgress,
    drafts: ,
  );
}

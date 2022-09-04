import 'package:common/common.dart';
import 'package:zanalys/user/user_service.dart';
import 'home_records_state.dart';

const String doctorId = '';

HomeRecordsState _filterRecords(List<CspUserRecord> records) {
  records.sort((CspUserRecord a, CspUserRecord b) =>
      a.lastModified.compareTo(b.lastModified));
  var hightPriorities = records.where((r) {
    final priority =
        r.doctorID == doctorId ? r.doctorPriority : r.providerPriority;
    return r.priorityFor(doctorId).isHightPriority;
  });
  hi
  return HomeRecordsState(
    highPriority: records
        .where((r) => r.priorityFor(doctorId).isHightPriority)
        .map((e) => RecordCardData.withStatus(
              patientFirstName: patientFirstName,
              patientLastName: patientLastName,
              recordTitle: recordTitle,
              image: image,
              status: e.status,
              progress: e.status.priority,
            ))
        .toList(),
    inProgress: inProgress,
    drafts: a,
  );
}

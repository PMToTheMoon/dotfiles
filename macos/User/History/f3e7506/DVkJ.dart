import 'package:common/common.dart';
import 'package:zanalys/user/user_service.dart';
import 'home_records_state.dart';

late UserService userService;

HomeRecordsState _filterRecords(List<CspUserRecord> records) {
  records.sort((CspUserRecord a, CspUserRecord b) =>
      a.lastModified.compareTo(b.lastModified));
  var hightPriorities = records.where((r) {
    final priority =
        r.doctorID == userId ? r.doctorPriority : r.providerPriority;
    return r.priorityFor(userId).isHightPriority;
  });
  hi
  return HomeRecordsState(
    highPriority: records
        .where((r) => r.priorityFor(userId).isHightPriority)
        .map((e) => RecordCardData.withStatus(
              patientFirstName: patientFirstName,
              patientLastName: patientLastName,
              recordTitle: recordTitle,
              image: image,
              status: e.priorityFor(userId).toCardStatus,
              progress: e.status.priority,
            ))
        .toList(),
    inProgress: inProgress,
    drafts: a,
  );
}

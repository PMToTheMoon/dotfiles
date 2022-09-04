import 'package:common/common.dart';
import 'package:zanalys/user/user_service.dart';
import 'home_records_state.dart';

late UserService userService;

HomeRecordsState? _filterRecords(List<CspUserRecord> records) {
  final userId = userService.user?.id;
  if (userId == null) return null;

  final recordsOldToNew = records.sort(
    ((a, b) => a.lastModified.compareTo(b.lastModified)),
  );
  final recordsNewToOld = records.sort(
    ((a, b) => a.lastModified.compareTo(b.lastModified)),
  );

  return HomeRecordsState(
    highPriority: records
      ..sort((a, b) => 0)
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

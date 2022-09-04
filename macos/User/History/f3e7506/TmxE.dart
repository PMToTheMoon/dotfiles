import 'package:common/common.dart';
import 'package:zanalys/user/user_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;
import 'home_records_state.dart';

late UserService userService;

HomeRecordsState? _filterRecords(List<CspUserRecord> records) {
  final userId = userService.user?.id;
  if (userId == null) return null;

  final recordsOldToNew = List<CspUserRecord>.from(records)
    ..sort(
      ((a, b) => a.lastModified.compareTo(b.lastModified)),
    );
  final recordsNewToOld = List<CspUserRecord>.from(records)
    ..sort(
      ((a, b) => b.lastModified.compareTo(a.lastModified)),
    );

  return HomeRecordsState(
    highPriority: recordsOldToNew
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
    inProgress: recordsNewToOld.where((r) => r.isDraft).toList(),
    drafts: a,
  );
}

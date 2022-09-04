import 'package:zanalys/user/user_service.dart';
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
        .map((e) => e.toRecordCardWithStatusData(userId: userId))
        .toList(),
    inProgress: recordsNewToOld
        .map((e) => e.toRecordCardWithStatusData(userId: userId))
        .toList(),
    drafts: recordsNewToOld
        .where((r) => r.status.isDraft)
        .map((e) => e.toRecordCardWithEditButton(userId: userId))
        .toList(),
  );
}

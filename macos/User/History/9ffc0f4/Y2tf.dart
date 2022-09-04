import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:zanalys/user/user_service.dart';

part 'home_records_state.dart';

class HomeRecordsBloc extends Cubit<HomeRecordsState?> {
  HomeRecordsBloc({
    required this.userService,
    required List<CspUserRecord>? initialRecords,
    required Stream<List<CspUserRecord>?> recordsStream,
  }) : super(null) {
    _streamSubscription = recordsStream.map(_recordsToState).listen(emit);
  }

  final UserService userService;
  late final StreamSubscription<HomeRecordsState?> _streamSubscription;

  HomeRecordsState? _recordsToState(List<CspUserRecord>? records) {
    final userId = userService.user?.id;
    if (userId == null || records == null) return null;

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

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    return super.close();
  }
}

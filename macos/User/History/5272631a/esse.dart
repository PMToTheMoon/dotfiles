import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:models/models.dart';
import 'package:zanalys/user/user_service.dart';

part 'home_records_state.dart';

class HomeRecordsBloc extends Cubit<HomeRecordsState?> {
  HomeRecordsBloc({
    required this.recordService,
    required List<CspUserRecordView>? initialRecords,
    required Stream<List<CspUserRecordView>?> recordsStream,
  }) : super(null) {
    emit(_recordsToState(initialRecords));
    recordService.fetchRecords();
    _streamSubscription = recordsStream.map(_recordsToState).listen(emit);
  }

  final UserService recordService;
  late final StreamSubscription<HomeRecordsState?> _streamSubscription;

  HomeRecordsState? _recordsToState(List<CspUserRecordView>? records) {
    final userId = recordService.user?.id;
    if (userId == null || records == null) return null;

    final recordsOldToNew = List<CspUserRecordView>.from(records)
      ..sort(((a, b) => a.compareByDateTo(b)));
    final recordsNewToOld = List<CspUserRecordView>.from(records)
      ..sort(((a, b) => b.compareByDateTo(a)));

    return HomeRecordsState(
      highPriority: recordsOldToNew
          .where((r) =>
              r.priorityFor(userId).isHightPriority &&
              r.status.isDraft == false)
          .toList(),
      inProgress:
          recordsNewToOld.where((r) => r.status.isDraft == false).toList(),
      drafts: recordsNewToOld.where((r) => r.status.isDraft).toList(),
    );
  }

  Future<void> deleteRecord(String id) async {
    await recordService.deleteRecord(id);
    await recordService.fetchRecords();
  }

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    return super.close();
  }
}

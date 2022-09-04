import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:common/common.dart';
import 'package:models/models.dart';
import 'package:zanalys/record/record_service.dart';

part 'home_records_state.dart';

class HomeRecordsBloc extends Cubit<HomeRecordsState?> {
  HomeRecordsBloc({
    required this.userId,
    required this.recordService,
    required List<CspUserRecordView>? initialRecords,
    required Stream<List<CspUserRecordView>?> recordsStream,
  }) : super(null) {
    emit(_recordsToState(initialRecords));
    recordService.fetchRecords();
    _streamSubscription = recordsStream.map(_recordsToState).listen(emit);
  }

  final String userId;
  final RecordService recordService;
  late final StreamSubscription<HomeRecordsState?> _streamSubscription;

  HomeRecordsState? _recordsToState(List<CspUserRecordView>? records) {
    if (records == null) return null;

    records.map((r) {});
    // todo: map find coreect record list

    final recordsOldToNew = List<CspUserRecordView>.from(records)
      ..sort(((a, b) => a.compareByCreationDateTo(b)));
    final recordsNewToOld = List<CspUserRecordView>.from(records)
      ..sort(((a, b) => b.compareByDateTo(a)));

    final state = HomeRecordsState(
      highPriority: recordsOldToNew
          .where((r) =>
              r.priorityFor(userId).isHightPriority &&
              r.status.isDraft == false)
          .toList(),
      inProgress:
          recordsNewToOld.where((r) => r.status.isDraft == false).toList(),
      drafts: recordsNewToOld.where((r) => r.status.isDraft).toList(),
    );
    return state;
  }

  Future<void> deleteRecord(String id) async {
    try {
      await recordService.deleteRecord(id);
      await recordService.fetchRecords();
    } catch (e) {
      emit(HomeRecordsState(
        highPriority: state?.highPriority ?? [],
        inProgress: state?.inProgress ?? [],
        drafts: state?.drafts ?? [],
        hasError: true,
      ));
    }
  }

  @override
  Future<void> close() async {
    await _streamSubscription.cancel();
    return super.close();
  }
}

CspUserRecordView _effectiveRecordForUser(
    String userId, CspUserRecordView root) {
  if (root.doctorId == userId) return root;
}

CspUserRecordView _effectiveChildRecordForUser(
  String userId,
  CspUserRecordView root,
) {
  if (root.doctorId == userId) return root;
}

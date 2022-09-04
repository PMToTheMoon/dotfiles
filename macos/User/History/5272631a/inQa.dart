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

    records = records.map((r) => _effectiveRecordForUser(userId, r)).toList();

    final recordsOldToNew = List<CspUserRecordView>.from(records)
      ..sort(((a, b) => a.compareByDateWithCreationDateFallback(b)));
    final recordsNewToOld = List<CspUserRecordView>.from(records)
      ..sort(((a, b) => b.compareByDateWithCreationDateFallback(a)));

    final state = HomeRecordsState(
      highPriority: recordsOldToNew
          .where((r) =>
              r.priorityFor(userId).isHightPriority &&
              r.status.isDraft == false)
          .toList(),
      inProgress: recordsNewToOld.toList(),
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
  String userId,
  CspUserRecordView root,
) {
  if (root.doctorId == userId) return root;
  if (root.childRecords?.isNotEmpty == true) {
    for (final child in root.childRecords ?? []) {
      final res = _effectiveChildRecordForUser(userId, child);
      if (res != null) {
        return CspUserRecordView(
          id: res.id,
          status: res.status,
          doctorPriority: res.priorityForDoctor,
          providerPriority: res.priorityForProvider ?? root.providerPriority,
          doctorId: res.doctorId ?? root.doctorId,
          dateCreated: root.dateCreated,
          lastModified: root.lastModified,
          patientId: root.patientId,
          patientLastName: root.patientLastName,
          patientFirstName: root.patientFirstName,
          recordType: res.type,
        );
      }
    }
  }
  return root;
}

CspUserRecordViewChildRecord? _effectiveChildRecordForUser(
  String userId,
  CspUserRecordViewChildRecord root,
) {
  if (root.providerId == userId) return root;
  if (root.childRecords?.isNotEmpty == true) {
    for (final child in root.childRecords ?? []) {
      final res = _effectiveChildRecordForUser(userId, child);
      if (res != null) return res;
    }
  }
  return null;
}

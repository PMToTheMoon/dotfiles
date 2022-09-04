import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;
import 'package:common/common.dart' as common;

typedef CspUserRecord = api.CspUserRecord;

typedef RecordPriority = api.RecordPriority;

typedef RecordStatus = api.RecordStatus;

// TODO: create record service
extension ToRecordCardStatus on RecordPriority {
  common.Status get toCardStatus {
    switch (this) {
      case RecordPriority.low:
        return common.Status.green;
      case RecordPriority.medium:
        return common.Status.yellow;
      case RecordPriority.hight:
        return common.Status.red;
    }
  }
}

// TODO: create record service
extension GetPriority on CspUserRecord {
  common.RecordCardWithStatusData toRecordCardWithStatusData({
    required String userId,
  }) =>
      common.RecordCardWithStatusData(
        patientFirstName: date.toString(),
        patientLastName: patientLastName,
        recordTitle: recordType,
        image: GetIt.I.get<common.AvatarCacheService>().avatar(patientId),
        status: priorityFor(userId).toCardStatus,
        progress: status.progress,
      );

  common.RecordCardWithEditButtonData toRecordCardWithEditButtonData({
    required String userId,
    required VoidCallback? onDelete,
  }) =>
      common.RecordCardWithEditButtonData(
        patientFirstName: date.toString(),
        patientLastName: patientLastName,
        recordTitle: recordType,
        image: GetIt.I.get<common.AvatarCacheService>().avatar(patientId),
        onDelete: onDelete,
      );

  RecordPriority priorityFor(String id) {
    if (doctorId == id) return doctorPriority;
    return providerPriority;
  }

  DateTime get date => dateCreated;

  int compareByDateTo(CspUserRecord other) {
    return date.compareTo(other.date);
  }
}

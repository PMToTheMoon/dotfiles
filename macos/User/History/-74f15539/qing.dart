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
    required VoidCallback? onTap,
  }) =>
      common.RecordCardWithStatusData(
        patientFirstName: patientFirstName,
        patientLastName: patientLastName,
        recordTitle: recordType,
        image: GetIt.I.get<common.AvatarCacheService>().avatar(patientId),
        status: priorityFor(userId).toCardStatus,
        progress: status.priority,
        onTap: onTap,
      );

  common.RecordCardWithEditButtonData toRecordCardWithEditButtonData({
    required String userId,
    required VoidCallback? onTap,
    required VoidCallback? onDelete,
  }) =>
      common.RecordCardWithEditButtonData(
        patientFirstName: patientFirstName,
        patientLastName: patientLastName,
        recordTitle: recordType,
        image: GetIt.I.get<common.AvatarCacheService>().avatar(patientId),
        onTap: onTap,
        onDelete: onDelete,
      );

  RecordPriority priorityFor(String id) {
    if (doctorId == id) return doctorPriority;
    return providerPriority;
  }

  DateTime get date => lastModified ?? dateCreated;

  int compareByDateTo(CspUserRecord other) {
    return date.compareTo(other.date);
  }
}

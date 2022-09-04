import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:common/common.dart' as common;
import 'package:models/models.dart';

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
extension CspUserRecordUtils on CspUserRecord {
  common.RecordCardWithStatusData toRecordCardWithStatusData(
    BuildContext context, {
    required String userId,
  }) =>
      common.RecordCardWithStatusData(
        patientFirstName: patientFirstName,
        patientLastName: patientLastName,
        recordTitle: recordType.displayName(context),
        image: GetIt.I.get<common.AvatarCacheService>().avatar(patientId),
        status: priorityFor(userId).toCardStatus,
        progress: status.progress,
      );

  common.RecordCardWithEditButtonData toRecordCardWithEditButtonData(
    BuildContext context, {
    required String userId,
    required VoidCallback? onDelete,
  }) =>
      common.RecordCardWithEditButtonData(
        patientFirstName: patientFirstName,
        patientLastName: patientLastName,
        recordTitle: recordType.displayName(context),
        image: GetIt.I.get<common.AvatarCacheService>().avatar(patientId),
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

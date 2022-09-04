// TODO: create record service
import 'package:common/common.dart';
import 'package:flutter/material.dart';
import 'package:models/models.dart';

extension ToRecordCardStatus on RecordPriority {
  Status get toCardStatus {
    switch (this) {
      case RecordPriority.low:
        return Status.green;
      case RecordPriority.medium:
        return Status.yellow;
      case RecordPriority.hight:
        return Status.red;
    }
  }
}

// TODO: create record service
extension CspUserRecordUtils on CspUserRecordView {
  RecordCardWithStatusData toRecordCardWithStatusData(
    BuildContext context, {
    required String userId,
    required AvatarCacheService avatarCacheService,
  }) =>
      RecordCardWithStatusData(
        patientFirstName: lastModified.toString(), //patientFirstName,
        patientLastName: '', //patientLastName,
        recordTitle: dateCreated.toString(), //recordType.displayName(context),
        image: avatarCacheService.avatar(patientId),
        status: priorityFor(userId).toCardStatus,
        progress: status.progress,
      );

  RecordCardWithEditButtonData toRecordCardWithEditButtonData(
    BuildContext context, {
    required String userId,
    required VoidCallback? onDelete,
    required AvatarCacheService avatarCacheService,
  }) =>
      RecordCardWithEditButtonData(
        patientFirstName: lastModified.toString(), //patientFirstName,
        patientLastName: '', //patientLastName,
        recordTitle: dateCreated.toString(), //recordType.displayName(context),
        image: avatarCacheService.avatar(patientId),
        onDelete: onDelete,
      );

  RecordPriority priorityFor(String id) {
    if (doctorId == id) return doctorPriority;
    return providerPriority;
  }

  DateTime get date => lastModified ?? dateCreated;

  int compareByDateWithCreationDateFallback(CspUserRecordView other) {
    final res = compareByDateTo(other);
    if (res == 0) {
      return dateCreated.compareTo(other.dateCreated);
    } else {
      return res;
    }
  }

  int compareByDateTo(CspUserRecordView other) {
    return date.compareTo(other.date);
  }
}

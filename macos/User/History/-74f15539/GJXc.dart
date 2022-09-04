import 'package:flutter/material.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;
import 'package:common/common.dart' as common;

typedef CspUserRecord = api.CspUserRecord;

typedef RecordPriority = api.RecordPriority;

typedef RecordStatus = api.RecordStatus;

extension ToRecordCardStatus on RecordPriority {
  common.Status get toCardStatus {
    switch (this) {
      case RecordPriority.low:
        return common.Status.low;
      case RecordPriority.medium:
        return common.Status.medium;
      case RecordPriority.hight:
        return common.Status.hight;
    }
  }
}

extension GetPriority on CspUserRecord {
  common.RecordCardWithStatusData toRecordCardWithStatusData({
    required String userId,
  }) =>
      common.RecordCardWithStatusData(
        patientFirstName: patientFirstName,
        patientLastName: patientLastName,
        recordTitle: recordType,
        image: AssetImage(common.Assets.images.launcherIcon.path),
        status: priorityFor(userId).toCardStatus,
        progress: status.priority,
      );

  common.RecordCardWithEditButtonData toRecordCardWithEditButton({
    required String userId,
  }) =>
      common.RecordCardWithEditButtonData(
        patientFirstName: patientFirstName,
        patientLastName: patientLastName,
        recordTitle: recordType,
        image: AssetImage(common.Assets.images.launcherIcon.path),
      );

  RecordPriority priorityFor(String id) {
    if (doctorID == id) return doctorPriority;
    return providerPriority;
  }

  DateTime get lastKnowDate => lastModified ?? dateCreated;

  int compareByDateTo(CspUserRecord other) {
    return lastKnowDate.compareTo(other.lastKnowDate);
  }
}

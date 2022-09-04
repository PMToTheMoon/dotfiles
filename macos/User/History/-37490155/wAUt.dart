// TODO: create record service
import 'package:common/common.dart';
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

  int compareByDateTo(CspUserRecordView other) {
    return date.compareTo(other.date);
  }
}

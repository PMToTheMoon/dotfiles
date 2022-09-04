import 'package:models/models.dart';

extension PatientRecordProgress on PatientRecordView {
  RecordPriority priorityFor(String id) {
    if (doctorId == id) return doctorPriority;
    return providerPriority;
  }
}

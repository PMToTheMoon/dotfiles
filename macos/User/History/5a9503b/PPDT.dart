import 'package:zanalys/user/models/record.dart';

extension PatientRecordProgress on PatientRecordView {
  RecordPriority priorityFor(String id) {
    if (doctorId == id) return doctorPriority;
    return providerPriority;
  }
}

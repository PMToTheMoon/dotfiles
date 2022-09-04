import 'package:zanalys/user/models/record.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

typedef PatientRecord = api.PatientRecord;

extension PatientRecordProgress on PatientRecord {
  RecordPriority priorityFor(String id) {
    if (doctorId == id) return doctorPriority;
    return providerPriority;
  }
}

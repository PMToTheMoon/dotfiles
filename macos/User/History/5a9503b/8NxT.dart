import 'package:zanalys/user/models/record.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

typedef PatientRecordView = api.PatientRecordView;

extension PatientRecordProgress on PatientRecordView {
  RecordPriority priorityFor(String id) {
    if (doctorId == id) return doctorPriority;
    return providerPriority;
  }
}

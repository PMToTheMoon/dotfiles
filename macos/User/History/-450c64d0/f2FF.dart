import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

import 'models/patient_details.dart';
import 'models/patient_record.dart';
export 'models/patient_record.dart';

class PatientService {
  PatientService({
    required this.authService,
    required AppEnvironment environment,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  final AuthService authService;

  late final api.ZanalysPrivateApiClient _client;

  Future<List<PatientRecord>> patientRecords(String id) async {
    return _client.patientRecords(id);
  }

  Future<PatientDetails> patientDetails(String id) async {
    return _client.patientDetails(id);
  }
}

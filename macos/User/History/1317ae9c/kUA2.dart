import 'package:models/models.dart';
import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys/user/user_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

import 'models/patient_details.dart';
import 'models/patient_record.dart';
export 'models/patient_record.dart';

class DoctorService {
  DoctorService({
    required this.authService,
    required this.userService,
    required AppEnvironment environment,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  final AuthService authService;
  final UserService userService;

  late final api.ZanalysPrivateApiClient _client;

  Future<List<Doctor>> fetchAcceptedNetworkDoctors() async {
    final id = userService.user?.id;
    if (id == null) throw 'Unauthorized';
    final networkDoctors = await userService.fetchNetworkDoctors();
  }

  Future<PatientDetails> patientDetails(String id) async {
    return _client.patientDetails(id);
  }
}

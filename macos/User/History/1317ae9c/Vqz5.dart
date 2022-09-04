import 'package:models/models.dart';
import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys/user/user_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

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
    final establishments = await _client.doctorEstablishments(id);
    return <Doctor>[
      ...establishments.expand((e) => e.doctors),
      ...networkDoctors.where((doctor) => doctor.acceptedDate != null).map(
            (d) => Doctor(
              id: id,
              firstName: d.firstName,
              lastName: d.lastName,
              job: d.job,
              specialty: d.specialty,
            ),
          ),
    ];
  }
}

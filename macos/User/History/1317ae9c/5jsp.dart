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

  /// The list of doctor's establishments, indexed by doctor id.
  final _doctorsEstablishments = <String, List<Establishment>>{};

  Future<Set<Doctor>> fetchAcceptedNetworkDoctors() async {
    final id = userService.user?.id;
    if (id == null) throw 'Unauthorized';
    final networkDoctors = await userService.fetchNetworkDoctors();
    final establishments = await _client.doctorEstablishments(id);
    _doctorsEstablishments[id] = establishments;
    return <Doctor>{
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
    };
  }

  /// Retrurn doctor's establishment list from cache or fetch it if not present
  Future<List<Establishment>> establishsments(String doctorId) async {
    final cachedList = _doctorsEstablishments[doctorId];
    if (cachedList != null) {
      return cachedList;
    }
    final establishments = await _client.doctorEstablishments(doctorId);
    _doctorsEstablishments[doctorId] = establishments;
    return establishments;
  }
}

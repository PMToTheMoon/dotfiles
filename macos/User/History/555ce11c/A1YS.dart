import 'dart:async';

import 'package:models/models.dart';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

class UserService {
  UserService({
    required this.storage,
    required this.authService,
    required AppEnvironment environment,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: false, //environment.isDebugBuild,
      authenticationProvider: authService,
    );
  }

  final AuthService authService;

  final StorageService storage;

  late final api.ZanalysPrivateApiClient _client;

  late final StreamSubscription<User> _loginUserStream;

  final _networkDoctorsStream =
      StreamController<List<NetworkDoctor>>.broadcast();

  List<NetworkDoctor>? _networkDoctors;

  User? get user => authService.user;

  Stream<User> get userStream => authService.userStream;

  Stream<List<NetworkDoctor>> get networkDoctorsStream =>
      _networkDoctorsStream.stream;

  List<NetworkDoctor>? get networkDoctors => _networkDoctors;

  Future<void> dispose() async {
    await _loginUserStream.cancel();
  }

  Future<void> updatePushToken({required String token}) =>
      _client.updatePushToken(token: token);

  Future<List<Patient>> fetchPatients([String? filter]) async {
    return _client.patientListForDoctor(user!.id!,
        length: 100,
        filters: filter != null
            ? [
                {'nomPrenom': filter}
              ]
            : null);
  }

  Future<List<NetworkDoctor>> fetchNetworkDoctors() async {
    if (user == null) throw 'Unauthorized';
    final doctors = await _client.doctorNetwork(user!.id!);
    _networkDoctors = doctors;
    _networkDoctorsStream.add(doctors);
    return doctors;
  }
}

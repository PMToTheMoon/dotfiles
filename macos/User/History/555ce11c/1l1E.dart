import 'dart:async';

import 'package:models/models.dart';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

import 'models/record.dart';
import 'models/user.dart';

export 'models/user.dart';
export 'models/record.dart';

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

  final _recordsStream = StreamController<List<CspUserRecord>>.broadcast();

  List<CspUserRecord>? _records;

  final _networkDoctorsStream =
      StreamController<List<NetworkDoctor>>.broadcast();

  List<NetworkDoctor>? _networkDoctors;

  User? get user => authService.user;

  Stream<User> get userStream => authService.userStream;

  List<CspUserRecord>? get records => _records;

  Stream<List<CspUserRecord>> get recordsStream => _recordsStream.stream;

  Stream<List<NetworkDoctor>> get networkDoctorsStream =>
      _networkDoctorsStream.stream;

  List<NetworkDoctor>? get networkDoctors => _networkDoctors;

  Future<void> dispose() async {
    await _loginUserStream.cancel();
  }

  Future<void> updatePushToken({required String token}) =>
      _client.updatePushToken(token: token);

  Future<void> fetchRecords() async {
    if (user == null) return;
    final records = await _client.cspUserRecords(user!.id!);
    _records = records;
    _recordsStream.add(records);
  }

  Future<void> deleteRecord(String id) async {
    await _client.deleteRecord(id);
    await fetchRecords();
  }

  Future<List<Patienteu>> fetchPatients([String? filter]) async {
    return _client.patientListForDoctor(user!.id!,
        length: 100,
        filters: filter != null
            ? [
                {'nomPrenom': filter}
              ]
            : null);
  }

  Future<void> fetchNetworkDoctors() async {
    if (user == null) return;
    final doctors = await _client.doctorNetwork(user!.id!);
    _networkDoctors = doctors;
    _networkDoctorsStream.add(doctors);
  }
}

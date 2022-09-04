import 'dart:async';

import 'package:zanalys/app/environment.dart';
import 'package:zanalys/auth/services/auth_service.dart';
import 'package:zanalys/storage/storage_service.dart';
import 'package:zanalys_api/zanalys_api.dart' as api;

import 'models/patient.dart';
import 'models/record.dart';
import 'models/user.dart';

export 'models/user.dart';
export 'models/record.dart';
export 'models/patient.dart';

class UserService {
  UserService({
    required this.storage,
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

  final StorageService storage;

  late final api.ZanalysPrivateApiClient _client;

  late final StreamSubscription<User> _loginUserStream;

  final _recordsStream = StreamController<List<CspUserRecord>>.broadcast();

  List<CspUserRecord>? _records;

  User? get user => authService.user;

  Stream<User> get userStream => authService.userStream;

  List<CspUserRecord>? get records => _records;

  Stream<List<CspUserRecord>> get recordsStream => _recordsStream.stream;

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

  Future<List<Patient>> fetchPatients([String? filter]) async {
    return _client.patientListForDoctor(user!.id!,
        length: 100,
        filters: filter != null
            ? [
                {'nom': filter}
              ]
            : null);
  }
}

import 'dart:async';

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
    required AppEnvironment environment,
    required AuthService authService,
  }) {
    _client = api.ZanalysPrivateApiClient(
      environment.rootURL,
      isDebug: environment.isDebugBuild,
      authenticationProvider: authService,
    );
    _loginUserStream = authService.userStream.listen(_onLoginUserReceived);
  }

  final StorageService storage;

  late final StreamSubscription<User> _loginUserStream;

  final _userStream = StreamController<User>.broadcast();

  final _recordsStream = StreamController<List<CspUserRecord>>.broadcast();

  User? _user;

  List<CspUserRecord>? _records;

  User? get user => _user;

  Stream<User> get userStream => _userStream.stream;

  List<CspUserRecord>? get records => _records;

  Stream<List<CspUserRecord>> get recordsStream => _recordsStream.stream;

  Future<UserService> init() async {
    _user = await storage.getUser();
    return this;
  }

  Future<void> dispose() async {
    await _loginUserStream.cancel();
    await _userStream.close();
  }

  Future<void> updatePushToken({required String token}) =>
      _client.updatePushToken(token: token);

  Future<void> fetchRecords() async {
    if (_user == null) return;
    final records = await _client.getCspUserRecords(id: _user!.id!);
    _records = records;
    _recordsStream.add(records);
  }

  Future<void> _onLoginUserReceived(User user) async {
    _user = user;
    _userStream.add(user);
  }

  late final api.ZanalysPrivateApiClient _client;
}

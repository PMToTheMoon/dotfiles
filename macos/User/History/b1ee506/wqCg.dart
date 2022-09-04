import 'package:tech_by_tech/auth/auth.dart';
import 'package:tbt_api/tbt_api.dart';
import 'dart:async';

class UserRepository {
  UserRepository({required AuthRepository authRepository})
      : _user = authRepository.tbtPrivateClient.user,
        _candidate = authRepository.tbtPrivateClient.candidate;

  final UserService _user;

  final CandidateService _candidate;

  final List<Job> _jobs;

  late final StreamController<List<Job>> _jobsStreamController =
      StreamController<List<Job>>.broadcast();

  Future<void> updateAccountInformation(
      String id, UserAccountInformationUpdate update) async {
    return _user
        .updateAccountInformation(id, update, id: id, update: update)
        .then((r) => r.unwrapOrThrow('unable to fetch user account'));
  }

  List<Job> get jobs => _jobs;

  Stream<List<Job>> get jobsStream => _jobsStreamController.stream;

  Future<String> getUserName(String id) async {
    return _user
        .getUserName(id, id: id)
        .then((r) => r.unwrapOrThrow('unable to fetch user name'));
  }
}

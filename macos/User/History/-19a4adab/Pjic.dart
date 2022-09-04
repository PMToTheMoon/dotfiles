import 'package:dio/dio.dart';
import 'package:zanalys_api/src/user_api/user_api.dart';

mixin RecordApiMixin {
  String get baseUrl;
  Dio get dio;

  late final _user = UserAPI(dio, baseUrl: baseUrl);

  Future<void> updatePushToken({required String token}) {
    return _user.updatePushToken(UpdatePushTokenBody(token: token));
  }

  Future<PatientDetails> patientDetails(String id) async {
    final response = await _user.details(id);
    return response.mapOrNull(patient: (patient) => patient.user)!;
  }
}

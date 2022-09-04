import 'package:dio/dio.dart';
import 'package:zanalys_api/src/network/request/update_push_token_body.dart';
import 'package:zanalys_api/src/user_api/models/user_details.dart';
import 'package:zanalys_api/src/user_api/user_api.dart';

mixin UserApiMixin {
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

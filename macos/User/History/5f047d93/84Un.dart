import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/record_api/models/update_record_request.dart';
import 'package:zanalys_api/src/record_api/models/full_record_response.dart';

import 'models/general_record_update.dart';

export 'models/medical_information/general_record_update_medical_information.dart';
export 'models/general_record_update.dart';
export 'models/update_record_request.dart';

part 'record_api.g.dart';

@RestApi()
abstract class RecordAPI {
  factory RecordAPI(Dio dio, {String baseUrl}) = _RecordAPI;

  Dio get _dio;

  @GET('/api/dossier/cpsUser/{id}/dossiers')
  Future<List<CspUserRecordView>> cspUserRecords(@Path('id') String id);

  @GET('/api/dossier/patient/{id}/dossiers')
  Future<List<PatientRecordView>> patientRecords(@Path('id') String id);

  /// Return record id
  @POST('/api/dossier/init')
  Future<String> newRecords(@Body() NewRecord body);

  @DELETE('/api/dossier/{id}')
  Future<void> deleteRecord(@Path('id') String id);

  @GET('/api/dossier/{id}')
  Future<FullRecordResponse> fullRecord(@Path('id') String id);

  // @POST('/api/dossier/modifier')
  // Future<FullRecordResponse> updateGeneralRecord(
  //   @Body() GeneralRecordUpdateRequest request,
  // );

  // @POST('/api/dossier/modifier')
  // Future<void> updateGeneralRecord(
  //   @Body() GeneralRecordUpdate request,
  // );

  Future<String> data(GeneralRecordUpdate request) async {
    final json = request.toJson();
    // json['filterParameters'] = jsonEncode(request.filters);
    final formData = FormData.fromMap({
      'jsonData': json,
    });
    var response = await _dio.post(
      '/api/dossier/modifier',
      data: formData,
    );
    return response.data;
  }
}

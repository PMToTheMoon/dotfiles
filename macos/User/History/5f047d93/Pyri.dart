import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/record_api/models/edit_record_request.dart';
import 'package:zanalys_api/src/record_api/models/full_record_response.dart';

part 'record_api.g.dart';

@RestApi()
abstract class RecordAPI {
  factory RecordAPI(Dio dio, {String baseUrl}) = _RecordAPI;

  @GET('/api/dossier/cpsUser/{id}/dossiers')
  Future<List<CspUserRecordView>> cspUserRecords(@Path('id') String id);

  @GET('/api/dossier/patient/{id}/dossiers')
  Future<List<PatientRecordView>> patientRecords(@Path('id') String id);

  @POST('/api/dossier/init')
  Future<void> newRecords(@Body() NewRecord body);

  @DELETE('/api/dossier/{id}')
  Future<void> deleteRecord(@Path('id') String id);

  @GET('/api/dossier/{id}')
  Future<FullRecordResponse> fullRecord(@Path('id') String id);

  @POST('/api/dossier/modifier')
  Future<FullRecordResponse> updateGeneralRecord(
    @Body() EditRecordRequest request,
  );
}

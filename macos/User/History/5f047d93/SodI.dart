import 'package:dio/dio.dart';
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';

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
  Future<Record> fullRecord(@Path('id') String id);
}

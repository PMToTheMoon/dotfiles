import 'package:dio/dio.dart' hide Headers;
import 'package:models/models.dart';
import 'package:retrofit/retrofit.dart';
import 'package:zanalys_api/src/record_api/models/new_rapport/new_rapport.dart';
import 'package:zanalys_api/src/record_api/models/full_record_response.dart';

export 'models/medical_information/general_record_update_medical_information.dart';
export 'models/general_record_update.dart';

part 'record_api.g.dart';

@RestApi()
abstract class RecordAPI {
  factory RecordAPI(Dio dio, {String baseUrl}) = _RecordAPI;

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

  @POST('/api/dossier/{id}/complements')
  Future<void> addComplementToRecord(
    @Path('id') String recordId,
    @Body() RecordComplement complement,
  );

  @POST('/api/dossier/rapport/envoyer')
  Future<void> addRapportToRecord(
    @Body() NewRapport rapport,
  );

  @POST('/api/dossier/{id}/ajouterPrestataire')
  Future<void> addDoctorToRecord(
    @Path('id') recordId,
    @Body() DoctorServiceRequest serviceRequest,
  );
}

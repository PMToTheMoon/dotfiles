import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:logging/logging.dart';
import 'package:models/models.dart';
import 'package:zanalys_api/src/establishment/establishment_api.dart';
import 'package:zanalys_api/src/record_api/models/general_record_update.dart';
import 'package:zanalys_api/src/record_api/models/update_record_request.dart';
import 'package:zanalys_api/src/user_api/models/user_details.dart';

import 'grid_api/models/grid_request.dart';
import 'models/document_type.dart';
import 'network/api/document_api.dart';
import 'network/mappers/document_type_mapper.dart';
import 'network/request/update_push_token_body.dart';

import 'record_api/record_api.dart';

import 'patient_api/patient_api.dart';

import 'grid_api/models/grid_patient_response.dart';
import 'grid_api/grid_api.dart';

import '_dio.dart';
import 'user_api/user_api.dart';

export 'record_api/record_api.dart';

final _log = Logger('ZanalysPrivateApiClient');

typedef BearerTokenProvider = String? Function();

typedef RefreshTokenCallback = FutureOr<void> Function();

abstract class AuthenticationProvider {
  String? get bearerToken;
  FutureOr<void> refreshBearerToken();
}

class ZanalysPrivateApiClient {
  factory ZanalysPrivateApiClient(
    String baseUrl, {
    bool isDebug = false,
    required AuthenticationProvider authenticationProvider,
  }) {
    final dio = _createDioAuthClient(
      baseUrl: baseUrl,
      isDebug: isDebug,
      tokenProvider: () => authenticationProvider.bearerToken,
      refreshTokenCallback: authenticationProvider.refreshBearerToken,
    );
    return ZanalysPrivateApiClient._(baseUrl, dio);
  }

  final Dio _dio;

  final DocumentAPI _document;

  final UserAPI _user;

  final PatientAPI _patient;

  final RecordAPI _record;

  final GridAPI _grid;

  final EstablishmentAPI _establishment;

  Future<String?> uploadDocument({
    required String path,
    required String accessCode,
    required DocumentType type,
  }) {
    return _document.upload(
        DocumentTypeMapper().convert(type).toString(), accessCode, File(path));
  }

  Future<void> updatePushToken({required String token}) {
    return _user.updatePushToken(UpdatePushTokenBody(token: token));
  }

  Future<PatientDetails> patientDetails(String id) async {
    final response = await _user.details(id);
    return response.mapOrNull(patient: (patient) => patient.user)!;
  }

  // RECORDS
  Future<List<CspUserRecordView>> cspUserRecords(String id) async {
    return _record.cspUserRecords(id);
  }

  Future<List<PatientRecordView>> patientRecords(String id) async {
    return _record.patientRecords(id);
  }

  /// Returns the newly created record id
  Future<String> newRecord(NewRecord record) async {
    return _record.newRecords(record);
    // return _record.newRecords(NewRecordBody(record: record));
  }

  // Future<void> updateGeneralRecord(GeneralRecordUpdate update) async {
  //   return _record.updateGeneralRecord(update);
  // }

  // Retroshit workaround. We need to remove this dependency.
  Future<void> updateGeneralRecord(GeneralRecordUpdate request) async {
    final json = request.toJson();

    final formData = FormData.fromMap({
      // "jsonData": jsonEncode(request),
      "jsonData": jsonEncode({
        "dossiersEnfants": [],
        "type": "MULTI",
        "reference": "DM623931092139",
        "dateCreation": "19/07/2022",
        "createur": "UC784697264139",
        "dateEnvoi": null,
        "dateMiseAJour": null,
        "dateCloture": null,
        "dateAffectation": null,
        "accordPatient": true,
        "accordPersonneConfiance": false,
        "nomPersConfiance": "not specified",
        "prenomPersConfiance": "not specified",
        "lienParentePersConfiance": "not specified",
        "statut": "NOUVEAU",
        "statutPatient": null,
        "statutPrestataire": null,
        "medecin": "UC784697264139",
        "delegue": null,
        "etablissement": "EC118838963582",
        "datePaiement": null,
        "groupeAffectation": null,
        "avisMedecin": null,
        "dateAvisMedecin": null,
        "dateValidationRapport": null,
        "toValidateOrToReturn": null,
        "paymentCode":
            "I5jOgUVceEBIwrhfNQnm0p+zv4aQgz+/oHBPMLRVDd8FlaZmZi7pycBpmgvRh1X+jWK10fesGPn7vd7+n0jxLaCjHHK4Dp0WwgNA7pjTf+U=",
        // "uploadedFilesToMakeDownloadableList": [],
        "billedToEstablishment": false,
        "urgent": false,
        "prestataireRdvId": null,
        "motif": null,
        "prioriteMedecin": "LOWEST",
        "prioritePrestataire": "LOWEST",
        // "prestationDemandee": "TE",
        "typePrestation": null,
        "presentielRdvMode": null,
        "dossierParentReference": null,
        "titre": null,
        "complements": [],
        "motifText": null,
        "examensComplementaires": null,
        // "rapportMulti": {},
        "medecinNom": "CARDIO",
        "medecinPrenom": "Jean",
        "medecinSpecialite": {
          "identifiant": 2,
          "libelleFR": "Cardiologie et maladies vasculaires"
        },
        "contexteMedical": {
          "antecedentsFamilles": [],
          "antecedentsFamillesText": [],
          "cvRisksSet": [],
          "symptomes": [],
          "symptomesText": [],
          "douleurCaracteristiques": [],
          "identifiant": 919,
          "epworth": null,
          "antecedentsFamillesDefini": false,
          "cvRisks": false,
          "symptomesDefini": false,
          "douleurCaracteristiquesDefini": false
        },
        "informationMedicale": {
          "currentMedicaments": [],
          "identifiant": 860,
          "poids": "1",
          "taille": "2",
          "temperature": null,
          "frequenceCardiaque": null,
          "suspicionSAS": null,
          "fumeur": null,
          "alcool": null,
          "fumerFrequence": null,
          "alcoolFrequence": null,
          "indexMasseCorporelle": 2500,
          "commentaire": "a",
          "arterialPressurePas": null,
          "arterialPressurePad": null
        }
      })
      //'{"dossiersEnfants":[],"type":"MULTI","reference":"DM623931092139","dateCreation":"19/07/2022","createur":"UC784697264139","dateEnvoi":null,"dateMiseAJour":null,"dateCloture":null,"dateAffectation":null,"accordPatient":true,"accordPersonneConfiance":false,"nomPersConfiance":"not specified","prenomPersConfiance":"not specified","lienParentePersConfiance":"not specified","statut":"NOUVEAU","statutPatient":null,"statutPrestataire":null,"medecin":"UC784697264139","delegue":null,"etablissement":"EC118838963582","prestataire":"UC611348556272","datePaiement":null,"groupeAffectation":null,"avisMedecin":null,"dateAvisMedecin":null,"dateValidationRapport":null,"toValidateOrToReturn":null,"paymentCode":"I5jOgUVceEBIwrhfNQnm0p+zv4aQgz+/oHBPMLRVDd8FlaZmZi7pycBpmgvRh1X+jWK10fesGPn7vd7+n0jxLaCjHHK4Dp0WwgNA7pjTf+U=","uploadedFilesToMakeDownloadableList":[],"billedToEstablishment":false,"urgent":false,"prestataireRdvId":null,"motif":null,"prioriteMedecin":"LOWEST","prioritePrestataire":"LOWEST","prestationDemandee":"TE","typePrestation":null,"presentielRdvMode":null,"dossierParentReference":null,"titre":null,"complements":[],"motifText":null,"examensComplementaires":null,"rapportMulti":{},"medecinNom":"CARDIO","medecinPrenom":"Jean","medecinSpecialite":{"identifiant":2,"libelleFR":"Cardiologie et maladies vasculaires"},"prestataireNom":"RYTHMO","prestatairePrenom":"JacK","prestataireSpecialite":{"identifiant":2,"libelleFR":"Cardiologie et maladies vasculaires"},"contexteMedical":{"antecedentsFamilles":[],"antecedentsFamillesText":[],"cvRisksSet":[],"symptomes":[],"symptomesText":[],"douleurCaracteristiques":[],"identifiant":919,"epworth":null,"antecedentsFamillesDefini":false,"cvRisks":false,"symptomesDefini":false,"douleurCaracteristiquesDefini":false},"informationMedicale":{"currentMedicaments":[],"identifiant":860,"poids":"1","taille":"2","temperature":null,"frequenceCardiaque":null,"suspicionSAS":null,"fumeur":null,"alcool":null,"fumerFrequence":null,"alcoolFrequence":null,"indexMasseCorporelle":2500,"commentaire":"a","arterialPressurePas":null,"arterialPressurePad":null}}',
    });
    // formData.fields.add(MapEntry("file", 'null'));
    // formData.fields.add(MapEntry("filesDescription", 'jljide'));
    formData.fields.add(MapEntry("nomsFichiersASupprimer", 'null'));

    var response = await _dio.post(
      '/api/dossier/modifier',
      // options: Options(
      //   // headers: headers,
      //   contentType: 'multipart/form-data',
      // ),
      // data: jsonEncode({
      //   "jsonData": 69,
      //   "file": [],
      //   "filesDescription": [],
      //   "nomsFichiersASupprimer": [],
      // }),
      data: formData,
    );
    print(response);
  }

  Future<void> deleteRecord(String id) => _record.deleteRecord(id);

  Future<Record> fullRecord(String id) async {
    final response = await _record.fullRecord(id);
    return response.record;
  }

  Future<List<Patient>> patientList(String filter, int maxResults) =>
      _patient.patientList(filter, maxResults);

  Future<List<Patient>> patientListForDoctor(
    String doctorId, {
    int? length,
    int? draw,
    int? start,
    List<Map<String, String>>? filters,
  }) async {
    final response = await _grid.data(
      GridRequest.patient(
        length: length ?? 0,
        draw: draw ?? 0,
        start: start ?? 0,
        filters: [
          {"dossierMedecinPrestataire": doctorId},
          ...?filters,
        ],
      ),
    );

    return GridPatientResponse.fromJson(jsonDecode(response)).data;
  }

  Future<List<NetworkDoctor>> doctorNetwork(String id) =>
      _user.getUserNetwork(id);

  Future<List<Establishment>> doctorEstablishments(String id) =>
      _establishment.userEstablishments(id);

  ZanalysPrivateApiClient._(String baseUrl, this._dio)
      : _document = DocumentAPI(_dio, baseUrl: baseUrl),
        _user = UserAPI(_dio, baseUrl: baseUrl),
        _patient = PatientAPI(_dio, baseUrl: baseUrl),
        _grid = GridAPI(_dio),
        _record = RecordAPI(_dio, baseUrl: baseUrl),
        _establishment = EstablishmentAPI(_dio, baseUrl: baseUrl);
}

Dio _createDioAuthClient({
  required bool isDebug,
  required String baseUrl,
  required BearerTokenProvider tokenProvider,
  required RefreshTokenCallback refreshTokenCallback,
}) {
  final dio = createDioClientWithBaseOptions(baseUrl);
  dio.interceptors.addAll([
    sourceInterceptor(),
    _refreshTokenInterceptor(
      dio,
      tokenProvider: tokenProvider,
      refreshTokenCallback: refreshTokenCallback,
    ),
    if (isDebug)
      LogInterceptor(
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        logPrint: (Object object) => _log.info(object.toString()),
      ),
  ]);
  return dio;
}

Interceptor _refreshTokenInterceptor(
  Dio baseClient, {
  required BearerTokenProvider tokenProvider,
  required RefreshTokenCallback refreshTokenCallback,
}) =>
    InterceptorsWrapper(
      onRequest: (options, handler) async {
        String? token = await tokenProvider();
        if (token == null || token.isEmpty) {
          return handler.reject(
              DioError(
                  requestOptions: options,
                  response: Response(
                    requestOptions: options,
                    statusCode: 401,
                  )),
              true);
        }
        options.headers['Authorization'] = 'Bearer:$token';
        return handler.next(options);
      },
      onError: (error, handler) async {
        //Handle 401 HTTP ERRORS and refresh token
        if (error.response?.statusCode == 401 &&
            error.requestOptions.path != '/auth/refresh') {
          await refreshTokenCallback();
          final token = tokenProvider();
          if (token != null && token.isNotEmpty) {
            error.requestOptions.headers['Authorization'] = 'Bearer:$token';

            final opts = Options(
                method: error.requestOptions.method,
                headers: error.requestOptions.headers);

            // form data workaround
            dynamic data = error.requestOptions.data;
            if (data is FormData) {
              data = FormData.fromMap({}..addEntries(data.fields));
            }

            final cloneReq = await baseClient.request(error.requestOptions.path,
                options: opts,
                data: data,
                queryParameters: error.requestOptions.queryParameters);

            return handler.resolve(cloneReq);
          } else {
            handler.reject(error);
          }
        } else {}
        handler.next(error);
      },
    );

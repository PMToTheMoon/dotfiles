import 'package:freezed_annotation/freezed_annotation.dart';

enum GridType {
  @JsonValue('GRID_PATIENT_EXPERT')
  patientExpert,
}

@JsonSerializable()
class GridRequest {
  const GridRequest();

  int start,
  int length,
  int draw,
  "gridType": "GRID_PATIENT_EXPERT"
  "filterParameters": [
    { "dossierMedecinPrestataire": "UC201812000004" },
    { "nom": "Mar"},
    { "prenom": "JEAN"},
    { "dateNaissanceDebut": "01/01/1945" },
    { "dateNaissanceFin": "01/01/1955"}
  ]


  factory GridRequest.fromJson(Map<String, dynamic> json) => _$GridPatientRequestFromJson(json);
}
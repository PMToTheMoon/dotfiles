import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final medicalContext = JsonSerializable('MedicalContext', {
  jsonField(
    'id',
    refer('int'),
    name: "identifiant",
  ),
  jsonField(
    'epworth',
    refer('String?'),
    name: "epworth",
  ),
  jsonField(
    'medicalHistory',
    refer('List<String>?'),
    name: "antecedentsFamilles",
  ),
  jsonField(
    'definedMedicalHistory',
    refer('bool?'),
    name: "antecedentsFamillesDefini",
  ),
  jsonField(
    'medicalHistoryText',
    refer('List<String>?'),
    name: "antecedentsFamillesText",
  ),
  jsonField(
    'cvRisks',
    refer('bool?'),
    name: "cvRisks",
  ),
  jsonField(
    'cvRisksSet',
    refer('List<String>?'),
    name: "cvRisksSet",
  ),
  jsonField(
    'symptoms',
    refer('List<String>?'),
    name: "symptomes",
  ),
  jsonField(
    'definedSymptomes',
    refer('bool?'),
    name: "symptomesDefini",
  ),
  jsonField(
    'symptomsText',
    refer('List<String>?'),
    name: "symptomesText",
  ),
  jsonField(
    'pain',
    refer('List<String>'),
    name: "douleurCaracteristiques",
  ),
  jsonField(
    'definedPain',
    refer('bool'),
    name: "douleurCaracteristiquesDefini",
  ),
});

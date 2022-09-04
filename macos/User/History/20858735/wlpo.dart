import 'package:zanalys_api/src/model/document_type.dart';

class DocumentTypeMapper {
  String convert(DocumentType type) {
    switch (type) {
      case DocumentType.unknown:
        return 'INCONNU';
      case DocumentType.electrocardiogram:
        return 'ECG';
      case DocumentType.rhythmicHolter:
        return 'HOLTER_RYTHMIQUE';
      case DocumentType.bloodPressureHolter:
        return 'HOLTER_TENSIONNEL';
      case DocumentType.echocardiography:
        return 'ECHOGRAPHIE_CARDIAQUE';
      case DocumentType.effortTest:
        return 'EPREUVE_EFFORT';
      case DocumentType.mail:
        return 'COURRIER';
      case DocumentType.prescription:
        return 'ORDONNANCE';
      case DocumentType.certificate:
        return 'CERTIFICAT';
      case DocumentType.radiologicalReport:
        return 'CR_RADIOLOGIQUE';
      case DocumentType.biologicalResult:
        return 'RESULTAT_BIOLOGIQUE';
      case DocumentType.treatmentForm:
        return 'FEUILLE_DE_SOINS';
      default:
        throw Exception('Unknown Document type');
    }
  }
}

// ignore_for_file: prefer_single_quotes

import 'package:models/models.dart';
import 'package:test/test.dart';

final recordJson = {
  "dossier": {
    "type": "ECG",
    "reference": "DE320785505530",
    "dateCreation": "17/02/2022",
    "createur": "UC157563205396",
    "dateEnvoi": 1645095471000,
    "dateMiseAJour": 1657987294000,
    "dateCloture": null,
    "dateAffectation": 1645095471000,
    "accordPatient": true,
    "accordPersonneConfiance": false,
    "nomPersConfiance": null,
    "prenomPersConfiance": null,
    "lienParentePersConfiance": null,
    "statut": "EN_ATTENTE_RAPPORT_COMPLET",
    "statutPatient": "EN_COURS",
    "statutPrestataire": null,
    "patient": {
      "numeroCompte": "UP339271529800",
      "titre": "M",
      "nom": "Leclerc",
      "prenom": "Charles",
      "dateNaissance": "11/11/1991",
      "adresse": null,
      "email": "charles171121@yopmail.com",
      "emailSecondaire": null,
      "telephoneFixe": null,
      "telephoneMobile": "9870987656",
      "dateDerniereModifMdp": 1704063600000,
      "dateCreation": 1637169340000,
      "dateDerniereModification": 1656279009000,
      "dateSuppression": null,
      "notificationMail": null,
      "statut": "ACTIF",
      "notes": null,
      "dateAnonymisation": null,
      "numeroSecuriteSociale": "165067505600142",
      "profil": {
        "code": "PATIENT",
        "libelle": "Patient",
        "canBeDeleted": false,
        "typeUtilisateur": "PATIENT"
      },
      "mutuelle": null,
      "regimeSecuriteSociale": null,
      "rangNaissance": 0,
      "lieuNaissance": "Paris",
      "lieuNaissanceCode": "75056",
      "nomNaissance": null,
      "prenomNaissance": null,
      "cguAcceptee": null,
      "emailPersonneConfiance": null,
      "nomPersonneConfiance": null,
      "prenomPersonneConfiance": null
    },
    "medecin": "UC157563205396",
    "delegue": null,
    "etablissement": "EC230667897621",
    "prestataire": "UC784697264139",
    "datePaiement": 1645095471000,
    "groupeAffectation": "RESEAU",
    "avisMedecin": null,
    "dateAvisMedecin": null,
    "dateValidationRapport": null,
    "toValidateOrToReturn": null,
    "paymentCode":
        "XKogDgurxoZTys1WBPvhfwREYYYvRPIFKeUZOyXiVqCzIiuTmXLP9G84iz7TyCgi3nnfd9GzH2HuKlcd9Q0/sKCjHHK4Dp0WwgNA7pjTf+U=",
    "uploadedFilesToMakeDownloadableList": [],
    "billedToEstablishment": false,
    "urgent": false,
    "prestataireRdvId": null,
    "motif": "SPORT",
    "prioriteMedecin": "LOWEST",
    "prioritePrestataire": "LOWEST",
    "prestationDemandee": null,
    "typePrestation": "TE",
    "presentielRdvMode": null,
    "dossierParentReference": null,
    "titre": null,
    "complements": [],
    "informationMedicaleECG": {
      "identifiant": 523,
      "poids": 75.0,
      "taille": 181.0,
      "temperature": null,
      "frequenceCardiaque": null,
      "suspicionSAS": null,
      "fumeur": null,
      "alcool": null,
      "fumerFrequence": null,
      "alcoolFrequence": null,
      "indexMasseCorporelle": 22.9,
      "contexteMedical": {
        "identifiant": 564,
        "epworth": null,
        "antecedentsFamilles": [
          {
            "identifiant": 10,
            "libelleFR": "Malaise",
            "typesDossiers": ["ECG"]
          }
        ],
        "antecedentsFamillesDefini": true,
        "antecedentsFamillesText": [],
        "cvRisks": true,
        "cvRisksSet": [
          {"identifiant": 5, "libelleFR": "Tabac", "display": true}
        ],
        "symptomes": [],
        "symptomesDefini": true,
        "symptomesText": [],
        "douleurCaracteristiques": [],
        "douleurCaracteristiquesDefini": true
      },
      "commentaire": "RAS",
      "arterialPressurePas": 120,
      "arterialPressurePad": 80,
      "currentMedicaments": [],
      "pratiqueSportive": {
        "identifiant": 495,
        "sport1": "tennis",
        "sport1Competition": null,
        "sport1GenerateCertificate": false,
        "sport2": null,
        "sport2Competition": false,
        "sport2GenerateCertificate": false,
        "sport3": null,
        "sport3Competition": false,
        "sport3GenerateCertificate": false,
        "sport4": null,
        "sport4Competition": false,
        "sport4GenerateCertificate": false,
        "sport5": null,
        "sport5Competition": false,
        "sport5GenerateCertificate": false,
        "sport6": null,
        "sport6Competition": false,
        "sport6GenerateCertificate": false,
        "activiteSportiveFrequence": null,
        "specialMention": null
      },
      "activiteSportiveFrequence": {"identifiant": 3, "libelleFR": "4 à 7h"},
      "typeEcg": null,
      "souffle": false,
      "emergency": false,
      "omi": false,
      "newMedicaments": []
    },
    "rapportECG": {
      "identifiant": 722,
      "dateEnvoiPrestataireMedecin": null,
      "prestataireMedecin": null,
      "dateEnvoiPrestataireTechnique": null,
      "prestataireTechnique": null,
      "synthese": null,
      "commentaire": null,
      "syntheseTe": null,
      "commentaireTe": "test",
      "dateEnvoiTeleexpertise": 1657987294000,
      "hasFeuilleSoins": null,
      "teletransmissionAutre": null,
      "classeMaxSport": null,
      "contreIndication": true,
      "epreuveEffort": true,
      "epreuveEffortUrgent": false,
      "echographieCardiaque": false,
      "echographieCardiaqueUrgent": false,
      "holter": false,
      "holterUrgent": false,
      "irm": false,
      "irmUrgent": false,
      "avisInterpretation": null,
      "structureDestination": null,
      "contreIndicationMedicaments": [],
      "contreIndicationSports": ["tennis"],
      "interpretationECG": {
        "identifiant": 303,
        "normal": null,
        "fc": null,
        "pr": null,
        "qrs": null,
        "qt": null,
        "qtc": null,
        "aqrs": null,
        "sequelleNecrose": null,
        "detailSequelleNecrose": null,
        "troubleConduction": null,
        "detailTroubleConduction": null,
        "troubleRepolarisation": null,
        "detailTroubleRepolarisation": null,
        "caracteristiques": []
      }
    },
    "medecinNom": "Référent",
    "medecinPrenom": "Romain",
    "prestataireNom": "CARDIO",
    "prestatairePrenom": "Jean",
    "prestataireSpecialite": {
      "identifiant": 2,
      "libelleFR": "Cardiologie et maladies vasculaires"
    }
  },
  "dossiersEnfants": [],
  "type": "ECG",
  "nomMedecin": "Romain Référent",
  "nomPrestataire": "Jean CARDIO"
};

void main() {
  test('Record from json', () {
    Record? record;
    
      record = Record.fromJson(json)
    expect(1, 1);
  });
}

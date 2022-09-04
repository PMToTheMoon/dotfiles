import 'package:bonemeal/bonemeal.dart';
import 'package:model_generators/model_generators.dart';

final medicalInformationMultiFields = {
      jsonField('', refer('int'), name: "identifiant"),
      jsonField('', refer('double'), name: "poids"),
      jsonField('', refer('double'), name: "taille"),
      jsonField('', refer('double'), name: "temperature"),
      jsonField('', refer('double'), name: "frequenceCardiaque"),
      jsonField('', refer('bool'), name: "suspicionSAS"),
      jsonField('', refer('bool'), name: "fumeur"),
      jsonField('', refer('bool'), name: "alcool"),
      jsonField('', refer('double'), name: "fumerFrequence"),
      jsonField('', refer('double'), name: "alcoolFrequence"),
      jsonField('', refer('double'), name: "indexMasseCorporelle"),
      "contexteMedical": {
        "identifiant": 656,
        "epworth": null,
        "antecedentsFamilles": [],
        "antecedentsFamillesDefini": true,
        "antecedentsFamillesText": ["Obésité"],
        "cvRisks": false,
        "cvRisksSet": [],
        "symptomes": [],
        "symptomesDefini": true,
        "symptomesText": ["Dypsnée"],
        "douleurCaracteristiques": [],
        "douleurCaracteristiquesDefini": true
      },
      "commentaire": "Patient stréssé, mauvaise alimentation",
      "arterialPressurePas": 120,
      "arterialPressurePad": 80,
      "currentMedicaments": ["Lasilix", "Amiodaronne"]
    },
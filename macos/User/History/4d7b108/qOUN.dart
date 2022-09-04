import 'package:bonemeal/bonemeal.dart';
import 'package:ipr/ipr.dart';
import 'package:model_generators/model_generators.dart';

final medicalContextFields = {
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
      };

final medicalInformationMultiFields = {
      jsonField('id', refer('int'), name: "identifiant"),
      jsonField('weight', refer('double'), name: "poids"),
      jsonField('height', refer('double'), name: "taille"),
      jsonField('temperature', refer('double'), name: "temperature"),
      jsonField('heartRate', refer('double'), name: "frequenceCardiaque"),
      jsonField('SasSuspected', refer('bool'), name: "suspicionSAS"),
      jsonField('smoker', refer('bool'), name: "fumeur"),
      jsonField('alcohol', refer('bool'), name: "alcool"),
      jsonField('smokeFrequency', refer('double'), name: "fumerFrequence"),
      jsonField('alcoholFrequency', refer('double'), name: "alcoolFrequence"),
      jsonField('bodyMassIndex', refer('double'), name: "indexMasseCorporelle"),
      nestedJsonField(fieldName, type, '')
      "commentaire": "Patient stréssé, mauvaise alimentation",
      "arterialPressurePas": 120,
      "arterialPressurePad": 80,
      "currentMedicaments": ["Lasilix", "Amiodaronne"]
    },
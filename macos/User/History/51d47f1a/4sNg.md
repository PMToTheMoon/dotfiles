J'ai un problème sur l'envoie du rapport (multi), je reçois une erreur 400 sans explication, j'ai testé plusieurs configurations mais rien n'y fait.
Voici un sample de ce que j'envoie (J'ai plus de champs que néscessaire pour éviter les problèmes de champs non-nullable):
```json
{
  "rapport": {
    "identifiant": 0,
    "referenceDossier": "DE918016662837",
    "prestataireMedecin": "UC201812000005",
    "capturePayment": null,
    "dateEnvoiPrestataireMedecin": null,
    "synthese": "Motif",
    "commentaire": "Observation",
    "syntheseTe": "Motif",
    "commentaireTe": "Observation",
    "dateEnvoiTeleexpertise": null,
    "interpretationMulti": "Motif",
    "prestataireTechnique": null,
    "hasFeuilleSoins": null,
    "teletransmissionAutre": false
  },
  "completedRapport": false,
  "typeDossier": "MULTI",
  "referenceDossier": "DE918016662837",
  "typePrestation": "TE",
  "presentielRdvMode": "RAPPELE",
  "uploadedFilesToMakeDownloadableList": []
}
```
Je vais avoir besoin d'aide car sans message d'erreur je ne sais pas où chercher, je passe à la suite pour ne pas perde de temps.
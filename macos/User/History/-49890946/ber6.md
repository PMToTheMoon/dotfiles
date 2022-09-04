# App Client

## Inscription
* [X] Page signn
    - [X] traductions
    - [X] phone number error traduction
    - [X] formulaire
        - [X] password
        - [X] validators
        - [X] icons tél, mail et mdp
        - [X] email autovalidate mode
        - [X] ~~rendre le bouton "S'inscrire" cliquable/dynamique si toutes les informations sont saisies comme le bouton "Commander" sur la page de réservation~~ refusé
    - [X] Bloc
    - [X] disable sign-in button if field is null
    - [X] send form data to code page
* [ ] Validation code
    - [X] page
        - [X] champs
        - [X] focus
    - [X] receive form data
    - [X] requete api
        - [X] send code
            - [X] format form data
        - [X] "doperson"
    - [ ] gestion erreur
        - [ ] invalid code mystery ..
    - [X] retry code on invalid code
    - [X] redirect to sign-in on other err
* [X] redirection

## Home
* [X] Modifier champ commentaire => Commentaire + => Au clic, affichage du champ pour ajouter commentaire.
* [X] reserver trajet retour: set resa value

## Selection addresses
* [X] flight
    * [X] "Numéro de vol" input
    * [X] timedelta
    * [X] api request
    * [X] redesign page
    * [X] je n'ai pas de numéro

## Moyen de paiement
* [ ] ajouter un moyen de paiement
    - [ ] bouton app bar
    - [ ] requête api

## Passager form
- [X] disable sign-in button if field is null


[X] - Changer la couleur du lien "Pas encore de compte, s'inscrire" => code couleur #337ab7

Page Inscription
[X] Sous le mot de passe indiquer message : Doit contenir 12 caractères minimum, dont au moins une majuscule, un chiffre et un caractère spécial.
~~[ ] Pour le champ numéro de téléphone, il est actuellement possible de saisir un numéro de tél fixe => obliger la saisie d'un numéro de téléphone~~
[X] Champ téléphone => Modifier le texte "Numéro de téléphone" par "Numéro de mobile"  (À dupliquer sur champ Numéro de téléphone pour l'ajout d'un passager)
[X] Rendre le bouton "S'inscrire" cliquable/dynamique si toutes les informations sont saisies comme le bouton "Commander" sur la page de réservation.

Page Mon compte
Modifier format affichage du numéro de mobile : +33 6 51 80 99 15 vs +33 65 18 09 91 5

Page Mon train
Text d'aide pour le champ numéro de train en plus du label. => Mettre par défaut 4 chiffres : 6644 vs 55294

Page Détail de mon trajet (à venir)
Mettre le champ commentaire sous l'adresse de destination et ajouter un espace sous le champ commentaire pour séparer de : Réserver le trajet retour / Contacter le service client / Annuler la course.

Page réservation
A la suite de l'affichage du prix, est-il possible de mettre la catégorie de véhicule. Exemple : "45.00 EUR TTC en Moto" ou "53.00 EUR TTC en Berline". 

Page "Ajouter un passager" => 
1. rendre le bouton "Valider" cliquable/dynamique si Nom Prénom et Tél sont saisis.

Popup récapitulatif de commande : Modifier champ commentaire => Commentaire + => Au clic, affichage du champ pour ajouter commentaire.

Page passagers et Moyen de paiement => "+ Ajouter un passager" /  "+ Ajouter un moyen de paiement"   => mettre ces 2 liens avec code couleur #337ab7 et ajouter "+" avant le texte.



----

# Future
- [ ] ajouter required sur postcode dans favorite addresses et addresse api

- [ ] when intl_phone_field 3.1.0 published, use pub instead of git
- [ ] when state_machine_bloc will be published, use pub instead of git

## Détails paiement
- [ ] afficher type de paiement dans les détails à la place du tag de status (api non prete)

## Missing api
- [ ] forgot password
- [ ] getme trips field comment

## To be validated request
- [ ] paiement
    - [ ] webview
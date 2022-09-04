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

## Selection addresses
* [ ] flight
    * [X] "Numéro de vol" input
    * [ ] timedelta
    * [ ] api request

## Moyen de paiement
* [ ] ajouter un moyen de paiement
    - [ ] bouton app bar
    - [ ] requête api

## Passager form
- [ ] disable sign-in button if field is null



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
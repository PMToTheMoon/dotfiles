# App Client

## Sign in
* [ ] mot de passe oublié

## Inscription
* [ ] Validation code
    - [ ] gestion erreur
        - [ ] invalid code error (info api required)

## Selection addresses
* [X] "CONTINUER quand meme" boutton that return flight number
* [ ] Fix Bug => je sélectionne en adresse de départ aéroport Orly =>je saisis un vol qui arrive en fait à Roissy (AF1243) => le retour à la page adresse/Adresse de départ indique Orly vs Roissy.

## Moyen de paiement
* [ ] ajouter un moyen de paiement
    - [ ] bouton app bar
    - [ ] requête api

## Page de contact
* [ ] form
* [ ] api

## profile
* [ ] mot de passe oublié

## feedbacks
* [X] Afficher champ sélection de date en dessous du champ numéro de vol.
* [X] modifier texte "Continuer sans numéro" par "Je n'ai pas de numéro de vol"
* [X] modifier texte "Votre vol arrivera à l'aéroport Roissy CDG T2F le 13 avr. 2022 à 19:45" par le texte ci-dessous avec un encadrement :
Arrivée prévue 
(Icône calendrier) Mercredi 13 Avril à 19:45
(Icône avion atterrissage de couleur rouge) Aéroport Roissy CDG T2F

Page récap course
* [X] Afficher le numéro de vol dans le récap de course : Ex: Roissy CDG T2F (AF1227)


* [ ] Remettre flèche retour arrière (nécessaire si le client a saisi un aéroport par erreur)
2. Fix Bug => je modifie un numéro de vol saisi => je laisse la même date et/ou je valide la même date, il n'y a pas d'interrogation à l'API Flightstats (je suis obligé de modifier la date pour qu'une nouvelle interrogation à l'API ait lieu) => Voir le déclenchement de l'interrogation à l'API Flightstats.
3. Fix Bug => sur page de réservation, je saisi une date par exemple le 19 Avril, je sélectionne aéroport Orly => je saisi un numéro de vol (UX1027) => la date de la page réservation (19 Avril) étant déjà sélectionnée, il n'y pas d'interrogation à l'API flightstats.



Page Code de vérification
1. Mise en forme avec titre de la page "Code de vérification" et utilisation police de caractère de l'application.
* [X] Modifier texte : Merci d'entrer le code de vérification envoyé par SMS au "+33781398852"
* [X] Afficher le premier tiret du code de vérification en couleur rouge.
* [X] Une fois le code de vérification saisi, ajouter un spinner si attente du retour API.
5.[X] Si c'est possible, forcer l'affichage du clavier sur cette page étant donné qu'il faut saisir le code de vérification.

Pour info, j'ai eu un Bug sur la page Code de vérification mais pas réussi à le reproduire:
une fois le code de vérification saisi, la page est restée figée.


Page Inscription
1.Inscription possible même si déjà inscrit (même mail) => message erreur qui s'affiche après validation du code de vérification : "Une erreur est survenue lors de la création de votre compte" => Si erreur de création du compte du fait que le mail est déjà utilisé, afficher message d'erreur spécifique : "Une erreur est survenue lors de la création de votre compte. Cette adresse e-mail est déjà enregistrée".
2. Fix Bug => Création de compte, une fois le code de vérification validé, on arrive sur la page de réservation => il semble que la page ne soit pas "vierge" au niveau de la date et l'horaire, la date et l'horaire actuel est prérempli avec le message "Lé départ de la course ne peut pas être antérieur au 14 avr. 2022 18h45" ainsi que le mode de paiement.


----

# Future
- [ ] ajouter required sur postcode dans favorite addresses et addresse api
- [ ] when state_machine_bloc will be published, use pub instead of git

## Détails paiement
- [ ] afficher type de paiement dans les détails à la place du tag de status (api non prete)

## Missing api
- [ ] forgot password
- [ ] getme trips field comment
- [ ] contact

## To be validated request
- [ ] paiement
    - [ ] webview
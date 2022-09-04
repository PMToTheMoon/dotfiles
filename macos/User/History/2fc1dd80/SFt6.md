# Ogranisation du projet
Le projet est découpé en 5 packages.
Le package principale, zanalys, contient le code de l'application.
Les autres packages se trouvent dans le dossier `packages/` à la racine du projet.
- Le package `translations` contient toutes les translation du projet.
- Le package `models` contient tous les models partagés dans l'application.
- Le package `zanalys_api` contient les abstractions de l'api zanalys.
- Le package `common` est une library de widgets et de fonctions utilitaires réutilisables.

Les packages suivent une organisation feature-based. Ayant travaillé sur une base existante il est possible que certaines parties ne respectent pas exactement cette organisation nottammant les écrans de login, la logique d'authentication et l'envoie des documents.

# Dépendences
Ce projet utilise [build_runner](https://pub.dev/packages/build_runner) dans le package principale et dans les sous-packages.

Les models sont générés avec [freezed](https://pub.dev/packages/freezed) et [jsonSerializable](https://pub.dev/packages/json_serializable).

Le client api utilise [dio](https://pub.dev/packages/dio) comme client http et [retrofit](https://pub.dev/packages/retrofit) pour générer les appels api. Ces dépendences ont étés introduites par le premier développeur de l'application, toutefois à l'usage retrofit pose problème sur les requètes form-multi-part. Idéalement je conseillerais d'abandoner cette dependence pour [http](https://pub.dev/packages/http) et [chopper](https://pub.dev/packages/chopper), néamoins le client utilise actuellemnt les intercepteurs qui sont propre à dio. Ils sont nottement utilisé pour accéder et mettre à jour le bearer token lors des requêtes. Changer ces dépendences implique de revoir la façon dont le bearer token est managé.

Ce projet utilise [bloc](https://pub.dev/packages/bloc) comme solution de state management et [get_it](https://pub.dev/packages/get_it) comme dependency locator.
Les repositories du pattern bloc ne s'appellent pas `Repository` mais `Service` et sont injectés avec get_it dans les fichiers `lib/app/entrypoints/main_{flavor}.dart`.

# Architecture

## Clients API
Il existe deux types de clients API: public et private.
- Le client public est responsable des requètes ne néscéssitant aucune authentification(login, sign-in, ...)
- Le client privé est responsable des requètes néscéssitant authentification. Il prend en dépendence le repository d'authentification pour acceder et mettre à jour le bearer token en cas d'erreur `Unauthenticated`.

## Authentication
Le repository AuthService encapsule les appels relatifs à la connexion. Il expose des streams `AuthStatus` et `User` (ce dernier étant reçu en retour de la requête login).

Le repository UserService est reponsable de toute les requête relatives à l'utilisateur connecté. Il à été, au fur et à mesure du dev, séparé en plusieurs repository qui regroupent les requêtes par theme: `DocumentService`, `PatientService`, `DoctorService`, `RecordService`.

## Records
Le service `RecordService` et tous les blocs associées sont utilisées nottement pour la création et la visualisation des dossiers patient. Ils sont trouvble dans la feature [record](/lib/record) Un sépration entre les différent types de dossiers sera peut-être néscéssaire à terme en fonction des différences entre les type de dossier.

## Patient
Le service `PatientService` et tous les blocs associées sont utilisées dans l'onglet détails patient, ils sont trouvable dans la feature [patient](/lib/patient)

## Doctor
Le service doctor, trouvable dans le dossier [doctor](/lib/doctor) n'est à l'heure actuelle utilisé uniquement dans la feature [record](/lib/record) pour ajouter des docteurs au dossier.

## Document
Le service document est utilisé pour upload des documents à la reception d'une notification. N'ayant pas travailé sur cette partie du projet, les détails techniques reste assez flou pour moi. Firebase est utilisé pour la récéption de notifications, l'initialization de firebase est effectué dans le fichier [app.dart](lib/app/app.dart). 


## Organisation des écrans
Ce projet utilise des navigateurs imbriqués pour permettre l'indépendance entre chaque onglet de la bottom navigation bar. Ansi, chaque onglet (home, patients, documents, ...) dispose de sont propore navigateur. Les différentes section de l'app dont définies dans la fichier (root.dart)[/lib/root/root.dart]. Chaque section contient un fichier `{section}_root.dart`. Déclarant le navigateur imbriqué à l'aide du widget `NestedNavigator`.
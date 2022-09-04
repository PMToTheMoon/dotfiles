# lot 0
# Mises à niveau
Migration vers dart 2.1.
Migration vers Flutter 3.
Ajout de flutter_lints et refacto du code problèmatique.

# Dependences
Mises à jour des dépendences.
Remplacement d'easy_localization par l10n.
Supression de size_utils.
Intégartion de freezed.
Remplacement de fimber par logging.
Supression des helpers blocs custom en faveur des widgets flutter_bloc.

# Package Common
Creation du package common
Identification du contenu réutilisable et migartion vers common.

# Theme
Extraction du theme de sa déclaration dans app.dart.

# Routeur
Refonte du router custom en faveur du routeur par défaut.

# Repository
Creation du repository responsable de l'authentification (AuthService dans le code).
Creation du repository responsable de l'utilisateur (UserService dans le code).

Bonus:

Refonte de l'architecture pour une architecture feature-based
Integration de flutter_gen pour éviter les d'utiliser une API basée sur des string pour acceder au assets.


# API
[X] [opt] Extraction de l'API dans un package séparé.
[X] [opt] Refonte de l'architecture API.

# Theme
[X] [opt] TextTheme
[X] [opt] ColorScheme
[X] [opt] AppBarTheme
[X] [opt] ButtonTheme

[X] Creation du repository responsable de l'upload de documents (DocumentService dans le code)
# lot 0
Mises à niveau
Migration vers dart 2.1.
Migration vers Flutter 3.
Ajout de flutter_lints et refacto du code problèmatique.

Architecture
- Refonte de l'architecture pour une architecture feature-based

# Package Common
Creation du package common
Identification du contenu réutilisable et migartion vers common.

# Theme
Extraction du theme de sa déclaration dans app.dart

Bonus:
# API
[X] [opt] Refacto API architecture
[X] [opt] Extract API to separate packgae

# Theme
[X] Extraire le theme de la déclaration de la material app
[X] TextTheme
[X] ColorScheme
[X] AppBarTheme
[X] [opt] ButtonTheme
[ ] [opt] Dimensions class

# Routeur
[X] Refonte du router custom en faveur du routeur par défaut

# Dependences
[X] Mises à jour des dépendences 
[X] Remplacement d'easy_localization par l10n
[X] supression size_utils
[X] Intégartion de freezed
[X] Remplacement de fimber par logging
[X] Supréssion des helpers blocs custom en faveur des widgets flutter_bloc natifs
[X] Integration flutter_gen
[ ] [opt] Remove formz

# Repository
[X] Intégration Authentification repository
[X] Intégartion User repository
[X] [opt] Intégartion User repository
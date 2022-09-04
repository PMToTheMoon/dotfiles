# lot 0
# Mises à niveau
Migration vers dart 2.1.
Migration vers Flutter 3.
Ajout de flutter_lints et refacto du code problématique.

# Dependences
Mises à jour des dépendances.
Remplacement d'easy_localization par l10n.
Suppression de size_utils.
Intégration de freezed.
Remplacement de fimber par logging.
Suppression des helpers bloc customs en faveur des widgets flutter_bloc.

# Package Common
Création du package common.
Identification du contenu réutilisable et migration vers common.

# Theme
Extraction du thème de sa déclaration dans app.dart.

# Routeur
Refonte du router custom en faveur du routeur par défaut.

# Repository
Création du repository responsable de l'authentification (AuthService dans le code).
Création du repository responsable de l'utilisateur (UserService dans le code).

# Bonus
Refonte de l'architecture pour une architecture feature-based.
Intégration de flutter_gen pour éviter les d'utiliser une API basée sur des Strings pour accéder aux assets.
Extraction de l'API Zanalys dans un package séparé.
Refonte de l'architecture API Zanalys.
Ajout de certains thèmes manquants: TextTheme, ColorScheme, AppBarTheme, ButtonTheme.
Création du repository responsable de l'upload de documents (DocumentService dans le code).
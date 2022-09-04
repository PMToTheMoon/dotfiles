Pepper est un générateur de code pour Flutter.

Pepper est fondé sur ce principe fondateur:
Plustôt que d'utiliser des techniques de programmation avancées pour faire convenir le language a nos besoins, il vaut mieux générer du code simple et spécialisé à partir d'abstraction haut niveau.

Concrétement, Pepper fait 2 choses:
- premièrement, parser des un ou plusieurs fichier "input"
- deuxièmement, générer du code en ce basant sur les données fournies.

Les fichiers d'entrés sont le plus souvent écrit en yaml, mais il n'y a aucune limite au format du fichier. Le but de ces inputs sont de représenté au mieux un problème donné. C'est ce qu'on appel des domain spécifique language.


Guidlines:
    - Faire du code simple et spécialisé.
    Ne pas chercher à faire du code générique. La refacto est gratuite lorsuqu'on utilise un generateur de code. Si une abstraction est néscessaire à un moment T, la modification sera simplement appliqué au générateur.
    Ne pas chercher à anticiper les abstraction évite bien souvent de faire des abstractions sous-optimales.
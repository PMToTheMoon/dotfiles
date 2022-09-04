LoginIn
- Changement de la couleur du lien vers la page inscription

SignIn
- Le bouton de la page sign-in est maintenant bloqué temps que le formulaire n'est pas valide.
- Ajout de la page de verification de code et implementation du processus d'inscription
- Changement du message d'erreur du champs mot de passe
- Numéro de téléphone renomer en numéro de mobile

Home
- Le champ commentaire de la pop-up de recap est cacher par défaut
- Ajout de la page sélection du numéro de vol
- changement hint train field
- Affichage du vehicule derrière le prix de la course

Profil
- fix du format du numéro de téléphone

Passenger
- Le bouton valider du formulaire d'ajout de passager est bloqué tant que le formulaire n'est pas valide
- Changement de la couleur du bouton ajouter un passage et ajout de l'icon '+'

Trip details
- Le champ commentaire est maintenant affiché sous les addresses de départ et d'arrivé
- Le bouton "reserver trajet retour" ouvre la page de selction de vol ou de train si le point de départ de la reservation retour est un aéroport ou une gare

Bugs:
- settrip: champ timedelta
- passenger n'était pas envoyé dans le settrip
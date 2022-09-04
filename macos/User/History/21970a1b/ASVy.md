# Router
- utilisation de go_router_prototype pour profiter de la nouvelle API
  raisons: les shell route et les nested navigators
- le package contient des bugs et a des features manquantes.
- le package est en train d'être transformé en package officiel (maintenue par a team flutter), la nouvelle api devrait rapidement devenir stable.

# UI Kit
- Swicthes, radios and checkboxes does not completely follow design spec  due to vanilla widget limitations.

# Profile popover menu
- abandon du package popover car causait des erreur avec bloc et provider
-> creation du menu à la main
-> le widget actuel est un prototype pour tester le comportement du menu
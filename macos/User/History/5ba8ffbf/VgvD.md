Page, Flow, (Feedback?)

**Canvas:**
Un Fragment fournit un cardre vidusuel pour l'affichage des layout et défini les contraintes initiales des layouts subsequents.
Les Canvas peuvent contenir des options spécifique.
Les Canvas contiennent au moins 1 layout.

basics:
  - Screen
  - Modal
  - DrawerMenu
specialized:
  - BottomBarNavigation
  - RetractableHeaderScreen...

**Layouts:**
Un layout partitionne l'espace et place des widgets enfants en fonction des contraintes du parent.
Un layout exporte un certain nombre de slots. Les widgets enfants sont attribués à des slots.
Les layout peuevnt être définit en tant qu'nefant d'autre layout.


Un fichier layout est responsable de la responsivité.

- de la responsivité de l'app. 

basics:
  - Custom
  - Fill
  - HorizontalScroll
  - VerticalScroll

**Widgets**
  - Dialog
  - Form
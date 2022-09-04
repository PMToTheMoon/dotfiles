NamedPage, Flow, (Feedback?)

**Widgets|Fragments**
  - layout
  - Dialog
  - Form
  - Canvas

**Canvas|Root:**
Un Canvas fournit les contraintes initiales pour l'affichage des widgets subsequents.
basics:
  - Screen
  - Modal
  - DrawerMenu
specialized:
  - BottomBarNavigation
  - RetractableHeaderScreen...

**Layouts:**
Un layout partitionne l'espace et place des widgets enfants en fonction des contraintes du parent.
Un layout exporte un certain nombre de slots. Les slot corspondent a des widgets enfant.

Les layouts sont responsables de la responsivité.
plusieurs sous-layout peuvent être défini au sein d'un même layout. Si c'est le cas, le layout le plus adapté au contraintes du parent est affiché. Voir [layout algorythms]().

basics:
  - Custom
  - Fill
  - HorizontalScroll
  - VerticalScroll
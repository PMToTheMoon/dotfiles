### Skeleton

### Repositories

### DataSources

### Activity|EntryPoint
- NamedPage
- Flow
- InfiniteFetchList

### MetaWidgets|Fragments
Meta widgets is a meta representation of one ore more widget in the widget tree.
Meta widgets can contain logic and parameters that influence their behavior.
They can have 0 or more child meta widget 
**Meta widgets list (not exhaustive)**
- Canvas
- Layout
- Dialog
- Form

**Canvas**
Un Canvas fournit les contraintes initiales pour l'affichage des widgets subsequents.
basics:
  - Screen
  - Modal
  - DrawerMenu
specialized:
  - BottomBarNavigation
  - RetractableHeaderScreen...

**Layouts**
Un layout partitionne l'espace et place des widgets enfants en fonction des contraintes du parent.
Un layout exporte un certain nombre de slots. Les slot corspondent a des widgets enfant.

Les layouts sont responsables de la responsivité.
plusieurs sous-layout peuvent être défini au sein d'un même layout. Si c'est le cas, le layout le plus adapté au contraintes du parent est affiché. Voir [layout algorythms]().

basics:
  - Custom
  - Fill
  - HorizontalScroll
  - VerticalScroll
  - Grid
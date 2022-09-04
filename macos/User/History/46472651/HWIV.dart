import 'package:bonemeal_core/src/foundations/element.dart';


// the outputed gen
// possible names: RootElement? BuildElement, GenElement, TargetElement ?
class OutputElement extends Element {}

class DirectoryElement extends Element {}

class FileELement {}


class DartProjectElement {}

class LibraryElement extends Element {

  Library get library();
}

class BarrelElement {}

class ClassElement extends Element {
  ClassElement(super.metaObject);

}
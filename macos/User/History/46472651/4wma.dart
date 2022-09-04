import 'package:bonemeal_core/src/foundations/element.dart';


class OutputElement extends Element {}

class DirectoryElement extends Element {}

class FileELement {}



class LibraryElement extends Element {

  Library get library();
}

class BarrelElement {}

class ClassElement extends Element {
  ClassElement(super.metaObject);

}
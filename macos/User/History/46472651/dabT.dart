import 'package:bonemeal_core/src/foundations/element.dart';


// visit every chilldren and write specs on disk
// refs are resolved here
// contains emitter
class OutputElement extends Element {

}

class PathElement extends Element {

}

class FileELement {}

class LibraryElement extends Element {

  Library get library();
}

class BarrelElement {}

class ClassElement extends Element {
  ClassElement(super.metaObject);

}
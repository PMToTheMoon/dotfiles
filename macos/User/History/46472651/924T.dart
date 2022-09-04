import 'package:bonemeal_core/src/foundations/element.dart';


// visit every chilldren and write specs on disk
class OutputElement extends Element {

}

class LibraryElement extends Element {

  Library get library();
}

class ClassElement extends Element {
  ClassElement(super.metaObject);

}
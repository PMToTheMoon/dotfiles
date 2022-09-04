import 'package:bonemeal_core/src/foundations/element.dart';


class LibraryElement extends Element {

  void write() {
    visitor;
    visitChildren(visitor);
    output(vistor) // How ?
  }
}

class ClassElement extends Element {
  ClassElement(super.metaObject);

}
import 'package:bonemeal_core/src/foundations/element.dart';


// the outputed gen
// possible names: RootElement? BuildElement, GenElement, TargetElement ?
class OutputElement extends Element {

    // write files to disk or cache trought writter
    void out(Writter writer) {}
}

class DirectoryElement extends Element {
  DirectoryElement(super.metaObject, {
    required this.name,
  });

  String name;
}

class FileELement {}




///zzzz
class DartProjectElement extends OutputElement {}

class Package extends Element {}

class LibraryElement extends Element {

  Library get library();
}

class BarrelElement {}

class ClassElement extends Element {
  ClassElement(super.metaObject);

}
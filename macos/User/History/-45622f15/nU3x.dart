typedef ElementVisitor = void Function(Element element);

abstract class Element {
  Element? parent;

  void visitChildren(ElementVisitor visitor) {}
}

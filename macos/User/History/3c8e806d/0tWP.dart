import 'package:meta/meta.dart';

import 'element.dart';

abstract class ComponentElement<T extends MetaObject> extends Element<T> {
  ComponentElement(super.metaObject);

  Element? _child;

  @protected
  MetaObject build();

  @override
  void visitChildren(ElementVisitor visitor) {
    if (_child != null) {
      visitor(_child!);
    }
  }
}

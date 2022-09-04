import 'package:code_builder/code_builder.dart';

import 'method.dart';

extension CallClassMethod on Class {
  Expression callMethod(String name) {
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }

  Expression callMethod(String name) {
    final method = methods.firstWhere((c) => c.name == name);
    return method.call();
  }
}

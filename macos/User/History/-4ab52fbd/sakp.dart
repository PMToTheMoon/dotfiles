import 'package:code_builder/code_builder.dart';

extension CallClassMethod on Class {
  Expression call(String symbol) {
    final method = methods.firstWhere((c) => c.name == symbol);
    return method.call();
  }
}

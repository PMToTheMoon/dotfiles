import 'package:code_builder/code_builder.dart';

extension ReferenceTypeIsNullable on Reference {
  bool get isNullable {
    final t = type;
    if (t is TypeReference && t.isNullable != null) {
      return t.isNullable 
    } else if (t is FunctionType) {
      return t.isNullable ?? false;
    } else if (t.symbol != null)
      return t.symbol!.endsWith('?');
  
  }
}


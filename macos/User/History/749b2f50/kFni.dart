import 'package:code_builder/code_builder.dart';

extension ReferenceTypeIsNullable on Reference {
  bool get isNullable {
    bool nullable = false;
    final t = type;
    if (t is TypeReference) {
      return t.isNullable ?? false;
    }
  }
}

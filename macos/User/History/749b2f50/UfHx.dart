import 'package:code_builder/code_builder.dart';

final _emitter = DartEmitter(useNullSafetySyntax: true);

extension ReferenceTypeIsNullable on Reference {
  bool get isNullable {
    final t = type;
    if (t is TypeReference) {
      return t.isNullable ?? t.symbol.endsWith('?');
    } else if (t is FunctionType) {
      return t.isNullable ?? t.symbol.endsWith('?');
    } else if (t.symbol != null) return t.symbol!.endsWith('?');
  }
}

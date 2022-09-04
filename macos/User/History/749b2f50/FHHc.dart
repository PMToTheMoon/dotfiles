import 'package:code_builder/code_builder.dart';

final _emitter = DartEmitter(useNullSafetySyntax: true);

extension ReferenceTypeIsNullable on Reference {
  bool get isNullable {
    final e = type.accept(_emitter).toString();
    return e.endsWith('?');
  }
}

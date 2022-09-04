import 'package:bonemeal/src/formatter.dart';
import 'package:code_builder/code_builder.dart';

export 'package:code_builder/code_builder.dart';

final _emitter = DartEmitter(useNullSafetySyntax: true);

/// Share formatter and emitter for all generators
String renderCode(Library library) =>
    formatDartCode('${library.accept(_emitter)}');

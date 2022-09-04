import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

final _formatter = DartFormatter();
final _emitter = DartEmitter(useNullSafetySyntax: true);

/// Share formatter and emitter for all generators
String renderCode(Library library) =>
    _formatter.format('${library.accept(_emitter)}');

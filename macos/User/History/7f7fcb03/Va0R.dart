part of 'generators.dart';

final dartEmitter = DartEmitter.scoped(
  orderDirectives: true,
  useNullSafetySyntax: true,
);

final dartFormatter = DartFormatter();

class DartOutputBuilder extends OutputBuilder {
  final LibraryBuilder _library = LibraryBuilder();

  LibraryBuilder get library => _library;

  @override
  String build() {
    return dartFormatter.format('${_library.build().accept(dartEmitter)}');
  }
}

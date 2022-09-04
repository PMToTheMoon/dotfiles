part of 'generators.dart';

final dartEmitter = DartEmitter.scoped(
  orderDirectives: true,
  useNullSafetySyntax: true,
);

final dartFormatter = DartFormatter();

class DartAssetBuilder extends AssetContentBuilder {
  DartAssetBuilder();

  final LibraryBuilder _library = LibraryBuilder();

  LibraryBuilder get library => _library;

  ListBuilder<Expression> get annotations => _library.annotations;

  ListBuilder<Spec> get body => _library.body;

  ListBuilder<Directive> get directives => _library.directives;

  @override
  String build() {
    return dartFormatter.format('${_library.build().accept(dartEmitter)}');
  }
}

part of 'generators.dart';

final dartEmitter = DartEmitter.scoped(
  orderDirectives: true,
  useNullSafetySyntax: true,
);

final dartFormatter = DartFormatter();

class DartAssetBuilder extends AssetContentBuilder {
  const DartAssetBuilder();

  final LibraryBuilder _library = LibraryBuilder();

  LibraryBuilder get library => _library;

  ListBuilder<Expression> annotations = ListBuilder<Expression>();

  ListBuilder<Spec> body = ListBuilder<Spec>();
  ListBuilder<Directive> directives = ListBuilder<Directive>();

  @override
  String build() {
    return dartFormatter.format('${_library.build().accept(dartEmitter)}');
  }
}

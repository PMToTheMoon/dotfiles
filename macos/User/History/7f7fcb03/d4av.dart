part of 'generators.dart';

final dartEmitter = DartEmitter.scoped(
  orderDirectives: true,
  useNullSafetySyntax: true,
);

final dartFormatter = DartFormatter();

class DartFragment extends AssetFragment {
  final LibraryBuilder _library = LibraryBuilder();

  LibraryBuilder get library => _library;

  @override
  void update(DartFragment updates) {
    _library.update(updates.library);
    _library + _library;
  }

  @override
  String build() {
    return dartFormatter.format('${_library.build().accept(dartEmitter)}');
  }
}

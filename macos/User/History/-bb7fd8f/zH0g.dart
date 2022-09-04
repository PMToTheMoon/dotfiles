import 'package:code_builder/code_builder.dart';

class DirectiveAllocator implements Allocator {
  final _imports = <String>{};

  @override
  String allocate(Reference reference) {
    final url = reference.url;
    if (url != null) {
      _imports.add(url);
    }
    return reference.symbol!;
  }

  @override
  Iterable<Directive> get imports => _imports.map((u) => Directive.import(u));
}

import 'package:code_builder/code_builder.dart';

class BuildStepAllocator implements Allocator {
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
  Iterable<Directive> get imports {
    return _imports.map((u) => Directive.import(u));
  }
}

class PartOfAllocator implements Allocator {
  PartOfAllocator(
    this.partOf,
    this.parent,
  );

  final String partOf;
  final Allocator parent;

  @override
  String allocate(Reference reference) {
    return parent.allocate(reference);
  }

  @override
  Iterable<Directive> get imports {
    return [Directive.partOf(partOf)];
  }
}

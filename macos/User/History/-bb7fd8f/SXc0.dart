import 'package:code_builder/code_builder.dart';

class BuildStepAllocator implements Allocator {
  final _imports = <String>{};

  bool _collected = false;

  @override
  String allocate(Reference reference) {
    final url = reference.url;
    if (url != null) {
      _imports.add(url);
    }
    return reference.symbol!;
  }

  void allocateForPart(Reference reference) {
    if (_collected)
      throw UnsupportedError(
          'A part of meta object has been built after parent');
  }

  @override
  Iterable<Directive> get imports {
    _collected = true;
    return _imports.map((u) => Directive.import(u));
  }
}

class PartOfAllocator implements Allocator {
  PartOfAllocator(
    this.partOf,
    this.parent,
  );

  final String partOf;
  final BuildStepAllocator parent;

  @override
  String allocate(Reference reference) {
    return parent.allocate(reference);
  }

  @override
  Iterable<Directive> get imports {
    return [Directive.partOf(partOf)];
  }
}

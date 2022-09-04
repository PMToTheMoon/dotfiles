import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;

class BuildStepAllocator implements Allocator {
  BuildStepAllocator(this.root);

  final String root;

  final _imports = <String>{};
  final _parts = <String>{};

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
    return _imports.map((url) {
      if (url.startsWith('package:')) return Directive.import(url);
      final relativeUrl = p.relative(url, from: root);
      return Directive.import(relativeUrl);
    });
  }
}

class PartOfAllocator implements Allocator {
  PartOfAllocator(this.ownerPath, this._delegate);

  final String ownerPath;
  final Allocator _delegate;

  @override
  String allocate(Reference reference) {
    return _delegate.allocate(reference);
  }

  @override
  Iterable<Directive> get imports {
    return [Directive.partOf(ownerPath)];
  }
}

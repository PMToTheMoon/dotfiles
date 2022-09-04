import 'package:code_builder/code_builder.dart';
import 'package:path/path.dart' as p;

class BuildStepAllocator implements Allocator {
  BuildStepAllocator(this.path);

  final String path;

  final _imports = <String>{};
  final _parts = <String>{};

  void part(String path) {
    _parts.add(path);
  }

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
    final imports = _imports.map((url) {
      if (_own(url)) return null;
      if (url.startsWith('gen:')) return _resolveGenDirective(url);
      if (url.startsWith('package:')) return Directive.import(url);
      final relativeUrl = p.relative(url, from: path);
      return Directive.import(relativeUrl);
    });
    final parts = _parts.map((url) => Directive.part(url));
    return [
      ...imports.whereType<Directive>(),
      ...parts,
    ];
  }

  String _resolveGenUrl(String url) {
    final extension = url.substring('gen:'.length);
    final file = p.basename(path);
    return p.setExtension(file, extension);
  }

  bool _own(String url) {
    final file = p.basename(url);
    return _parts.any((part) => p.basename(part) == file);
  }
}

class PartOfAllocator implements Allocator {
  PartOfAllocator(this.ownerPath, this.partPath, this._delegate);

  final String ownerPath;
  final String partPath;
  final Allocator _delegate;

  @override
  String allocate(Reference reference) {
    return _delegate.allocate(reference);
  }

  @override
  Iterable<Directive> get imports {
    return [Directive.partOf(p.relative(ownerPath, from: p.dirname(partPath)))];
  }
}

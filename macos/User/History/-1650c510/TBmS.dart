class DartEmitterVisitor {
  void call(MetaObject object) {}

  void visitLibrary(Library library) {
    final specs = <int>[];
    void getChildSpecs(MetaObject object) {
      if (object is SpecBuilder) {
        specs.add(object.buildSpec());
      }
      object.visitChildren(getChildSpecs);
    }

    getChildSpecs(library);
    final librarySpec = library.build(specs);
    DartEmitter();
  }
}

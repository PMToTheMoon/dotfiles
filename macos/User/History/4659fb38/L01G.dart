class MetaObjectSlot {
  const MetaObjectSlot({
    required this.inline,
  });

  //indicate whatever the meta object is declared inline or in separated file
  bool get inline => inlineDeclaration != null;

  final String? path;
  final String? inlineDeclaration;
}

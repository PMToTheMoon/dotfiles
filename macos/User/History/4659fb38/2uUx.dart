class MetaObjectSlot {
  const MetaObjectSlot({
    required this.inline,
  });

  //indicate whatever the meta object is declared inline or in separated file
  final bool inline;
  final String? path;
}

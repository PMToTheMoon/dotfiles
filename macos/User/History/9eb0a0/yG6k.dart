final builderKeyExpando = Expando<String>();

final packageExpando = Expando<String>();

class BuildTarget {
  String get key => builderKeyExpando[this]!;
}

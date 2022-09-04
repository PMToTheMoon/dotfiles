import 'input_set.dart';

final builderKeyExpando = Expando<String>();

final packageExpando = Expando<String>();

class BuildTarget {
  BuildTarget({required this.sources});

  String get key => builderKeyExpando[this]!;
  String get package => packageExpando[this]!;
  final InputSet sources;
}

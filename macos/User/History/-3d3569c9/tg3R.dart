import 'package:bonemeal/bonemeal.dart';

class Prop {
  Prop(this.name, this.type);

  final String name;
  final Reference type;
  final bool toThis;
  final bool optional;

  Parameter toParam() => param(name);
}

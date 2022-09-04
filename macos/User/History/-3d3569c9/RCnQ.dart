import 'package:bonemeal/bonemeal.dart';

class Prop {
  Prop(this.name, this.type);

  final String name;
  final Reference type;
  final bool toThis;
  final bool named;
  final bool? required;

  Parameter toParam() => param(
        name,
        type: type,
        toThis: toThis,
        required: required ?? type.isNullable,
      );
}

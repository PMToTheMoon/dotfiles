import 'package:bonemeal/bonemeal.dart';
import 'package:collection/collection.dart';

class Prop {
  Prop(
    this.name,
    this.type, {
    this.toThis = true,
    this.named = true,
    this.annotations = const [],
    this.required,
  });

  final String name;
  final Reference type;
  final bool toThis;
  final bool named;
  final bool? required;
  final List<Expression> annotations;

  Parameter toParam() => param(
        name,
        type: type,
        toThis: toThis,
        named: named,
        required: required ?? type.isNullable,
      );

  Field toField() => field(
        name,
        type,
        modifier: FieldModifier.final$,
        annotations: annotations,
      );
}

class Props extends DelegatingSet<Prop> {
  Props(super.base);

  Fields toFields() => Fields(map((p) => p.toField()).toSet());

  Parameters toParams() => Parameters(map((p) => p.toParam()).toSet());
}

import 'package:bonemeal/bonemeal.dart';
import 'package:collection/collection.dart';

Property prop(
  String name,
  Reference type, {
  bool? toThis,
  bool? named,
  bool? required,
  List<Expression>? annotations,
}) =>
    Property(
      name,
      type,
      toThis: toThis,
      named: named,
      annotations: annotations,
      required: required,
    );

class Property {
  Property(
    this.name,
    this.type, {
    bool? toThis,
    bool? named,
    List<Expression>? annotations,
    this.required,
  })  : toThis = toThis ?? true,
        named = named ?? true,
        annotations = annotations ?? const [];

  final String name;
  final Reference type;
  final bool toThis;
  final bool named;
  final List<Expression> annotations;
  final bool? required;

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

class Properties extends DelegatingSet<Property> {
  Properties(super.base);

  Fields toFields() => Fields(map((p) => p.toField()).toSet());

  Parameters toParams() => Parameters(map((p) => p.toParam()).toSet());
}

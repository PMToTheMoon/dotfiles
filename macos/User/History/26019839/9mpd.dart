import 'package:code_builder/code_builder.dart';

import 'code_compose.dart';

Method method(
  String name,
  Reference returns,
  Code body, {
  bool lambda = true,
  Set<Parameters> parameters = const {},
}) =>
    Method((m) => m
      ..name = name
      ..returns = returns
      ..lambda = lambda
      ..type = MethodType.getter
      ..body = body);

Method getter(String name, Reference type, Code body, {bool lambda = true}) =>
    Method((m) => m
      ..name = name
      ..returns = type
      ..lambda = lambda
      ..type = MethodType.getter
      ..body = body);

Method setter(String name, Reference type, Code body, {bool lambda = true}) =>
    Method((m) => m
      ..name = name
      ..requiredParameters.add(param('value', type: type))
      ..lambda = lambda
      ..type = MethodType.setter
      ..body = body);

extension CodeComposeMethodExtension on Method {
  /// [owner] produce a method call of form owner.method
  Expression call({
    String? owner,
    ValueResolver? values,
  }) {
    final symbol = owner != null ? '$owner.$name' : name;
    if (symbol == null) throw 'Invalid call of a unnamed method';
    final resolver = values ?? SelfReferResolver();
    return refer(symbol).call(
      resolver.resolveRequiredParameters(requiredParameters),
      resolver.resolveOptionalParameters(optionalParameters),
    );
  }

  bool get returnsVoid => returns?.isVoid() ?? true;

  Set<Parameter> get allParameters =>
      {...requiredParameters, ...optionalParameters};

  Properties get allParamsAsProps => Properties({
        ...requiredParameters.map((p) => p.toProp()),
        ...optionalParameters.map((p) => p.toProp()),
      });

  Fields toFields() => Fields.fromMethodParameters(this);
}

import "package:recase/recase.dart";
import 'package:code_builder/code_builder.dart';
import 'package:dart_style/dart_style.dart';

class Member {
  const Member({
    required this.type,
    required this.name,
  });
  final String type;
  final String name;
}

class ClassGen {
  const ClassGen();

  String? generate(String name, dynamic data) {
    if (data is! Map) {
      return null;
    }

    final classes = [];
    final Parameter = [];

    for (final e in data.entries) {
      if (e.value is Map) {
        classes.add(generate(e.key, e.value));
      }
      members.add(Parameter(
        (p) => p..name = e.key,
      ));
    }

    final params = data.keys.map((key) => Parameter(
          (p) => p..name = key,
        ));

    final fields = data.entries.map(
      (e) => Field(
        (f) => f
          ..name = e.key
          ..type = refer(e.value),
      ),
    );

    final outputClass = Class(
      (c) => c
        ..name = name.pascalCase
        ..constructors.add(
          Constructor(
            (ctr) => ctr..optionalParameters.addAll(params),
          ),
        )
        ..fields.addAll(fields),
    );

    final emitter = DartEmitter(useNullSafetySyntax: true);
    return DartFormatter().format('${outputClass.accept(emitter)}');
  }
}

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
    if (data is! Map<String, dynamic>) {
      return null;
    }

    final classes = <String>[];
    final members = <Member>[];

    for (final e in data.entries) {
      if (e.value is Map) {
        classes.add(generate(e.key.pascalCase, e.value)!);
        members.add(Member(type: e.key.pascalCase, name: e.key));
      } else {
        members.add(Member(type: e.value, name: e.key));
      }
    }

    final params = members.map((m) => Parameter(
          (p) => p..name = m.name,
        ));

    final fields = members.map(
      (e) => Field(
        (f) => f
          ..name = e.name
          ..type = refer(e.type),
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
    outputClass.accept(emitter);
    classes.add(
      DartFormatter().format('${outputClass.accept(emitter)}'),
    );
  }
}

import 'package:bloc_generators/src/repository/repository_source.dart';
import 'package:bonemeal/bonemeal.dart';

export 'repository_source.dart';

class Repository extends MetaObject {
  Repository({
    required this.constructor,
    required this.subject,
    required this.items,
  });

  final Constructor constructor;
  final String subject;
  final Iterable<RepositoryItem> items;
  final Iterable<Field> fields;
  final Iterable<Method> methods;

  @override
  String get path => '${subject.snakeCase}_repository.dart';

  @override
  void build(BuildStep step) {
    final allFields = [...items.expand((i) => i.fields), ...fields];

    final allMethods = [...items.expand((i) => i.methods), ...methods];

    final repository = Class(
      (c) => c
        ..name = '${subject.pascalCase}Repository'
        ..constructors.add(constructor)
        ..fields.addAll(allFields)
        ..methods.addAll(allMethods),
    );

    final library = Library(
      (l) => l..body.add(repository),
    );
    step.emit(library);
  }
}
